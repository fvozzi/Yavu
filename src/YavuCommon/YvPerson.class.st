Class {
	#name : #YvPerson,
	#superclass : #YvEntity,
	#instVars : [
		'situacionesComerciales',
		'cuit'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'as yet unclassified' }
YvPerson class >> all [
	"Devuelve todas las intancias del receptor en el sistema."

	"Por performance no devolvemos todas las filas."

	^OrderedCollection new
]

{ #category : #'sin categoria' }
YvPerson class >> atNumeroDeDocumento: unString sexo: otroString ifAbsent: aBlock [
	"Devuelve un invividuo o una organizacion dependiendo de si unString corresponde a un número de documento o a un número de cuit.
	NOTA: se debe tener en cuenta el sexo por existir números de dni repetidos entre varones y mujeres."

	^self atNumeroDeDocumento: unString sexo: otroString ifAbsent: aBlock session: nil


	
]

{ #category : #'sin categoria' }
YvPerson class >> atNumeroDeDocumento: unString sexo: otroString ifAbsent: aBlock session: aSession [
	"Devuelve un invividuo o una organizacion dependiendo de si unString corresponde a un número de documento o a un número de cuit.
	NOTA: se debe tener en cuenta el sexo por existir números de dni repetidos entre varones y mujeres."

	| clientes |
	clientes:= (self sistema: aSession) clientes where: [ :each | (each documentNumber = unString)].
	^clientes detect: [:each | each documentNumber = unString and: [each sex = otroString]] ifNone: [aBlock value]


	
]

{ #category : #'sin categoria' }
YvPerson class >> customersOfNameBeginsWith: firstsLetterOfName [
	"Devuelve una coleccion de clientes cuyo nombre comienza con unString."

	| likeExpression |
	likeExpression := firstsLetterOfName asUppercase, '%'.
	^self yavuSystem readManyOf: self where: [:each | each name asUppercase like: likeExpression]
]

{ #category : #'sin categoria' }
YvPerson class >> descripcionNombre [
	
	^'Nombre'
]

{ #category : #'sin categoria' }
YvPerson class >> named: unString [

	^self new initializeName: unString
]

{ #category : #'sin categoria' }
YvPerson class >> numeroDeDocumento: unString nombre: unNombre sexo: otroString [
	"Crea una nueva instancia de alguna de las subclases del receptor dependiendo de otroString. Si es 'O'
	crea unaOraganizacion y si es 'F' o 'M' crea unIndividuo."
	
	^otroString = 'O'
		ifTrue: [YvLegalPerson nombre: unNombre cuit: unString]
		ifFalse: [YvNaturalPerson nombre: unNombre dni: unString sexo: otroString]
]

{ #category : #'sin categoria' }
YvPerson class >> searchCustomerByCUIT: aCuitLiteral [
	"Devuelve una instancia del receptor desde la BD cuyo cuit es igual a aCUITLiteral."

	^self yavuSystem readOneOf: self where: [:each | each cuit = aCuitLiteral]
]

{ #category : #'sin categoria' }
YvPerson >> = otroCliente [
	"Answer whether the receiver is equal to the argument."
	
	^super = otroCliente and: [self cuit = otroCliente cuit]
]

{ #category : #'as yet unclassified' }
YvPerson >> bouncedChecks [
	"consulta en la BD los cheques rechazados del receptor y los devuelve."
	
	^self yavuSystem readManyOf:  BouncedCheck where:  [ :each | each customer = self ]
]

{ #category : #'sin categoria' }
YvPerson >> cuit [

	cuit isNil ifTrue: [self inicializarCUIT].
	^cuit
]

{ #category : #'sin categoria' }
YvPerson >> cuit: unCUIT [
	
	cuit:= unCUIT
]

{ #category : #'as yet unclassified' }
YvPerson >> customerTypeClass [

	^CustomerType atCodigo: self customerType 
]

{ #category : #'sin categoria' }
YvPerson >> descripcionNombre [
	
	^self class descripcionNombre
]

{ #category : #'sin categoria' }
YvPerson >> documentNumber [
	"Devuelve el numero de documento del receptor."
	
	self subclassResponsibility
]

{ #category : #'sin categoria' }
YvPerson >> documentNumberDescription [
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
YvPerson >> eliminar [
	"Elimina la instancia del receptor a la colección de elementos del owner."
	
	^self sistema removerCliente: self
]

{ #category : #'as yet unclassified' }
YvPerson >> financialSituations [

	^(self yavuSystem readManyOf: FinancialSituation where: [:each | each customer = self]) asOrderedCollection
]

{ #category : #'sin categoria' }
YvPerson >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity."
	
	^super hash bitXor: self cuit hash
]

{ #category : #'sin categoria' }
YvPerson >> initialize [

	super initialize.
	situacionesComerciales := OrderedCollection new
]

{ #category : #'as yet unclassified' }
YvPerson >> isNaturalPerson [

	^false
]

{ #category : #'as yet unclassified' }
YvPerson >> javascriptOn: aStream [

	| dn |
	
	dn := self documentNumber  ifNil: [ '' ].
	JSStream encodeString: self name, ' - ', self tipoDocumento, ': ', dn on: aStream
]

{ #category : #'as yet unclassified' }
YvPerson >> lostChecks [
	"consulta en la BD los cheques perdidos del receptor y los devuelve."
	
	^self yavuSystem readManyOf:  LostCheck where:  [ :each | each customer = self ]
]

{ #category : #'as yet unclassified' }
YvPerson >> reportEmissions [
	"consulta en la BD los cheques rechazados del receptor y los devuelve."
	
	^self yavuSystem readManyOf:  ReportEmission where:  [ :each | each customer = self ]
]
