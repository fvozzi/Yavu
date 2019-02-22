Class {
	#name : #KegAdministrationTest,
	#superclass : #TestCase,
	#category : #'YavuBeerStack-Test'
}

{ #category : #adding }
KegAdministrationTest >> currentSystem [
	
	^YavuEnvironment newSystem
]

{ #category : #'As yet unclassified' }
KegAdministrationTest >> newKegNummberOne [
	
	^Keg number: 1 size: 50
]

{ #category : #adding }
KegAdministrationTest >> setUp [

	YavuEnvironment 
		systemClass: (YavuBeerStackSystem 
			enabledSubsystemsClasses: (Array with: YavuTransientSubsystem))
]

{ #category : #adding }
KegAdministrationTest >> testAddANewKegToPlant [
	
	| kegManager |
	
	kegManager := self currentSystem.
	kegManager addNewKeg: self newKegNummberOne.
	self assert: kegManager amountOfKeg equals: 1
	
	
]
