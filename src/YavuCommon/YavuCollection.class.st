Class {
	#name : #YavuCollection,
	#superclass : #YavuObject,
	#instVars : [
		'collection'
	],
	#category : #'YavuCommon-AnnouncementSupport'
}

{ #category : #'instance creation' }
YavuCollection class >> on: aCollection [ 

	^ self new initializeCollection: aCollection
]

{ #category : #adding }
YavuCollection >> add: anObject [

	self halt.
	collection add: anObject.
	self system announce: YavuCollectionElementAdded new
]

{ #category : #'reflective operations' }
YavuCollection >> doesNotUnderstand: aMessage [

	^ aMessage sendTo: collection
]

{ #category : #initialization }
YavuCollection >> initializeCollection: aCollection [

	collection := aCollection 
]
