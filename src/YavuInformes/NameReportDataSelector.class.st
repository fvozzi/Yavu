Class {
	#name : #NameReportDataSelector,
	#superclass : #ReportDataSelector,
	#instVars : [
		'customersFound',
		'customerName'
	],
	#category : #'YavuInformes-View'
}

{ #category : #accessing }
NameReportDataSelector >> buscarCliente [

	| cliente |
	cliente := self financialView call: (WACustomerFinder new firstLettersOfName: self customerName).
	cliente notNil ifTrue: [
		self customersFound: (Array with: cliente).
		self customerName: cliente name.
		].
	self next
]

{ #category : #accessing }
NameReportDataSelector >> clientesDeNombre: unString [

	self customersFound:  (YavuPerson customersOfNameBeginsWith: unString).
	^self customersFound 
]

{ #category : #updating }
NameReportDataSelector >> crearNuevoInforme [
	"Privado - Crea un nuevo informe en función a los parametros ingresado por el usuario."

	^FinancialReport on: self selectedCustomer
]

{ #category : #accessing }
NameReportDataSelector >> customerName [
	
	^ customerName
]

{ #category : #accessing }
NameReportDataSelector >> customerName: anObject [
	
	customerName := anObject
]

{ #category : #accessing }
NameReportDataSelector >> customersFound [
	
	customersFound isNil ifTrue: [ customersFound := OrderedCollection new ].
	^customersFound
]

{ #category : #accessing }
NameReportDataSelector >> customersFound: anObject [
	
	customersFound := anObject
]

{ #category : #'as yet unclassified' }
NameReportDataSelector >> documentNumber [

	^self selectedCustomer ifNotNil: [ :one | one documentNumber ]
]

{ #category : #'as yet unclassified' }
NameReportDataSelector >> labelForTab [

	^'Busqueda por Nombre'
]

{ #category : #updating }
NameReportDataSelector >> nombreDeClienteSinDocumento [

	| sub |
	sub := self customerName subStrings: '-'.
	^sub size = 2 
		ifTrue: [sub first copyFrom: 1 to: (sub first size-1)]
		ifFalse: [sub first]
]

{ #category : #rendering }
NameReportDataSelector >> renderContentOn: html [
	"Renderiza el ingreso de datos requeridos por el receptor."

	html div id: 'firstStep'; with: [ 
	super renderContentOn: html.
	html div id: 'ingresoNombre'; with: [
		html div class: 'titulo2'; with: [ html text: 'Ingrese parte del Apellido y Nombre o denominación:'].
		html textInput
      		id: html lastId;
			value: self customerName;
      		script: (html jQuery this autocomplete
         		sourceCallback: [:string | self clientesDeNombre: string ]);
			callback: [:nombre | self customerName: nombre].
		html submitButton
				callback: [ self buscarCliente ];
				text: 'Buscar' 
			].
	self renderButtonNextOn: html ].
	"self renderElectoralRollCaptchaOn: html"
]

{ #category : #updating }
NameReportDataSelector >> selectedCustomer [

	^self customersFound detect: [:each | each name = self nombreDeClienteSinDocumento] ifNone: []
]

{ #category : #'as yet unclassified' }
NameReportDataSelector >> tabIndex [

	^2
]
