Class {
	#name : #YavuSubsystem,
	#superclass : #Object,
	#instVars : [
		'system'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #'as yet unclassified' }
YavuSubsystem class >> menuElements [
	
	^ OrderedCollection new
]

{ #category : #'instance creation' }
YavuSubsystem class >> on: aYavuSystem [

	^self new initializeSystem: aYavuSystem 
]

{ #category : #initialization }
YavuSubsystem >> initializeSystem: aYavuSystem [

	system := aYavuSystem 
]

{ #category : #'as yet unclassified' }
YavuSubsystem >> system [
	^ system
]
