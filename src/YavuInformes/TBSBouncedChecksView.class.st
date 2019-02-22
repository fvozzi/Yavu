Class {
	#name : #TBSBouncedChecksView,
	#superclass : #TBSCheckOperationView,
	#instVars : [
		'cause',
		'bouncedDate'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #'as yet unclassified' }
TBSBouncedChecksView class >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^WAYavuComponent
]

{ #category : #accessing }
TBSBouncedChecksView >> bouncedDate [
	
	^ bouncedDate
]

{ #category : #accessing }
TBSBouncedChecksView >> bouncedDate: anObject [
	
	bouncedDate := anObject
]

{ #category : #accessing }
TBSBouncedChecksView >> cause [
	
	^ cause
]

{ #category : #accessing }
TBSBouncedChecksView >> cause: anObject [
	
	cause := anObject
]

{ #category : #initialization }
TBSBouncedChecksView >> initializeTransactionData [
	"Resetea los datos ingresdos por el usuario para ingresar una nueva situación."

	super initializeTransactionData.
	cause := ''
]

{ #category : #creation }
TBSBouncedChecksView >> newTransaction [
	"Devuelve una nueva situacion comercial según los datos ingresados por el usuario."
	
	^super newTransaction 
		bouncedDate: (self convertirFecha: self bouncedDate);
		cause: self cause;
		yourself
]

{ #category : #rendering }
TBSBouncedChecksView >> renderSegundoPasoOn: html [
	"Renderiza el segundo paso del ingreso manual de la información."

	html heading level4 with: [html text: '2'].
	html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Ingrese todos los cheques rechazados que desee informar:'].
	html div id: 'fila1'; with: [
		html div class: 'columna'; with: [
			html div class: 'label'; with: [html text: 'N° Documento'].
			html textInput on: #documentNumber of: self.].
		html div class: 'columna'; with: [		
			html div class: 'label'; with: [html text: 'Tipo'].
			html select 
				list: CustomerType all;
				labels: [:each | each label ];
				selected: self customerType;
				callback: [:descripcionSexo | self customerType: descripcionSexo]].
		html div class: 'columna'; with: [				
			html submitButton text: 'Buscar'; callback: [self searchCustomer]].
		html div class: 'columna'; with: [
			html div id: 'nombre'; with: [
				self renderNombreDeClienteOn: html]]].
	html div id: 'fila2'; with: [
		html div class: 'columna'; with: [	
			html div class: 'label'; with: [html text: 'Fecha Rechazo'].
			html textInput
      			value: self bouncedDate;
      			callback: [ :value | self bouncedDate: value ];
      			script: (html jQuery new spanishDatepicker
         			onSelect: (html jQuery ajax serializeThis))].
		html div class: 'columna'; with: [			
			html div class: 'label'; with: [html text: 'Nro. cheque'].
			html textInput on: #checkNumber of: self].
		html div class: 'columna'; with: [			
			html div class: 'label'; with: [html text: 'Monto cheque'].
			html textInput on: #amountOfCheck of: self].
		html div class: 'columna'; with: [	
			html div class: 'label'; with: [html text: 'Banco'].
			html select 
				list: Bank all;
				selected: Bank default;
				callback: [:value | self bank: value]]].
	html div id: 'fila3'; with: [
		html div class: 'columna'; with: [			
			html div class: 'label'; with: [html text: 'Causa de rechazo'].
			html textInput on: #cause of: self].
		html div class: 'columna'; with: [
				html submitButton text: 'Agregar a la lista'; callback: [self agregar]]].
		self renderDescripcionErrorOn: html.
		html heading level3; with: [html text: 'Listado de cheques rechazados a procesar:'].
		html div id: #vistaPrevia; with: [self renderTransactionListOn: html].
]

{ #category : #accessing }
TBSBouncedChecksView >> transactionClass [

	^BouncedCheck
]

{ #category : #printing }
TBSBouncedChecksView >> transactionDescription [

	^'cheque rechazado.'
]

{ #category : #'as yet unclassified' }
TBSBouncedChecksView >> verifyTransactionData [
	"Devuelve true si el monto no es nil."
	
	[self amountOfCheck asNumber] on: Error do: [:ex | 
		self descriptionError: 'El monto debe ser un número.'.
		^false ].
	(super verifyTransactionData and:  [ 
		self amountOfCheck notEmpty]) ifTrue: [ ^true ].	
	self descriptionError: self descriptionError, ' Debe ingresar el monto del cheque.'.
	^false
]
