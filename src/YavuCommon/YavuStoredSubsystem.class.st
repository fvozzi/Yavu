Class {
	#name : #YavuStoredSubsystem,
	#superclass : #YavuSubsystem,
	#category : #'YavuCommon-Environment'
}

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> commit: aBlock [
	"Persiste la instancia del receptor en la BD."
	
	self yavuSystem commit: aBlock
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> current [
	"Devuelve el singleton de la clase de sistema instalada."
	
	^self currentClass singleton
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> currentClass [
	"Devuelve la clase de sistema instalado en el image."
	
	^YavuPersistentSubsystem
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> empresaActual [
	"Devuelve la empresa actual si existe una sesión web sino devuelve una empresa default."
	
	^[self sicSession company]
		on: WARequestContextNotFound
		do: [Company default]
]

{ #category : #configuration }
YavuStoredSubsystem class >> entitiesClasses [ 

	^ OrderedCollection new
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> for: aCompany [ 
	
	^self new
		initializeCompany: aCompany;
		yourself
]

{ #category : #'instance creation' }
YavuStoredSubsystem class >> newPersistentSystem [
	
	^YavuPersistentSubsystem new
]

{ #category : #'instance creation' }
YavuStoredSubsystem class >> newSystem [
	
	^self new
]

{ #category : #'instance creation' }
YavuStoredSubsystem class >> newTransientSystem [
	
	^YavuTransientSubsystem new
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> sicSession [
	"Devuelve la sesión web actual."
	
	 ^WACurrentRequestContext value session
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> singleton [
	"Devuelve el root de la sesión actual. Si no estamos en el contexto de una WASession devuelve una seccion shared."
	
	^self sicSession root
]

{ #category : #configuration }
YavuStoredSubsystem class >> subsystemTag [

	 ^'storedSubsystem'
]

{ #category : #configuration }
YavuStoredSubsystem class >> transactionsClasses [ 

	^ OrderedCollection new
]

{ #category : #configuration }
YavuStoredSubsystem class >> yavuSystem [
	"Devuelve la session actual si está en el contexto de una session de Seaside, sino devuelve la shared session local."
	
	^[self sicSession databaseSession]
		on: WARequestContextNotFound
		do: [StPersistence current sharedSession]
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> instancesOf: aClass [ 
	self subclassResponsibility 
]
