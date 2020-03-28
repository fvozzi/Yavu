Class {
	#name : #YavuSession,
	#superclass : #WASession,
	#instVars : [
		'usuario',
		'empresa',
		'databaseSession',
		'yavuSystem'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #accessing }
YavuSession >> charSet [

^'ISO_8859-1'
]

{ #category : #nil }
YavuSession >> close [
	"Libera la sessín actual de base de datos."

	"self databaseSession release.
	self databaseSession reset.
	self databaseSession: nil."
	"MADescriptionBuilder default flush."
	self session usuario: nil.
	self databaseSession logout.
]

{ #category : #accessing }
YavuSession >> company [
	^ empresa
]

{ #category : #accessing }
YavuSession >> company: anObject [
	empresa := anObject
]

{ #category : #accessing }
YavuSession >> databaseSession [

	databaseSession isNil ifTrue: [self initializeDatabaseSession].
	^databaseSession
]

{ #category : #accessing }
YavuSession >> databaseSession: anObject [
	databaseSession := anObject
]

{ #category : #'as yet unclassified' }
YavuSession >> initialize [

	super initialize
]

{ #category : #accessing }
YavuSession >> initializeDatabaseSession [
	"Crea una nueva sesión de la base de datos."

	databaseSession := StPersistence current newSession
]

{ #category : #quering }
YavuSession >> sessionIniciada [
	"Devuelve true si ya hay un usuario logueado al sistema para la sesión representada por el receptor."
	
	^self user notNil
]

{ #category : #'as yet unclassified' }
YavuSession >> sistema [
	"Devuelve el root asociado a la database session del receptor."
	
	^self databaseSession root
]

{ #category : #'as yet unclassified' }
YavuSession >> unregister [

	super unregister.
	self close
]

{ #category : #accessing }
YavuSession >> user [
	^ usuario
]

{ #category : #accessing }
YavuSession >> usuario: anObject [
	usuario := anObject
]

{ #category : #'as yet unclassified' }
YavuSession >> yavuSystem [

	^yavuSystem
]

{ #category : #'as yet unclassified' }
YavuSession >> yavuSystem: aYavuSystem [

	yavuSystem := aYavuSystem
]
