Class {
	#name : #StPersistence,
	#superclass : #YvObject,
	#instVars : [
		'root'
	],
	#classVars : [
		'Current'
	],
	#category : #'YavuInformes-Persistence'
}

{ #category : #'sin categoria' }
StPersistence class >> beCurrent [
	"Set a new receiver instance to be a current persistence method."

	| previus	|
	self notify: 'This change your data of place.'.
	previus := self current root.
	previus release.
	self current: super new.
	self current root: previus
]

{ #category : #'sin categoria' }
StPersistence class >> collectionClass [
	"Answer the recevier collection class."
	
	^self subclassResponsibility
]

{ #category : #'sin categoria' }
StPersistence class >> current [
	"Answer the current instance of the StPersistence singleton."
	
	Current isNil ifTrue: [self defaultPersistenceClass beCurrent].
	^Current
	
]

{ #category : #'sin categoria' }
StPersistence class >> current: aStPersistence [
	"Set the current instance of the StPersistence singleton with aStPersistence."
	
	Current := aStPersistence.
	^Current
	
]

{ #category : #'sin categoria' }
StPersistence class >> defaultPersistenceClass [
	"Answer the system default persistence class."
	
	^StImagePersistence
]

{ #category : #'sin categoria' }
StPersistence class >> reset [
	"Reset the reciver current variable."
	
	Current:= nil
]

{ #category : #'sin categoria' }
StPersistence >> beCurrent [
	"Set a new receiver instance to be a current persistence method."
	
	^self class current: self
]

{ #category : #'sin categoria' }
StPersistence >> collectionClass [
	"Answer the recevier collection class."
	
	^self class collectionClass
]

{ #category : #'sin categoria' }
StPersistence >> newCollection [
	"Answer a new collection dependening of the receiver collection class."
	
	^self collectionClass new
]

{ #category : #'sin categoria' }
StPersistence >> release [

	self root: nil
]

{ #category : #'sin categoria' }
StPersistence >> root [
	^ root
]

{ #category : #'sin categoria' }
StPersistence >> root: anObject [
	root := anObject
]
