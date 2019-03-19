Class {
	#name : #Entity,
	#superclass : #YavuObject,
	#instVars : [
		'atributos',
		'name',
		'ts'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
Entity class >> all [
	"Devuelve todas las intancias del receptor en el sistema."

	^self yavuSystem instancesOf: self 
]

{ #category : #'sin categoria' }
Entity class >> allForCompany: aCompany [
	"Devuelve todas las intancias del receptor en el sistema."

	^self all
]

{ #category : #'as yet unclassified' }
Entity class >> allForCompany: aCompany searchSelector: aSearchSelector searchValue: aSearchValue [
	"Devuelve todas las intancias del receptor en el sistema."

	aSearchValue isEmpty ifTrue: [ ^self allForCompany: aCompany].
	^self yavuSystem readManyOf: self 
		where: [:each | (each perform: aSearchSelector) asUppercase like: aSearchValue, '%']
]

{ #category : #'sin categoria' }
Entity class >> atCodigo: unCodigo [
		"Answer the receiver instance with code equal to aCode or nil if it doesn't exists."

	^self atCodigo: unCodigo ifAbsent: []
]

{ #category : #'sin categoria' }
Entity class >> atCodigo: unCodigo ifAbsent: aBlock [
	"Answer the receiver instance with code equal to aCode or evaluate aBlock if it doesn't exists."

	^self all detect: [:one | one code = unCodigo] ifNone: aBlock
]

{ #category : #'as yet unclassified' }
Entity class >> atID: anInternalID [

	^self atID: anInternalID ifAbsent: []
]

{ #category : #'as yet unclassified' }
Entity class >> atID: anInternalID ifAbsent: aBlock [

	^(self yavuSystem readOneOf: self where: [:each | each id  = anInternalID]) ifNil: [aBlock value]
]

{ #category : #'sin categoria' }
Entity class >> atName: unNombre [

	^self atName: unNombre ifAbsent: []
]

{ #category : #'sin categoria' }
Entity class >> atName: aName ifAbsent: aBlock [

	^(self yavuSystem readOneOf: self where: [:each | each name  = aName]) ifNil: [aBlock value]
]

{ #category : #'sin categoria' }
Entity class >> default [
	
	^self all ifEmpty: [self inexistente] ifNotEmpty: [:instances | instances first]
]

{ #category : #'as yet unclassified' }
Entity class >> defaultSearchLabel [

	^'Nombre'
]

{ #category : #'sin categoria' }
Entity class >> inexistente [
	"Devuelve una nueva instancia del receptor con nombre 'Sin'-Nombre de clase."
	
	^self new name: 'Sin ', self name
]

{ #category : #accessing }
Entity class >> instancesSelector [
	
	^self name pluralize asLegalSelector asSymbol
	

]

{ #category : #'sin categoria' }
Entity class >> isAbstract [

	^self subclasses size ~= 0
]

{ #category : #'sin categoria' }
Entity class >> label [
	"Devuelve una descripción de la clase del receptor."

	^self name
]

{ #category : #'sin categoria' }
Entity class >> name: unString [

	^self new initializeName: unString
]

{ #category : #'sin categoria' }
Entity class >> named: unString [

	^self atName: unString ifAbsent: [self name: unString]
]

{ #category : #'as yet unclassified' }
Entity class >> possibleSearchSelectors [

	^Dictionary new 
		at: 'Nombre' put: #name;
		yourself
]

{ #category : #'sin categoria' }
Entity >> <= otraEntidad [
	"Answer whether the receiver is less than or equal to the argument."
	
	^self name <= otraEntidad name
]

{ #category : #'as yet unclassified' }
Entity >> = otraEntidad [
	"Answer whether the receiver is equal to the argument."

	"Uso isKingOf: porque en otraEntidad puede venir un proxy."
	(otraEntidad isKindOf: self class) ifFalse: [^false].
	^self name = otraEntidad name
]

{ #category : #'as yet unclassified' }
Entity >> addToSystem [
	self subclassResponsibility.
]

{ #category : #'sin categoria' }
Entity >> anunciarNuevaEntidad [

	| announce |
	announce := EntidadAdded asAnnouncement entity: self.
	self sistema announcer announce: announce
]

{ #category : #'sin categoria' }
Entity >> atributos [
	^ atributos
]

{ #category : #'sin categoria' }
Entity >> atributos: anObject [
	atributos := anObject
]

{ #category : #'as yet unclassified' }
Entity >> defaultSearchLabel [

	^self class defaultSearchLabel 
]

{ #category : #'sin categoria' }
Entity >> descriptionNombre [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #name;
		label: 'Nombre';
		priority: 100;
		required: true;
		requiredErrorMessage: 'We cannot proceed without a name.';
		comment: 'Please enter your name';
		yourself
]

{ #category : #'sin categoria' }
Entity >> doesNotUnderstand: aMessage [
	"Busca el selector en los atributos del receptor si no lo encuentra envia DNU a la superclase."
	
	^self atributos at: aMessage selector ifAbsent: [super doesNotUnderstand: aMessage]
]

{ #category : #'as yet unclassified' }
Entity >> eliminar [
	"Elimina la instancia del receptor a la colección de elementos del owner."
	
	self yavuSystem requireUnitOfWork.
	self yavuSystem delete: self.
	self yavuSystem commitUnitOfWork
	
]

{ #category : #'sin categoria' }
Entity >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity."
	
	^self name hash

]

{ #category : #'sin categoria' }
Entity >> initialize [
	"Initialize the receiver instance."
	
	super initialize.
	name:= 'Ingrese un nombre'.
	self atributos: Dictionary new
	
]

{ #category : #'sin categoria' }
Entity >> initializeName: unString [

	name:= unString
]

{ #category : #'sin categoria' }
Entity >> isAbstract [

	^false
]

{ #category : #'sin categoria' }
Entity >> javascriptOn: aStream [

	JSStream encodeString: self name on: aStream
]

{ #category : #'sin categoria' }
Entity >> jsonOn: aStream [
	self javascriptOn: aStream
]

{ #category : #'sin categoria' }
Entity >> label [

	^self name
]

{ #category : #'sin categoria' }
Entity >> name [
	
	^ name
]

{ #category : #'sin categoria' }
Entity >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
Entity >> possibleSearchSelectors [

	^self class possibleSearchSelectors
]

{ #category : #'sin categoria' }
Entity >> printOn: aStream [
"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	
	aStream nextPutAll: self name

	
]

{ #category : #'as yet unclassified' }
Entity >> ts [

	^ts
]

{ #category : #'sin categoria' }
Entity >> ts: anObject [
	ts := anObject
]

{ #category : #'as yet unclassified' }
Entity >> updateTS [

	ts := TimeStamp current.
]
