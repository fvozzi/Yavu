Class {
	#name : #YvEntity,
	#superclass : #YvObject,
	#instVars : [
		'atributos',
		'name',
		'ts'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
YvEntity class >> all [
	"Devuelve todas las intancias del receptor en el sistema."

	^self yavuSystem instancesOf: self 
]

{ #category : #'sin categoria' }
YvEntity class >> allForCompany: aCompany [
	"Devuelve todas las intancias del receptor en el sistema."

	^self all
]

{ #category : #'as yet unclassified' }
YvEntity class >> allForCompany: aCompany searchSelector: aSearchSelector searchValue: aSearchValue [
	"Devuelve todas las intancias del receptor en el sistema."

	aSearchValue isEmpty ifTrue: [ ^self allForCompany: aCompany].
	^self yavuSystem readManyOf: self 
		where: [:each | (each perform: aSearchSelector) asUppercase like: aSearchValue, '%']
]

{ #category : #'sin categoria' }
YvEntity class >> atCodigo: unCodigo [
		"Answer the receiver instance with code equal to aCode or nil if it doesn't exists."

	^self atCodigo: unCodigo ifAbsent: []
]

{ #category : #'sin categoria' }
YvEntity class >> atCodigo: unCodigo ifAbsent: aBlock [
	"Answer the receiver instance with code equal to aCode or evaluate aBlock if it doesn't exists."

	^self all detect: [:one | one code = unCodigo] ifNone: aBlock
]

{ #category : #'as yet unclassified' }
YvEntity class >> atID: anInternalID [

	^self atID: anInternalID ifAbsent: []
]

{ #category : #'as yet unclassified' }
YvEntity class >> atID: anInternalID ifAbsent: aBlock [

	^(self yavuSystem readOneOf: self where: [:each | each id  = anInternalID]) ifNil: [aBlock value]
]

{ #category : #'sin categoria' }
YvEntity class >> atName: unNombre [

	^self atName: unNombre ifAbsent: []
]

{ #category : #'sin categoria' }
YvEntity class >> atName: aName ifAbsent: aBlock [

	^(self yavuSystem readOneOf: self where: [:each | each name  = aName]) ifNil: [aBlock value]
]

{ #category : #'sin categoria' }
YvEntity class >> default [
	
	^self all ifEmpty: [self inexistente] ifNotEmpty: [:instances | instances first]
]

{ #category : #'as yet unclassified' }
YvEntity class >> defaultSearchLabel [

	^'Nombre'
]

{ #category : #'sin categoria' }
YvEntity class >> inexistente [
	"Devuelve una nueva instancia del receptor con nombre 'Sin'-Nombre de clase."
	
	^self new name: 'Sin ', self name
]

{ #category : #accessing }
YvEntity class >> instancesSelector [
	
	^self name pluralize asLegalSelector asSymbol
	

]

{ #category : #'sin categoria' }
YvEntity class >> isAbstract [

	^self subclasses size ~= 0
]

{ #category : #'sin categoria' }
YvEntity class >> label [
	"Devuelve una descripción de la clase del receptor."

	^self name
]

{ #category : #'sin categoria' }
YvEntity class >> name: unString [

	^self new initializeName: unString
]

{ #category : #'sin categoria' }
YvEntity class >> named: unString [

	^self atName: unString ifAbsent: [self name: unString]
]

{ #category : #'as yet unclassified' }
YvEntity class >> possibleSearchSelectors [

	^Dictionary new 
		at: 'Nombre' put: #name;
		yourself
]

{ #category : #'as yet unclassified' }
YvEntity >> addToSystem [
	self subclassResponsibility.
]

{ #category : #'sin categoria' }
YvEntity >> anunciarNuevaEntidad [

	| announce |
	announce := EntidadAdded asAnnouncement entity: self.
	self sistema announcer announce: announce
]

{ #category : #'sin categoria' }
YvEntity >> atributos [
	^ atributos
]

{ #category : #'sin categoria' }
YvEntity >> atributos: anObject [
	atributos := anObject
]

{ #category : #'as yet unclassified' }
YvEntity >> defaultSearchLabel [

	^self class defaultSearchLabel 
]

{ #category : #descriptions }
YvEntity >> descriptionName [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #name;
		label: 'Nombre';
		priority: 100;
		required: true;
		requiredErrorMessage: 'Debe completar el nombre.';
		comment: 'Complete el nombre';
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'sin categoria' }
YvEntity >> doesNotUnderstand: aMessage [
	"Busca el selector en los atributos del receptor si no lo encuentra envia DNU a la superclase."
	
	^self atributos at: aMessage selector ifAbsent: [super doesNotUnderstand: aMessage]
]

{ #category : #'as yet unclassified' }
YvEntity >> eliminar [
	"Elimina la instancia del receptor a la colección de elementos del owner."
	
	self yavuSystem requireUnitOfWork.
	self yavuSystem delete: self.
	self yavuSystem commitUnitOfWork
	
]

{ #category : #'sin categoria' }
YvEntity >> initialize [
	"Initialize the receiver instance."
	
	super initialize.
	self atributos: Dictionary new
	
]

{ #category : #'sin categoria' }
YvEntity >> initializeName: unString [

	name:= unString
]

{ #category : #'sin categoria' }
YvEntity >> isAbstract [

	^false
]

{ #category : #'sin categoria' }
YvEntity >> javascriptOn: aStream [

	JSStream encodeString: self name on: aStream
]

{ #category : #'sin categoria' }
YvEntity >> jsonOn: aStream [
	self javascriptOn: aStream
]

{ #category : #'sin categoria' }
YvEntity >> label [

	^self name
]

{ #category : #'sin categoria' }
YvEntity >> name [
	
	^ name
]

{ #category : #'sin categoria' }
YvEntity >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
YvEntity >> possibleSearchSelectors [

	^self class possibleSearchSelectors
]

{ #category : #'sin categoria' }
YvEntity >> printOn: aStream [
"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	
	aStream nextPutAll: self name

	
]

{ #category : #'as yet unclassified' }
YvEntity >> ts [

	^ts
]

{ #category : #'sin categoria' }
YvEntity >> ts: anObject [
	ts := anObject
]
