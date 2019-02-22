Class {
	#name : #WACustomerFinder,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'firstLettersOfName',
		'customers',
		'selectedCustomer'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WACustomerFinder >> aceptar [

	| tipo numeroDeDocumento denominacion customer |
	
	self selectedCustomer isNil ifTrue: [^self cancelar].
	customer := Person searchCustomerByCUIT: self selectedCustomer cuit.
	customer notNil ifTrue: [^self answer:  customer].
	tipo := CustomerType tipoSegunCUIT: self selectedCustomer cuit.
	numeroDeDocumento := tipo documentoSegunCUIT: self selectedCustomer cuit.
	denominacion := self selectedCustomer denominacion.
	self answer: (tipo newCustomerOfNumber: numeroDeDocumento name: denominacion)
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> cancelar [

	self answer: nil
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> customers [

	^customers
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> customers: aCollection [

	customers:= aCollection
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> firstLettersOfName [

	^firstLettersOfName
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> firstLettersOfName: aString [

	firstLettersOfName:= aString
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> normalizeToSubindex: aName [

	aName size >= 10 ifTrue: [^aName copyFrom: 1 to: 10].
	^aName, '     ' copyFrom: 1 to: aName size
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> renderContentOn: html [

	html form: [
		html div id: #ingresarNombre; with: [
			html div class: 'label'; with: [html text: 'Ingrese apellido y nombre:'].
			html textInput value: self firstLettersOfName; callback: [ :value | self firstLettersOfName: value].
			html submitButton
				callback: [[self seek] on: Error do: [:ex | self inform: ex description]];
				text: 'Buscar'].
		html div id: 'clientes'; with: [
			html div class: 'label'; with: [html text: 'Resultado obtenido:'].
			html select
				size: 25;
				list: customers;
				selected: self selectedCustomer;
				callback: [ :value | self selectedCustomer: value ]].
		html div class: 'acciones'; with: [
			html submitButton
				callback: [self aceptar];
				text: 'Aceptar'.
			html submitButton
				callback: [self cancelar];
				text: 'Cancelar']
	]
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> seek [
	"Busca en la BD de padrones a los clientes cuyo nombre comienza con firstLetterOfName.
	NOTA: por una cuestión de indices y performance tiene que ser exactamente los 5 primeros caracteres del nombre."
	
	| firstCharacters resultWithoutOrder |
	firstCharacters := self normalizeToSubindex: self firstLettersOfName.
	resultWithoutOrder := ExternalDatabaseObject datosClienteEnAlgunaBDParaSubNombre: firstCharacters.
	self customers: (resultWithoutOrder asSortedCollection: [:a :b | a denominacion < b denominacion])
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> selectedCustomer [

	^selectedCustomer
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> selectedCustomer: aCustomer [

	selectedCustomer:= aCustomer
]

{ #category : #'as yet unclassified' }
WACustomerFinder >> updateRoot: anHtmlRoot [

		super updateRoot: anHtmlRoot.  

    anHtmlRoot stylesheet resourceUrl: 'customerFinder.css'
]
