Class {
	#name : #YavuBeerStackSystem,
	#superclass : #YavuSystem,
	#instVars : [
		'kegs'
	],
	#category : #'YavuBeerStack-Environment'
}

{ #category : #initialization }
YavuBeerStackSystem class >> initializeSubsystemsForDevelopment [

	self enabledSubsystemsClasses: (Array 
											with: YavuMongoSubsystem 
											with: YavuSecuritySubsystem
											with: YavuPurchaseSubsystem
											with: YavuSaleSubsystem 
											with: YavuAccountingSubsystem)
]

{ #category : #initialization }
YavuBeerStackSystem class >> initializeSubsystemsForProduction [

	self initializeSubsystemsForDevelopment 
]

{ #category : #initialization }
YavuBeerStackSystem class >> initializeSubsystemsForTesting [

	self enabledSubsystemsClasses: (Array 
											with: YavuTransientSubsystem 
											with: YavuSecuritySubsystem
											with: YavuPurchaseSubsystem
											with: YavuSaleSubsystem 
											with: YavuAccountingSubsystem)
]

{ #category : #'as yet unclassified' }
YavuBeerStackSystem class >> resourceBaseUrlForProduction [

	^ 'https://lagoonbeer.com.ar/yavu-lagoon/'
]

{ #category : #'as yet unclassified' }
YavuBeerStackSystem class >> systemName [
	
	^ 'YavuBeerStack'
]

{ #category : #adding }
YavuBeerStackSystem >> addNewKeg: aKeg [ 

	^kegs add: aKeg
]

{ #category : #'as yet unclassified' }
YavuBeerStackSystem >> amountOfKeg [
	
	^kegs size
]

{ #category : #initialization }
YavuBeerStackSystem >> initialize [

	super initialize.
	kegs := OrderedCollection new
]
