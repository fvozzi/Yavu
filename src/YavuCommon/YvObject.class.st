Class {
	#name : #YvObject,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'as yet unclassified' }
YvObject class >> company [

	^[self sicSession company]
		on: WARequestContextNotFound
		do: [(Smalltalk at: #Company) default]
]

{ #category : #nil }
YvObject class >> empresaActual [
	"Devuelve la empresa actual si existe una sesión web sino devuelve una empresa default."
	
	^YavuPersistentSubsystem empresaActual 
]

{ #category : #'sin categoria' }
YvObject class >> sicSession [
	"Devuelve la sesión web actual."
	
	 ^WACurrentRequestContext value session
]

{ #category : #nil }
YvObject class >> sistema [
	"Devuelve el root del sistema dependiendo de si aSession es nil o no."

	^YavuPersistentSubsystem singleton
]

{ #category : #'sin categoria' }
YvObject class >> yavuSystem [
	"Devuelve la session actual si está en el contexto de una session de Seaside, sino devuelve la shared session local."
	
	^[self sicSession yavuSystem]
		on: WARequestContextNotFound
		do: [YavuEnvironment currentSystem]
		
]

{ #category : #nil }
YvObject >> commit [
	"Persiste la instancia del receptor en la BD."
	
	YavuPersistentSubsystem commit: [self]
]

{ #category : #'as yet unclassified' }
YvObject >> company [

	^self class company
]

{ #category : #'sin categoria' }
YvObject >> dbPersistedInstance [

	^self yavuSystem readOneOf: self class where: [:each | each id = self id]
]

{ #category : #'sin categoria' }
YvObject >> empresaActual [
	"Devuelve la empresa actual si existe una sesión web sino devuelve una empresa default."
	
	^self class empresaActual 
]

{ #category : #'as yet unclassified' }
YvObject >> id [
	^ id
]

{ #category : #'as yet unclassified' }
YvObject >> id: anObject [
	id := anObject
]

{ #category : #'as yet unclassified' }
YvObject >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^self magritteDescription select: [:each | each isRequired]
]

{ #category : #'sin categoria' }
YvObject >> sicSession [
	"Devuelve la sesión web actual."
	
	 ^self class sicSession
]

{ #category : #'sin categoria' }
YvObject >> sistema [
	"Devuelve el root del sistema dependiendo de si aSession es nil o no."

	^self class sistema
]

{ #category : #'sin categoria' }
YvObject >> store [
	"Persiste la instancia del receptor en la BD."
	
	self id isNil
		ifTrue: [self storeObject]
		ifFalse: [self updateObject]
]

{ #category : #'as yet unclassified' }
YvObject >> storeObject [ 

	self yavuSystem requireUnitOfWork.
	self yavuSystem register: self.
	self yavuSystem commitUnitOfWork
]

{ #category : #'sin categoria' }
YvObject >> updateFrom: anYavuObject [

	self class allInstVarNames do: [:instVarName |
		self instVarNamed: instVarName put: (anYavuObject instVarNamed: instVarName)]
]

{ #category : #'as yet unclassified' }
YvObject >> updateObject [ 

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
YvObject >> updateTS [

	"no hace nada."
]

{ #category : #'sin categoria' }
YvObject >> yavuSystem [
	"Devuelve la session actual si está en el contexto de una session de Seaside, sino devuelve la shared session local."
	
	^self class yavuSystem
]
