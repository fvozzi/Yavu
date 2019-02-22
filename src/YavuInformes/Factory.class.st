Class {
	#name : #Factory,
	#superclass : #YavuObject,
	#instVars : [
		'objectClass',
		'instances',
		'searchSelector',
		'searchValue'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
Factory class >> on: aObjectClass [

	^self new objectClass: aObjectClass 
]

{ #category : #'as yet unclassified' }
Factory >> add: anObject [
	"Add anObject to the current system collection of it."
	
	^anObject store
]

{ #category : #'as yet unclassified' }
Factory >> defaultSearchLabel [
	^ self objectClass
		ifNil: [ #() ]
		ifNotNil: [ :each | each defaultSearchLabel ]
]

{ #category : #'as yet unclassified' }
Factory >> initializeInstances [
	"Answer the receiver select objectClass all instances."

	^self objectClass isNil 
		ifTrue: [OrderedCollection new]
		ifFalse: [self objectClass allForCompany: self company]
]

{ #category : #'as yet unclassified' }
Factory >> instances [
	"Answer the receiver select objectClass all instances."
	
	^self objectClass isNil 
		ifTrue: [OrderedCollection new]
		ifFalse: [self yavuSystem instancesOf: self objectClass ]
]

{ #category : #'sin categoria' }
Factory >> nuevoElemento [
	
	^self objectClass new
]

{ #category : #'sin categoria' }
Factory >> objectClass [
	^ objectClass
]

{ #category : #'sin categoria' }
Factory >> objectClass: anObject [
	objectClass := anObject
]

{ #category : #'as yet unclassified' }
Factory >> possibleSearchSelectors [

	^self objectClass ifNil: [#()] ifNotNilDo: [:each | each possibleSearchSelectors]
]

{ #category : #'as yet unclassified' }
Factory >> remove: anObject [
	"Add anObject to the current system collection of it."
	
	^anObject eliminar
	
]

{ #category : #'as yet unclassified' }
Factory >> resetInstances [

	instances := nil
]

{ #category : #'as yet unclassified' }
Factory >> searchInstances [
	"Answer the receiver select objectClass all instances."

	instances := self objectClass allForCompany: self company searchSelector: self searchSelector searchValue: self searchValue 
]

{ #category : #accessing }
Factory >> searchSelector [
	
	searchSelector isNil ifTrue: [ searchSelector := self possibleSearchSelectors at: self defaultSearchLabel  ].
	^searchSelector
]

{ #category : #accessing }
Factory >> searchSelector: anObject [
	
	searchSelector := anObject
]

{ #category : #accessing }
Factory >> searchValue [
	
	^ searchValue
]

{ #category : #accessing }
Factory >> searchValue: anObject [
	
	searchValue := anObject
]
