Class {
	#name : #YavuDevelopmentEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #'as yet unclassified' }
YavuDevelopmentEnvironment class >> deploymentMode [

	^ false
]

{ #category : #seaside }
YavuDevelopmentEnvironment class >> fontAwesomeLibrary [
	
	^ FAWDevelopmentLibrary
]

{ #category : #system }
YavuDevelopmentEnvironment class >> initializeSubsystems [

	self systemClass initializeSubsystemsForDevelopment
	

										
]

{ #category : #seaside }
YavuDevelopmentEnvironment class >> jqLibrary [
	
	^ JQDevelopmentLibrary
]

{ #category : #mongo }
YavuDevelopmentEnvironment class >> mongoDatabaseName [

 ^ CurrentSystemClass mongoDatabaseName
]

{ #category : #'as yet unclassified' }
YavuDevelopmentEnvironment class >> serverPath [

	^ '' 
]

{ #category : #seaside }
YavuDevelopmentEnvironment class >> tbsLibrary [
	
	^ SBSDevelopmentLibrary
]
