Class {
	#name : #YavuTestEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #'as yet unclassified' }
YavuTestEnvironment class >> deploymentMode [

	^ false
]

{ #category : #'as yet unclassified' }
YavuTestEnvironment class >> mongoDatabaseName [

 ^ 'yavuSystemTest'
]
