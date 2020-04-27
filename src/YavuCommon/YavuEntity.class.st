Class {
	#name : #YavuEntity,
	#superclass : #YavuObject,
	#instVars : [
		'atributos',
		'name',
		'ts'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
YavuEntity class >> all [
	"Devuelve todas las intancias del receptor en el sistema."

	^self yavuSystem instancesOf: self 
]

{ #category : #'sin categoria' }
YavuEntity class >> allForCompany: aCompany [
	"Devuelve todas las intancias del receptor en el sistema."

	^self all
]

{ #category : #'as yet unclassified' }
YavuEntity class >> allForCompany: aCompany searchSelector: aSearchSelector searchValue: aSearchValue [
	"Devuelve todas las intancias del receptor en el sistema."

	aSearchValue isEmpty ifTrue: [ ^self allForCompany: aCompany].
	^self yavuSystem readManyOf: self 
		where: [:each | (each perform: aSearchSelector) asUppercase like: aSearchValue, '%']
]

{ #category : #'sin categoria' }
YavuEntity class >> atCodigo: unCodigo [
		"Answer the receiver instance with code equal to aCode or nil if it doesn't exists."

	^self atCodigo: unCodigo ifAbsent: []
]

{ #category : #'sin categoria' }
YavuEntity class >> atCodigo: unCodigo ifAbsent: aBlock [
	"Answer the receiver instance with code equal to aCode or evaluate aBlock if it doesn't exists."

	^self all detect: [:one | one code = unCodigo] ifNone: aBlock
]

{ #category : #'as yet unclassified' }
YavuEntity class >> atID: anInternalID [

	^self atID: anInternalID ifAbsent: []
]

{ #category : #'as yet unclassified' }
YavuEntity class >> atID: anInternalID ifAbsent: aBlock [

	^(self yavuSystem readOneOf: self where: [:each | each id  = anInternalID]) ifNil: [aBlock value]
]

{ #category : #'sin categoria' }
YavuEntity class >> atName: unNombre [

	^self atName: unNombre ifAbsent: []
]

{ #category : #'sin categoria' }
YavuEntity class >> atName: aName ifAbsent: aBlock [

	^(self yavuSystem readOneOf: self where: [:each | each name  = aName]) ifNil: [aBlock value]
]

{ #category : #'sin categoria' }
YavuEntity class >> default [
	
	^self all ifEmpty: [self inexistente] ifNotEmpty: [:instances | instances first]
]

{ #category : #'as yet unclassified' }
YavuEntity class >> defaultSearchLabel [

	^'Nombre'
]

{ #category : #'sin categoria' }
YavuEntity class >> inexistente [
	"Devuelve una nueva instancia del receptor con nombre 'Sin'-Nombre de clase."
	
	^self new name: 'Sin ', self name
]

{ #category : #accessing }
YavuEntity class >> instancesSelector [
	
	^self name pluralize asLegalSelector asSymbol
	

]

{ #category : #'sin categoria' }
YavuEntity class >> isAbstract [

	^self subclasses size ~= 0
]

{ #category : #'sin categoria' }
YavuEntity class >> label [
	"Devuelve una descripción de la clase del receptor."

	^self name
]

{ #category : #'sin categoria' }
YavuEntity class >> name: unString [

	^self new initializeName: unString
]

{ #category : #'sin categoria' }
YavuEntity class >> named: unString [

	^self atName: unString ifAbsent: [self name: unString]
]

{ #category : #'as yet unclassified' }
YavuEntity class >> possibleSearchSelectors [

	^Dictionary new 
		at: 'Nombre' put: #name;
		yourself
]

{ #category : #'as yet unclassified' }
YavuEntity >> addToSystem [
	
	self yavuSystem storedSubsystem save: self
]

{ #category : #'sin categoria' }
YavuEntity >> atributos [
	^ atributos
]

{ #category : #'sin categoria' }
YavuEntity >> atributos: anObject [
	atributos := anObject
]

{ #category : #'as yet unclassified' }
YavuEntity >> defaultSearchLabel [

	^self class defaultSearchLabel 
]

{ #category : #'magritte descriptions' }
YavuEntity >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: TBSMagritteFormRenderer;
		yourself

]

{ #category : #descriptions }
YavuEntity >> descriptionName [
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
YavuEntity >> doesNotUnderstand: aMessage [
	"Busca el selector en los atributos del receptor si no lo encuentra envia DNU a la superclase."
	
	^self atributos at: aMessage selector ifAbsent: [super doesNotUnderstand: aMessage]
]

{ #category : #'as yet unclassified' }
YavuEntity >> eliminar [
	"Elimina la instancia del receptor a la colección de elementos del owner."
	
	self yavuSystem requireUnitOfWork.
	self yavuSystem delete: self.
	self yavuSystem commitUnitOfWork
	
]

{ #category : #'sin categoria' }
YavuEntity >> initialize [
	"Initialize the receiver instance."
	
	super initialize.
	self atributos: Dictionary new
	
]

{ #category : #'sin categoria' }
YavuEntity >> initializeName: unString [

	name:= unString
]

{ #category : #'sin categoria' }
YavuEntity >> isAbstract [

	^false
]

{ #category : #'sin categoria' }
YavuEntity >> javascriptOn: aStream [

	JSStream encodeString: self name on: aStream
]

{ #category : #'sin categoria' }
YavuEntity >> jsonOn: aStream [
	self javascriptOn: aStream
]

{ #category : #'sin categoria' }
YavuEntity >> label [

	^self name
]

{ #category : #'sin categoria' }
YavuEntity >> name [
	
	^ name
]

{ #category : #'sin categoria' }
YavuEntity >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
YavuEntity >> possibleSearchSelectors [

	^self class possibleSearchSelectors
]

{ #category : #'sin categoria' }
YavuEntity >> printOn: aStream [
"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	
	aStream nextPutAll: self name

	
]

{ #category : #'as yet unclassified' }
YavuEntity >> ts [

	^ts
]

{ #category : #'sin categoria' }
YavuEntity >> ts: anObject [
	ts := anObject
]
