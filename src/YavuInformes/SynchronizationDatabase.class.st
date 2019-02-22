Class {
	#name : #SynchronizationDatabase,
	#superclass : #Transaction,
	#instVars : [
		'synchronizationDate'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
SynchronizationDatabase class >> entity: anEntity date: aDate synchronizationDate: anotherDate [
	"Devuelve una nueva instancia del receptor inicializada con unaEntidad, unaFecha y otraFecha."
	
	^(super entity: anEntity date: aDate) initializeSynchronizationDate: anotherDate
]

{ #category : #'sin categoria' }
SynchronizationDatabase >> entityClassLiteral [

	^self entity asSQLLiteral
]

{ #category : #'sin categoria' }
SynchronizationDatabase >> entityClassLiteral: aLiteral [
	"Set the entity instance variable from aLiteral."
	
	^self entity: (Smalltalk at: aLiteral asSymbol ifAbsent: [])
]

{ #category : #'sin categoria' }
SynchronizationDatabase >> initializeSynchronizationDate: aDate [

	synchronizationDate := aDate
]
