Class {
	#name : #YavuPerson,
	#superclass : #YavuEntity,
	#instVars : [
		'situacionesComerciales',
		'cuit'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
YavuPerson class >> atNumeroDeDocumento: unString sexo: otroString ifAbsent: aBlock [
	"Devuelve un invividuo o una organizacion dependiendo de si unString corresponde a un número de documento o a un número de cuit.
	NOTA: se debe tener en cuenta el sexo por existir números de dni repetidos entre varones y mujeres."

	^self atNumeroDeDocumento: unString sexo: otroString ifAbsent: aBlock session: nil


	
]

{ #category : #'sin categoria' }
YavuPerson class >> atNumeroDeDocumento: unString sexo: otroString ifAbsent: aBlock session: aSession [
	"Devuelve un invividuo o una organizacion dependiendo de si unString corresponde a un número de documento o a un número de cuit.
	NOTA: se debe tener en cuenta el sexo por existir números de dni repetidos entre varones y mujeres."

	| clientes |
	clientes:= (self sistema: aSession) clientes where: [ :each | (each documentNumber = unString)].
	^clientes detect: [:each | each documentNumber = unString and: [each sex = otroString]] ifNone: [aBlock value]


	
]

{ #category : #'sin categoria' }
YavuPerson class >> customersOfNameBeginsWith: firstsLetterOfName [
	"Devuelve una coleccion de clientes cuyo nombre comienza con unString."

	| likeExpression |
	likeExpression := firstsLetterOfName asUppercase, '%'.
	^self yavuSystem readManyOf: self where: [:each | each name asUppercase like: likeExpression]
]

{ #category : #'sin categoria' }
YavuPerson class >> descripcionNombre [
	
	^'Nombre'
]

{ #category : #'sin categoria' }
YavuPerson class >> named: unString [

	^self new initializeName: unString
]

{ #category : #'sin categoria' }
YavuPerson class >> numeroDeDocumento: unString nombre: unNombre sexo: otroString [
	"Crea una nueva instancia de alguna de las subclases del receptor dependiendo de otroString. Si es 'O'
	crea unaOraganizacion y si es 'F' o 'M' crea unIndividuo."
	
	^otroString = 'O'
		ifTrue: [YavuLegalPerson nombre: unNombre cuit: unString]
		ifFalse: [YavuNaturalPerson nombre: unNombre dni: unString sexo: otroString]
]

{ #category : #'sin categoria' }
YavuPerson class >> searchCustomerByCUIT: aCuitLiteral [
	"Devuelve una instancia del receptor desde la BD cuyo cuit es igual a aCUITLiteral."

	^self yavuSystem readOneOf: self where: [:each | each cuit = aCuitLiteral]
]

{ #category : #'sin categoria' }
YavuPerson >> = otroCliente [
	"Answer whether the receiver is equal to the argument."
	
	^super = otroCliente and: [self cuit = otroCliente cuit]
]

{ #category : #'as yet unclassified' }
YavuPerson >> bouncedChecks [
	"consulta en la BD los cheques rechazados del receptor y los devuelve."
	
	^self yavuSystem readManyOf:  BouncedCheck where:  [ :each | each customer = self ]
]

{ #category : #'sin categoria' }
YavuPerson >> cuit [

	cuit isNil ifTrue: [self inicializarCUIT].
	^cuit
]

{ #category : #'sin categoria' }
YavuPerson >> cuit: unCUIT [
	
	cuit:= unCUIT
]

{ #category : #'as yet unclassified' }
YavuPerson >> customerTypeClass [

	^CustomerType atCodigo: self customerType 
]

{ #category : #'sin categoria' }
YavuPerson >> descripcionNombre [
	
	^self class descripcionNombre
]

{ #category : #'sin categoria' }
YavuPerson >> documentNumber [
	"Devuelve el numero de documento del receptor."
	
	self subclassResponsibility
]

{ #category : #'sin categoria' }
YavuPerson >> documentNumberDescription [
	"Devuelve un objeto que describe la representaciÃ³n de la variable numero de documento del receptor."

	<magritteDescription>
	^MAStringDescription new 
         	accessor: #documentNumber;
        	label: 'NumeroDeDocumento';
        	priority: 120;
	  	required: true;
        	yourself
]

{ #category : #'sin categoria' }
YavuPerson >> eliminar [
	"Elimina la instancia del receptor a la colección de elementos del owner."
	
	^self sistema removerCliente: self
]

{ #category : #'as yet unclassified' }
YavuPerson >> financialSituations [

	^(self yavuSystem readManyOf: FinancialSituation where: [:each | each customer = self]) asOrderedCollection
]

{ #category : #'sin categoria' }
YavuPerson >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity."
	
	^super hash bitXor: self cuit hash
]

{ #category : #'sin categoria' }
YavuPerson >> initialize [

	super initialize.
	situacionesComerciales := OrderedCollection new
]

{ #category : #'as yet unclassified' }
YavuPerson >> isNaturalPerson [

	^false
]

{ #category : #'as yet unclassified' }
YavuPerson >> javascriptOn: aStream [

	| dn |
	
	dn := self documentNumber  ifNil: [ '' ].
	JSStream encodeString: self name, ' - ', self tipoDocumento, ': ', dn on: aStream
]

{ #category : #'as yet unclassified' }
YavuPerson >> lostChecks [
	"consulta en la BD los cheques perdidos del receptor y los devuelve."
	
	^self yavuSystem readManyOf:  LostCheck where:  [ :each | each customer = self ]
]

{ #category : #'as yet unclassified' }
YavuPerson >> reportEmissions [
	"consulta en la BD los cheques rechazados del receptor y los devuelve."
	
	^self yavuSystem readManyOf:  ReportEmission where:  [ :each | each customer = self ]
]
