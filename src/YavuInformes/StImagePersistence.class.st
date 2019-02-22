Class {
	#name : #StImagePersistence,
	#superclass : #StPersistence,
	#category : #'YavuInformes-Persistence'
}

{ #category : #'sin categoria' }
StImagePersistence class >> collectionClass [
	"Answer the recevier collection class."
	
	^OrderedCollection
]

{ #category : #'sin categoria' }
StImagePersistence >> commit: aBlock [

	aBlock value.
	SmalltalkImage current snapshot: true andQuit: false 
]
