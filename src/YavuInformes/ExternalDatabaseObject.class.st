Class {
	#name : #ExternalDatabaseObject,
	#superclass : #YvObject,
	#instVars : [
		'atributos'
	],
	#category : #'YavuInformes-Persistence'
}

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> actualizacionesPath [
	"Devuelve le path donde se vana guardar las sincronizaciones descargadas de la web."

	^FileDirectory default fullName, '\sincronizaciones'
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> armarInstanciasDe: aDBXResult [

	| instances rows |
	rows := aDBXResult rows.
	instances := OrderedCollection new.
	rows do: [:row | | instance |
		instance := self new.
		self columns do: [:maDescription |
			instance perform: maDescription accessor writeSelector with: (row rawValueNamed: maDescription accessor readSelector asString)
			].
		instances add: instance
		].
	^instances
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> columns [

	^self new magritteDescription children select: [:each | each mapping].
	
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> columnsHeader [

	| columnsHeader |
	
	columnsHeader := ReadWriteStream on: String new.
	self columnsNames
		do: [:each | columnsHeader nextPutAll: each]
		separatedBy: [columnsHeader nextPutAll: ' , '].
	^columnsHeader contents
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> columnsNames [

	^self columns collect: [:each | each accessor readSelector asString]
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> datosClienteEnAlgunaBDParaSubNombre: unString [
	"Devuelve una colección con todas las filas de las BD externas cuya denominación comienza con unString.
	unString tiene que tener exactamente los 5 primeros caracteres del nombre porque así es el indice."
	
	^(Array with: DatosPadronBCRA with: InscripcionAFIP with: DatosPadronElectoral)
		inject: OrderedCollection new
		into: [:accum :each | accum addAll: (each nameStartWith: unString); yourself]
]

{ #category : #'as yet unclassified' }
ExternalDatabaseObject class >> existenDatosEnAlgunaBDPara: unNumeroDeDocumento [
	"Devuelve true si existen datos en la BD del receptor para unCliente."
	
	^(self subclasses detect: [:one | one existenDatosPara: unNumeroDeDocumento ] ifNone: []) notNil
	

]

{ #category : #'as yet unclassified' }
ExternalDatabaseObject class >> existenDatosPara: unCliente [
	"Devuelve true si existen datos en la BD del receptor para unCliente."
	
	^self subclassResponsibility 
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> inexistente [

	^self new name: 'No existen datos.'
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> mapFields [
	"Answer the mappings between the recevier atributes and the database field."

    ^Dictionary new
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> mapaDeSincronizaciones [
	"Devuelve un mapa para asocior el prefijo del archivo con el método que se usa para sincronizar."

	^Dictionary new
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> nameStartWith: aString [

	| sql result |
	sql := self sqlSelectString.
	sql := sql, ' WHERE substring(UPPER(', self nombreDeColumnaDeNombre, '), 1, ', aString size asString, ') = ',  aString asUppercase printString.
	result := self armarInstanciasDe: (BaseDeDatos current execute: sql).
	^result
	

]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> nombreDeColumnaDeNombre [

	^'NOMBRE'
]

{ #category : #'as yet unclassified' }
ExternalDatabaseObject class >> numeroDeDocumento: unNumero [

	| result |
	
	result := self yavuSystem readManyOf: self where: [:each | each cuit  = unNumero].
	^result notEmpty ifTrue: [result] ifFalse: [result asOrderedCollection add: self inexistente; yourself]
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> prefijo: unNombreDeArchivo [
	"Devuelve el prefijo según la codificación que usa el receptor para nombrar a los distintos archivos de sincronizacion.
	NOTA: si no tiene prefijo y es un archivo unico usamos: 'archivo'."
	
	^'archivo'
]

{ #category : #'sin categoria' }
ExternalDatabaseObject class >> sqlSelectString [

	^'SELECT ', self columnsHeader, ' FROM ', self nombreDeTabla
]

{ #category : #'as yet unclassified' }
ExternalDatabaseObject class >> updateCuitFromAnyDatabaseTo: aCustomer [
	"aCustomer tiene setea un tipo no declarado y entonces no podemos calcular el cuit. En este metodo buscamos en todas las BD externas un número de CUIT para todas las combinaciones de sexo posibles."

	| customerCopy customerType | 
	
	customerCopy := aCustomer copy.
	customerType := CustomerType allDeclaredTypes 
		detect:  [ :each | self existenDatosEnAlgunaBDPara: (customerCopy setCustomerType: each) ]
		ifNone: [ ].
	customerType ifNotNil: [:each | aCustomer setCustomerType: each ]
]

{ #category : #'sin categoria' }
ExternalDatabaseObject >> = anExternalDatabaseObject [
	"Answer true if the receiver is equal to anExternalDatabaseObject."
	
	self class = anExternalDatabaseObject class ifFalse: [^false].
	^self documentNumber = anExternalDatabaseObject documentNumber 

		
]

{ #category : #'sin categoria' }
ExternalDatabaseObject >> atributos [

	^atributos
]

{ #category : #'sin categoria' }
ExternalDatabaseObject >> descripcion [

	^self name
]

{ #category : #'as yet unclassified' }
ExternalDatabaseObject >> documentNumber [ 

	^self cuit
]

{ #category : #'sin categoria' }
ExternalDatabaseObject >> doesNotUnderstand: aMessage [
	"Busca el selector en los atributos del receptor si no lo encuentra envia DNU a la superclase."

	aMessage numArgs > 1 ifTrue: [^super doesNotUnderstand: aMessage].
	aMessage numArgs = 1 ifTrue: [ | selector |
		selector := (aMessage selector copyFrom: 1 to: aMessage selector asString size - 1) asSymbol.
		^self atributos at: selector put: aMessage arguments first
		].
	^self atributos at: aMessage selector ifAbsent: [super doesNotUnderstand: aMessage]
]

{ #category : #'sin categoria' }
ExternalDatabaseObject >> esInexistente [
	
	^self ~= self class inexistente
]

{ #category : #'sin categoria' }
ExternalDatabaseObject >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity."
	
	^self documentNumber hash
]

{ #category : #'sin categoria' }
ExternalDatabaseObject >> initialize [
	"Initialize the receiver instance."
	
	super initialize.
	atributos:= Dictionary new
	
]

{ #category : #'sin categoria' }
ExternalDatabaseObject >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

 	aStream 
		nextPutAll: self class descripcion;
		nextPutAll: ' - ';
		nextPutAll: self denominacion;
		nextPutAll: ' - ';
		nextPutAll: self cuit
]
