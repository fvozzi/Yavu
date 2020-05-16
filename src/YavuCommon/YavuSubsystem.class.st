Class {
	#name : #YavuSubsystem,
	#superclass : #Object,
	#instVars : [
		'system'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #configuration }
YavuSubsystem class >> entitiesClasses [

	^ self subclassResponsibility 
]

{ #category : #configuration }
YavuSubsystem class >> menuElements [
	
	^ OrderedCollection new
]

{ #category : #'instance creation' }
YavuSubsystem class >> on: aYavuSystem [

	^self new initializeSystem: aYavuSystem 
]

{ #category : #configuration }
YavuSubsystem class >> subsystemName [

	^ 'Subsistema'
]

{ #category : #configuration }
YavuSubsystem class >> transactionsClasses [

	^ self subclassResponsibility 
]

{ #category : #initialization }
YavuSubsystem >> initializeSystem: aSystem [

	system := aSystem 
]

{ #category : #accessing }
YavuSubsystem >> name [ 

	 ^ 'Subsistema'
]

{ #category : #'as yet unclassified' }
YavuSubsystem >> system [
	^ system
]

{ #category : #updating }
YavuSubsystem >> update: aYavuObject [

	self subclassResponsibility 
]
