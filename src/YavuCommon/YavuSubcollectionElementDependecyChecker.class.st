Class {
	#name : #YavuSubcollectionElementDependecyChecker,
	#superclass : #YavuObjectDependecyChecker,
	#instVars : [
		'collectionMethod'
	],
	#category : #'YavuCommon-Dependecy'
}

{ #category : #'as yet unclassified' }
YavuSubcollectionElementDependecyChecker class >> on: aClass referencesMethod: methodSymbol collectionMethod: collectionSymbol [
	^ (super on: aClass referencesMethod: methodSymbol)
		initializeCollectionMethod: collectionSymbol
]

{ #category : #'as yet unclassified' }
YavuSubcollectionElementDependecyChecker >> existsReferencesTo: aYavuObject [
	
	^ self yavuSystem storedSubsystem 
			existsInstancesOf: dependentClass
			dependentOfSubcollectionElement: aYavuObject
			referencesMethod: referencesMethod
			collectionMethod: collectionMethod
]

{ #category : #initialization }
YavuSubcollectionElementDependecyChecker >> initializeCollectionMethod: aCollectionMethod [ 

	collectionMethod := aCollectionMethod 
]
