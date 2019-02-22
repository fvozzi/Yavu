Class {
	#name : #ReportDataSelector,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'commerce',
		'showBCRACaptcha',
		'owner'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
ReportDataSelector class >> showBCRACaptcha: aBoolean owner: aMultipleReportDataSelector [

	^super new 
		showBCRACaptcha: aBoolean;
		owner: aMultipleReportDataSelector;
		yourself 
]

{ #category : #accessing }
ReportDataSelector >> afipDataReader [

	^self showBCRACaptcha 
		ifTrue: [self financialView afipDataReader]
		ifFalse: [ nil ]
]

{ #category : #accessing }
ReportDataSelector >> bcraData [

	^self showBCRACaptcha 
		ifTrue: [self financialView bcraDataReader]
		ifFalse: [ nil ]
]

{ #category : #updating }
ReportDataSelector >> captchasMap [

	^self financialView captchasMap
]

{ #category : #accessing }
ReportDataSelector >> commerce [ 
	"Devuelve el comercio al que se le imputará la emisión del informe.
	NOTA: si el usuario tiene un solo comercio, entonces, se usa ese."

	commerce isNil ifTrue: [self initializeCommerce].
	^commerce
]

{ #category : #accessing }
ReportDataSelector >> commerce: aCommerce [

	commerce:= aCommerce
]

{ #category : #rendering }
ReportDataSelector >> completedFirstStep [
	^ self documentNumber notNil and: [ (self documentNumber size between: 6 and: 9) or: [ self documentNumber size = 11 ] ]
]

{ #category : #rendering }
ReportDataSelector >> cssClassTag [

	^self showBCRACaptcha 
		ifTrue: [ #basicPlusReportData ]
		ifFalse: [ #basicReportData ]
]

{ #category : #accessing }
ReportDataSelector >> extractDNINumber [ 


	(self documentNumber size = 11and: [#('20', '27', '23') includes: (self documentNumber copyFrom: 1 to: 2)]) ifTrue: [ 
		self documentNumber: (self documentNumber copyFrom: 3 to: 10 )
		]
]

{ #category : #accessing }
ReportDataSelector >> financialView [
	
	^ self owner financialView
]

{ #category : #updating }
ReportDataSelector >> generarInforme [

	self next.
	self padronDataReader dni: (self documentNumber).
	self padronDataReader getCaptchaImage.
	self owner reportDataSelected = self ifTrue: [ 
		self financialView generarInforme ]
]

{ #category : #accessing }
ReportDataSelector >> initializeCommerce [

	commerce := self session user defaultCommerce
]

{ #category : #'as yet unclassified' }
ReportDataSelector >> next [

	self owner reportDataSelected ifNil: [ 
		self owner reportDataSelected: self owner tryToGuestReportDataSelected].
	"self owner reportDataSelected generarInforme"
]

{ #category : #accessing }
ReportDataSelector >> owner [
	
	^ owner
]

{ #category : #accessing }
ReportDataSelector >> owner: anObject [
	
	owner := anObject
]

{ #category : #accessing }
ReportDataSelector >> padronDataReader [

	^self financialView padronDataReader
]

{ #category : #rendering }
ReportDataSelector >> pedirComercioAlUsuario [

	^self 
		chooseFrom: self session user commerces 
		caption: 'Seleccione el comercio al que se imputará el informe' 
		onAnswer: [:value | self commerce: value]
]

{ #category : #rendering }
ReportDataSelector >> renderAfipCaptchaOn: html [
	"Si el receptor esta configurado para renderizar el captcha, lo hace."

	self showBCRACaptcha 
		ifTrue: [ 
			html div
				id: 'ingresoAfipCaptcha';
				with: [ 
							html div
						class: 'titulo2';
						with: [ html text: 'Copie la palabra de la imagen (AFIP):' ].
							html textInput
								callback: [ :captcha | self setAfipDataReaderCaptcha: captcha ];
								value: self afipDataReader captchaCaracteres].
			html div
				id: 'afipCaptcha';
				with: [self afipDataReader captchaImagen
						ifNil: [ html text: 'Imagen No Disponible' ]
						ifNotNilDo: [ :imagen | html image form: imagen ]]]
]

{ #category : #rendering }
ReportDataSelector >> renderBCRACaptchaOn: html [
	html div
		id: 'ingresoBCRACaptcha';
		with: [ 
					html div
						class: 'titulo2';
						with: [ html text: 'Copie las dos palabras de la imagen (BCRA):' ].
					html textInput
						callback: [ :captcha | self setBCRACaptcha: captcha ];
						value: self bcraData captchaCaracteres ].
	^ html div
		id: 'bcraCaptcha';
		with: [ 
					self bcraData captchaImagen
						ifNil: [ html text: 'Imagen No Disponible' ]
						ifNotNilDo: [ :imagen | html image form: imagen ] ]
]

{ #category : #rendering }
ReportDataSelector >> renderButtonGenerateReportOn: html [
		
	html div id: 'generar'; with: [
		html submitButton text: 'Generar Informe'; callback: [self generarInforme]
		]
]

{ #category : #rendering }
ReportDataSelector >> renderButtonNextOn: html [
		
	
	"html div id: 'next'; with: [
		self completedFirstStep ifFalse: [ html submitButton text: 'Siguiente'; callback: [self next]
		]]."

		html div id: 'generar'; with: [
		html submitButton text: 'Generar Informe'; callback: [self generarInforme]
		]
]

{ #category : #rendering }
ReportDataSelector >> renderCaptchasOn: html [
	"Si el receptor esta configurado para renderizar el captcha, lo hace."

	self showBCRACaptcha
		ifTrue: [ 
			html div
				id: 'captchas';
				with: [ self 
						renderBCRACaptchaOn: html;
						renderAfipCaptchaOn: html ]
		]
]

{ #category : #rendering }
ReportDataSelector >> renderCommerceOn: html [
	"Renderiza el combo de selección de comercio si el usuario tiene más de un comercio asignado."

	self session yavuSystem allowedCommerces size > 1 ifTrue: [
		html div id: 'seleccionComercio'; with: [
			html div class: 'titulo2'; with: [html text: 'Seleccione el comercio al que se le facturará el informe:'].
			html select 
				list: self yavuSystem allowedCommerces asSortedCollection ;
				selected: (self commerce ifNil: [self session user defaultCommerce]);
			callback: [:comercioSeleccionado | self commerce: comercioSeleccionado].
		]
	]
]

{ #category : #rendering }
ReportDataSelector >> renderContentOn: html [
	"Renderiza el ingreso de datos requeridos por el receptor."

		self 
			renderCommerceOn: html;
			renderCaptchasOn: html
]

{ #category : #accessing }
ReportDataSelector >> setAfipDataReaderCaptcha: aSymbols [
	"Chequea si aSymbols tiene 6 digitos y lo setea como el BCRA Captcha y ya hace la busqueda en el BCRA."
	
	aSymbols notEmpty ifTrue: [ 
		self afipDataReader captchaCaracteres: aSymbols]
]

{ #category : #accessing }
ReportDataSelector >> setBCRACaptcha: aSymbols [
	"Chequea si aSymbols tiene 6 digitos y lo setea como el BCRA Captcha y ya hace la busqueda en el BCRA."
	
	aSymbols notEmpty ifTrue: [ 
		self bcraData captchaCaracteres: aSymbols]
]

{ #category : #accessing }
ReportDataSelector >> setPadronDataReaderCaptcha: aSymbols [
	"Chequea si aSymbols tiene 6 digitos y lo setea como el BCRA Captcha y ya hace la busqueda en el BCRA."

	(aSymbols notEmpty and: [1 = 0]) ifTrue: [ 
		self padronDataReader captchaCaracteres: aSymbols]
]

{ #category : #accessing }
ReportDataSelector >> showBCRACaptcha [
	
	^ showBCRACaptcha
]

{ #category : #accessing }
ReportDataSelector >> showBCRACaptcha: anObject [
	
	showBCRACaptcha := anObject
]
