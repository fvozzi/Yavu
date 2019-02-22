Class {
	#name : #SICSession,
	#superclass : #WASession,
	#instVars : [
		'usuario',
		'empresa',
		'databaseSession',
		'yavuSystem'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
SICSession >> charSet [

^'ISO_8859-1'
]

{ #category : #nil }
SICSession >> close [
	"Libera la sessín actual de base de datos."

	"self databaseSession release.
	self databaseSession reset.
	self databaseSession: nil."
	"MADescriptionBuilder default flush."
	self session usuario: nil.
	self databaseSession logout.
]

{ #category : #accessing }
SICSession >> company [
	^ empresa
]

{ #category : #accessing }
SICSession >> company: anObject [
	empresa := anObject
]

{ #category : #accessing }
SICSession >> databaseSession [

	databaseSession isNil ifTrue: [self initializeDatabaseSession].
	^databaseSession
]

{ #category : #accessing }
SICSession >> databaseSession: anObject [
	databaseSession := anObject
]

{ #category : #'as yet unclassified' }
SICSession >> initialize [

	super initialize
]

{ #category : #accessing }
SICSession >> initializeDatabaseSession [
	"Crea una nueva sesión de la base de datos."

	databaseSession := StPersistence current newSession
]

{ #category : #quering }
SICSession >> sessionIniciada [
	"Devuelve true si ya hay un usuario logueado al sistema para la sesión representada por el receptor."
	
	^self user notNil
]

{ #category : #'as yet unclassified' }
SICSession >> sistema [
	"Devuelve el root asociado a la database session del receptor."
	
	^self databaseSession root
]

{ #category : #'as yet unclassified' }
SICSession >> unregister [

	super unregister.
	self close
]

{ #category : #accessing }
SICSession >> user [
	^ usuario
]

{ #category : #accessing }
SICSession >> usuario: anObject [
	usuario := anObject
]

{ #category : #'as yet unclassified' }
SICSession >> yavuSystem [

	^yavuSystem
]

{ #category : #'as yet unclassified' }
SICSession >> yavuSystem: aYavuSystem [

	yavuSystem := aYavuSystem
]
