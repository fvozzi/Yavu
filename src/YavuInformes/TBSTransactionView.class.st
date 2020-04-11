Class {
	#name : #TBSTransactionView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'elements',
		'commerce',
		'importador',
		'customer',
		'documentNumber',
		'customers',
		'searchedCustomer',
		'descriptionError',
		'customerName',
		'customerType'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #creation }
TBSTransactionView >> agregar [
	"Agrega una nueva linea"

	self searchedCustomer ifFalse: [self searchCustomer].
	self verificarDatos ifTrue: [
		self elements add: self newTransaction.
		self initializeTransactionData				
		]
]

{ #category : #'as yet unclassified' }
TBSTransactionView >> children [
	^ Array with: self elements
]

{ #category : #testing }
TBSTransactionView >> clienteActualONuevo [
	"Devuelve el cliente seleccionado o uno nuevo en caso de que no exista."
	
	self customer isNil ifTrue: [
		self customer: (YavuPerson numeroDeDocumento: self documentNumber nombre: self customerName sexo: self customerType code).
		customers add: customer].
	^self customer
					
]

{ #category : #accessing }
TBSTransactionView >> commerce [
	
	^ commerce
]

{ #category : #accessing }
TBSTransactionView >> commerce: anObject [
	
	commerce := anObject
]

{ #category : #accessing }
TBSTransactionView >> customer [
	
	^ customer
]

{ #category : #accessing }
TBSTransactionView >> customer: anObject [
	
	customer := anObject
]

{ #category : #accessing }
TBSTransactionView >> customerName [
	
	^ customerName
]

{ #category : #accessing }
TBSTransactionView >> customerName: anObject [
	
	customerName := anObject
]

{ #category : #accessing }
TBSTransactionView >> customerType [

	^customerType
]

{ #category : #accessing }
TBSTransactionView >> customerType: aCustomerType [
	customerType := aCustomerType
]

{ #category : #accessing }
TBSTransactionView >> customers [
	
	^ customers
]

{ #category : #accessing }
TBSTransactionView >> customers: anObject [
	
	customers := anObject
]

{ #category : #accessing }
TBSTransactionView >> date [
	"Devuelve la fecha actual del sistema."
	
	^Date today
]

{ #category : #creation }
TBSTransactionView >> deleteRenglon: aTransaction [
	"Elimina aSituacionComercial de la lista de situaciones del receptor."
	
	self elements remove: aTransaction.
	(self customers includes: aTransaction customer) ifTrue: [
		self customers remove: aTransaction customer]
]

{ #category : #accessing }
TBSTransactionView >> descriptionError [
	
	^ descriptionError
]

{ #category : #accessing }
TBSTransactionView >> descriptionError: anObject [
	
	descriptionError := anObject
]

{ #category : #accessing }
TBSTransactionView >> documentNumber [
	
	^ documentNumber
]

{ #category : #accessing }
TBSTransactionView >> documentNumber: anObject [
	
	documentNumber := anObject
]

{ #category : #accessing }
TBSTransactionView >> elements [
	
	^ elements
]

{ #category : #accessing }
TBSTransactionView >> elements: anObject [
	
	elements := anObject
]

{ #category : #creation }
TBSTransactionView >> guardarInformes [
	"Persiste las situaciones comerciales creadas por el receptor."
	
	self elements isEmpty ifTrue: [^self inform: 'Debe ingresar al menos una ', self transactionDescription].
	self customers do: [:each | each store].
	self elements do: [:each | each store].
	self resetear
]

{ #category : #accessing }
TBSTransactionView >> importador [
	
	^ importador
]

{ #category : #accessing }
TBSTransactionView >> importador: anObject [
	
	importador := anObject
]

{ #category : #initialization }
TBSTransactionView >> initialize [

	super initialize.
	elements := self transactionClass new asComponent.
	customers := OrderedCollection new.
	self initializeTransactionData
]

{ #category : #initialization }
TBSTransactionView >> initializeTransactionData [
	"Resetea los datos ingresdos por el usuario para ingresar una nueva situación."

	descriptionError := documentNumber := customerName :=  ''.
	customer := nil.
	searchedCustomer := false
]

{ #category : #rendering }
TBSTransactionView >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

	html form: [self render: self self transactionClass new asComponent  ] 
		
]

{ #category : #rendering }
TBSTransactionView >> renderDescripcionErrorOn: html [

	self descriptionError notEmpty ifTrue: [
		html div class: 'ui-corner-all ui-state-highlight'; with: [
			html paragraph: [ 
         			html span class: 'ui-icon ui-icon-info'.
         			html strong: 'Atención: '.
				html text: self descriptionError]
			]
		]
	

]

{ #category : #'as yet unclassified' }
TBSTransactionView >> renderMenuAyudaOn: html [
	"Renderiza el anchor de menu ayuda para el receptor.
	NOTA: cada clase que implemente la ayuda deberá definir la clase de ayuda."
	
	html div class: #ayuda; with: [html popupAnchor
		scrollbars: true;
		resizable: false;
		extent: 850 @ 600;
		position: 20 @ 20;
		 resourceUrl: 'help/financialSituationInput.html' ;
		location: false;
		menubar: false;
		with: 'Ayuda'
	]. 
]

{ #category : #rendering }
TBSTransactionView >> renderNombreDeClienteOn: html [

	html div class: 'label'; with: [html text: 'Nombre'].
	self customer 
		ifNil: [html textInput on: #customerName of: self] 
		ifNotNilDo: [:value | html text: value name]
]

{ #category : #rendering }
TBSTransactionView >> renderPrimerPasoOn: html [
	"Renderiza el primer paso de la imortación"

	html form: [  
		html tbsContainer: [ 
			html tbsFormGroup: [ 
				html label for: 'commerce'; with: 'Seleccione el comercio'.
				html select 
					class: 'form-control' ;
					list: self session yavuSystem allowedCommerces;
					selected: self selectedOrDefaultCommerce;
					callback: [:selected | self commerce: selected]
					].
		html tbsButton 
			bePrimary;
			callback: [ ];
			with: 'Siguiente'.
		]]
]

{ #category : #rendering }
TBSTransactionView >> renderTercerPasoOn: html [
	"Renderiza el primer paso de la importación"
	
	html heading level4 with: [html text: '3'].
	html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Confimar y guardar:'].
	html heading level1; with: [html text: 'Resumen de la información a procesar'].
	html heading level3; with: [html text: 'Se procesarán ', self elements size printString, ' informes nuevos.'].
	html heading level3; with: [html text: 'Se crearán ', self customers size printString, ' clientes nuevos.'].
	html submitButton text: 'Guardar Informes'; callback: [self guardarInformes].
]

{ #category : #rendering }
TBSTransactionView >> renderTransactionListOn: html [
	"Renderiza la tabla de situaciones comeciales que acabamos de procesar."
	
	| transaction |
	
	transaction := self elements ifEmpty: [self transactionClass new] ifNotEmpty: [self elements asOrderedCollection first].
	html render: ((MAReport rows: self elements description: transaction maDescriptionForReport)
					addColumn: (MACommandColumn new
						addCommandOn: self selector: #deleteRenglon: text: 'quitar';
						yourself);
					yourself)

]

{ #category : #initialization }
TBSTransactionView >> resetear [
	"Resetea toda la vista del receptor."
	
	self initialize
]

{ #category : #actions }
TBSTransactionView >> searchCustomer [

	[self documentNumber asNumber] on: Error do: [ :ex | ^self descriptionError: 'El número de documento debe ser un número valido.' ].
	self customer: (YavuPerson searchCustomerByNumber: self documentNumber customerType: self customerType).
	self searchedCustomer:  true
]

{ #category : #accessing }
TBSTransactionView >> searchedCustomer [
	
	^ searchedCustomer
]

{ #category : #accessing }
TBSTransactionView >> searchedCustomer: anObject [
	
	searchedCustomer := anObject
]

{ #category : #rendering }
TBSTransactionView >> selectedOrDefaultCommerce [

	^self commerce ifNil: [self session yavuSystem defaultCommerce]
]

{ #category : #printing }
TBSTransactionView >> textoDeAyuda [

	^self class textoDeAyuda
]

{ #category : #accessing }
TBSTransactionView >> transactionClass [

	^self subclassResponsibility
]

{ #category : #creation }
TBSTransactionView >> transactionDescription [

	^'transacción.'
]

{ #category : #testing }
TBSTransactionView >> verificarCliente [
	"Devuelve true si el cliente no es nil o si están ingresados los datos para dar de alta un nuevo cliente."
	
	self customer notNil ifTrue: [^true].
	(self customerName notEmpty and: [self documentNumber notEmpty]) ifTrue: [^true].
	self descriptionError: 'Debe ingresar un numero de documento y un nombre.'.
	^false
]

{ #category : #testing }
TBSTransactionView >> verificarDatos [
	"Devuelve true si el usuario ingreso todos los datos necesarios para ingresar una nueva situación comercial."
	
	^self verificarCliente and: [self verifyTransactionData]
]
