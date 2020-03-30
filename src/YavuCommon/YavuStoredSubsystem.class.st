Class {
	#name : #YavuStoredSubsystem,
	#superclass : #YavuSubsystem,
	#instVars : [
		'loggedUser',
		'users'
	],
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

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> subsystemTag [

	 ^'storedSubsystem'
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem class >> yavuSystem [
	"Devuelve la session actual si está en el contexto de una session de Seaside, sino devuelve la shared session local."
	
	^[self sicSession databaseSession]
		on: WARequestContextNotFound
		do: [StPersistence current sharedSession]
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> allowedCommerces [
	
	^loggedUser commerces
]

{ #category : #accessing }
YavuStoredSubsystem >> allowedEntitiesClasses [
	
	^loggedUser allowedEntitiesClasses
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> company [
	^company
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> defaultCommerce [
	
	^loggedUser defaultCommerce
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> entityOfClass: anEntityClass atID: aNumber [

	^self entityOfClass: anEntityClass atID: aNumber ifAbsent: [ ]
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> entityOfClass: anEntityClass atID: aNumber ifAbsent: aBlock [

	^self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> existsUser: aSicUser [

	^(self users detect: [ :one | one name asUppercase = aSicUser name asUppercase and: [ one password = aSicUser password ] ] ifNone: [  ]) notNil
	
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> fechaActual [
	"Devuelve la fecha actual del sistema."
	
	^Date today
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> initializeCompany: aCompany [ 

	company:= aCompany
]

{ #category : #'as yet unclassified' }
YavuStoredSubsystem >> instancesOf: aClass [ 
	self subclassResponsibility 
]

{ #category : #testing }
YavuStoredSubsystem >> searchCustomerByNumber: aString customerType: aCustomerType [

	| cuitNumberLiteral |
	cuitNumberLiteral := aString size = 11 ifTrue: [aString] ifFalse: [aCustomerType cuitNumberOf: aString].
	^self searchCustomerByCUIT: cuitNumberLiteral
]

{ #category : #accessing }
YavuStoredSubsystem >> users [

	users ifNil: [ self initializeUsers ].
	^users
]
