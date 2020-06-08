Class {
	#name : #YavuObjectDependecyChecker,
	#superclass : #YavuObject,
	#instVars : [
		'dependentClass',
		'referencesMethod'
	],
	#category : #'YavuCommon-Dependecy'
}

{ #category : #'as yet unclassified' }
YavuObjectDependecyChecker class >> on: aClass referencesMethod: aString [ 
	
	^ self new 
		initializeDependentClass: aClass referencesMethod: aString
]

{ #category : #'as yet unclassified' }
YavuObjectDependecyChecker >> existsReferencesTo: aYavuObject [
	
	^ self yavuSystem storedSubsystem 
			existsInstancesOf: dependentClass
			dependentOf: aYavuObject
			referencesMethod: referencesMethod
]

{ #category : #'as yet unclassified' }
YavuObjectDependecyChecker >> initializeDependentClass: aClass referencesMethod: aString [ 
	
	dependentClass := aClass.
	referencesMethod := aString 
]
