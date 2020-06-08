Class {
	#name : #YavuNotNullDependecyChecker,
	#superclass : #YavuObjectDependecyChecker,
	#category : #'YavuCommon-Dependecy'
}

{ #category : #'as yet unclassified' }
YavuNotNullDependecyChecker >> existsReferencesTo: aYavuObject [
	
	^ (aYavuObject perform: referencesMethod) notNil 
]
