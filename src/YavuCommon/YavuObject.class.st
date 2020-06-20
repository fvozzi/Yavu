Class {
	#name : #YavuObject,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'as yet unclassified' }
YavuObject class >> company [

	^[self sicSession company]
		on: WARequestContextNotFound
		do: [(Smalltalk at: #Company) default]
]

{ #category : #nil }
YavuObject class >> empresaActual [
	"Devuelve la empresa actual si existe una sesión web sino devuelve una empresa default."
	
	^YavuPersistentSubsystem empresaActual 
]

{ #category : #'sin categoria' }
YavuObject class >> sicSession [
	"Devuelve la sesión web actual."
	
	 ^WACurrentRequestContext value session
]

{ #category : #nil }
YavuObject class >> sistema [
	"Devuelve el root del sistema dependiendo de si aSession es nil o no."

	^YavuPersistentSubsystem singleton
]

{ #category : #'sin categoria' }
YavuObject class >> yavuSystem [
	"Devuelve la session actual si está en el contexto de una session de Seaside, sino devuelve la shared session local."
	
	^[self sicSession yavuSystem]
		on: WARequestContextNotFound
		do: [YavuEnvironment currentSystem]
		
]

{ #category : #adding }
YavuObject >> addToSystem [
	
	self yavuSystem storedSubsystem save: self
]

{ #category : #nil }
YavuObject >> commit [
	"Persiste la instancia del receptor en la BD."
	
	YavuPersistentSubsystem commit: [self]
]

{ #category : #'as yet unclassified' }
YavuObject >> company [

	^self class company
]

{ #category : #'magritte descriptions' }
YavuObject >> componentRendererClass [
	^ TBSMagritteFormRenderer
]

{ #category : #'sin categoria' }
YavuObject >> dbPersistedInstance [

	^self yavuSystem readOneOf: self class where: [:each | each id = self id]
]

{ #category : #'magritte descriptions' }
YavuObject >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: self componentRendererClass;
		yourself
]

{ #category : #'sin categoria' }
YavuObject >> empresaActual [
	"Devuelve la empresa actual si existe una sesión web sino devuelve una empresa default."
	
	^self class empresaActual 
]

{ #category : #'as yet unclassified' }
YavuObject >> id [
	^ id
]

{ #category : #'as yet unclassified' }
YavuObject >> id: anObject [
	id := anObject
]

{ #category : #'as yet unclassified' }
YavuObject >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^self magritteDescription select: [:each | each isRequired]
]

{ #category : #adding }
YavuObject >> removeFromSystem [

	^ self subsystem removeFromSystem: self
]

{ #category : #'sin categoria' }
YavuObject >> sicSession [
	"Devuelve la sesión web actual."
	
	 ^self class sicSession
]

{ #category : #'sin categoria' }
YavuObject >> sistema [
	"Devuelve el root del sistema dependiendo de si aSession es nil o no."

	^self class sistema
]

{ #category : #'sin categoria' }
YavuObject >> store [
	"Persiste la instancia del receptor en la BD."
	
	self id isNil
		ifTrue: [self storeObject]
		ifFalse: [self updateObject]
]

{ #category : #'as yet unclassified' }
YavuObject >> storeObject [ 

	self yavuSystem requireUnitOfWork.
	self yavuSystem register: self.
	self yavuSystem commitUnitOfWork
]

{ #category : #environment }
YavuObject >> subsystem [

	"self subclassResponsibility "
	"Needs to be subclassResponsability but I do this beacause I need refactor YavuEntity subclasses."
	
	^ self yavuSystem subsystemOfClass: self subsystemClass 
]

{ #category : #environment }
YavuObject >> subsystemClass [ 

	^ self class subsystemClass
]

{ #category : #'sin categoria' }
YavuObject >> updateFrom: anYavuObject [

	self class allInstVarNames do: [:instVarName |
		self instVarNamed: instVarName put: (anYavuObject instVarNamed: instVarName)]
]

{ #category : #'as yet unclassified' }
YavuObject >> updateObject [ 

	| persistedInstance |
	
	self yavuSystem requireUnitOfWork.
	self yavuSystem cacheRemoveObject: self.
	persistedInstance := self dbPersistedInstance.
	self ts ~= persistedInstance ts ifTrue: [^self error: 'No se puede guardar la instancia porque otro usuario acaba de editarla'.].
	self updateTS.
	persistedInstance updateFrom: self.
	"self dbSession register: self."
	self yavuSystem commitUnitOfWork
]

{ #category : #'as yet unclassified' }
YavuObject >> updateTS [

	"no hace nada."
]

{ #category : #adding }
YavuObject >> updateToSystem [ 

	self yavuSystem storedSubsystem save: self
]

{ #category : #'as yet unclassified' }
YavuObject >> useMagritteEditor [

	^ true
]

{ #category : #'sin categoria' }
YavuObject >> yavuSystem [
	"Devuelve la session actual si está en el contexto de una session de Seaside, sino devuelve la shared session local."
	
	^self class yavuSystem
]
