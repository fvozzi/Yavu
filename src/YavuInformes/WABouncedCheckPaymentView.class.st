Class {
	#name : #WABouncedCheckPaymentView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'commerce',
		'checkWithoutPayment',
		'bouncedChecks'
	],
	#category : #'YavuInformes-View'
}

{ #category : #accessing }
WABouncedCheckPaymentView >> bouncedChecks [
	
	bouncedChecks ifNil: [ self updateBouncedChecks ].
	^bouncedChecks 
]

{ #category : #accessing }
WABouncedCheckPaymentView >> bouncedChecks: anObject [
	
	bouncedChecks := anObject
]

{ #category : #accessing }
WABouncedCheckPaymentView >> cancel [

	self parent content: WAHomeView new
	
]

{ #category : #accessing }
WABouncedCheckPaymentView >> checkWithoutPayment [
	
	checkWithoutPayment ifNil: [ checkWithoutPayment := true ].
	^checkWithoutPayment
]

{ #category : #accessing }
WABouncedCheckPaymentView >> checkWithoutPayment: anObject [
	
	checkWithoutPayment := anObject
]

{ #category : #accessing }
WABouncedCheckPaymentView >> commerce [
	
	commerce ifNil: [ self initializeCommerce ].
	^commerce
]

{ #category : #accessing }
WABouncedCheckPaymentView >> commerce: anObject [
	
	commerce := anObject
]

{ #category : #updating }
WABouncedCheckPaymentView >> filter [

	self updateBouncedChecks 
]

{ #category : #accessing }
WABouncedCheckPaymentView >> initializeCommerce [

	commerce := self session user defaultCommerce
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> renderActionsOn: html [

	html submitButton callback: [self update];	text: 'Actualizar'.
	html submitButton callback: [self cancel];	text: 'Cancelar'
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> renderBouncedCheck: aBouncedCheck on: html [

	html div class: 'textColumn'; with: [html text: aBouncedCheck customer name].
	html div class: 'numericColumn'; with: [html text: aBouncedCheck checkNumber].
	html div class: 'dateColumn'; with: [html text: aBouncedCheck bouncedDate ddmmyyyy].
	html div class: 'numericColumn'; with: [html text: aBouncedCheck amountOfCheck].
	html div class: 'textColumn'; with: [html text: aBouncedCheck cause].
	html div class: 'dateColumn'; with: [html textInput
      								value: (aBouncedCheck finePaymentDate ifNotNil: [ :one | one ddmmyyyy]);
      								callback: [ :value | self setFinePaymentDate: value to: aBouncedCheck];
      								script: (html jQuery new spanishDatepicker
         								onSelect: (html jQuery ajax serializeThis))].
	html div class: 'dateColumn'; with: [html textInput
      								value:  (aBouncedCheck paymentDate ifNotNil: [ :one | one ddmmyyyy]);
      								callback: [ :value | self setPaymentDate: value to: aBouncedCheck];
      								script: (html jQuery new spanishDatepicker
         								onSelect: (html jQuery ajax serializeThis))]
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> renderBouncedChecksOn: html [
	"Renderiza el primer paso de la imortación"

	"html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Cheques rechazados']."
	html div class: 'row'; class: 'ui-widget-header';  class: 'ui-corner-all'; with: [ self renderTableTitlesOn: html].
	self bouncedChecks do: [ :each |
		html div class: 'row'; with: [ 
			self renderBouncedCheck: each on: html
			]
		 ]
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> renderCommerceOn: html [
	"Renderiza el primer paso de la imortación"

	html div class: 'label'; with: [html text: 'Seleccione el comercio'].
	html select 
		list: self session user sortedCommerces;
		selected: self commerce;
		callback: [:comercioSeleccionado | self commerce: comercioSeleccionado].
	html checkbox
            	value: self checkWithoutPayment ;
            	callback: [ :value | self checkWithoutPayment: value].
	html text: 'Ver solo cheques sin fecha de pago '.
	html submitButton callback: [self filter];	text: 'Filtrar'
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> renderContentOn: html [

	html form: [
		html div id: 'filter'; class: 'ui-corner-all'; with: [self renderCommerceOn: html].
		html div id: 'bouncedChecks'; with: [self renderBouncedChecksOn: html].
		html div id: 'actions'; with: [self renderActionsOn: html]
		]
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> renderTableTitlesOn: html [

	html div class: 'textColumn'; with: [html text: 'Emisor'].
	html div class: 'numericColumn'; with: [html text: 'Número'].
	html div class: 'dateColumn'; with: [html text: 'Fecha Rechazo'].
	html div class: 'numericColumn'; with: [html text: 'Monto'].
	html div class: 'textColumn'; with: [html text: 'Causa'].
	html div class: 'dateColumn'; with: [html text: 'Fecha Pago Multa'].
	html div class: 'dateColumn'; with: [html text: 'Fecha Pago']
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> setFinePaymentDate: aStringOrNil to: aBouncedCheck [

	(aStringOrNil notNil and: [aStringOrNil notEmpty]) ifTrue: [ 
		aBouncedCheck finePaymentDate: (self convertirFecha: aStringOrNil)]
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> setPaymentDate: aStringOrNil to: aBouncedCheck [

	(aStringOrNil notNil and: [aStringOrNil notEmpty]) ifTrue: [ 
		aBouncedCheck paymentDate: (self convertirFecha: aStringOrNil)]
]

{ #category : #updating }
WABouncedCheckPaymentView >> update [

	(self bouncedChecks select: [ :each |
		each finePaymentDate notNil or: [ each paymentDate notNil ]])
		do: [ :each | each updateObject ].
	self updateBouncedChecks 
]

{ #category : #accessing }
WABouncedCheckPaymentView >> updateBouncedChecks [

	self bouncedChecks: (self checkWithoutPayment 
							 ifTrue: [self commerce bouncedChecksWithoutPayment]
							 ifFalse: [self commerce bouncedChecks])
]

{ #category : #rendereing }
WABouncedCheckPaymentView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
    	anHtmlRoot stylesheet resourceUrl: '/css/updateBouncedChecks.css'
]
