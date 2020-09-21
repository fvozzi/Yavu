Class {
	#name : #YavuTestEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #'as yet unclassified' }
YavuTestEnvironment class >> deploymentMode [

	^ false
]

{ #category : #system }
YavuTestEnvironment class >> initializeSubsystems [

	self systemClass initializeSubsystemsForTesting
]

{ #category : #'as yet unclassified' }
YavuTestEnvironment class >> mongoDatabaseName [

 ^ 'yavuSystemTest'
]

{ #category : #'as yet unclassified' }
YavuTestEnvironment class >> serverPath [

	^ '' 
]
