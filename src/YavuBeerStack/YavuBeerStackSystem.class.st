Class {
	#name : #YavuBeerStackSystem,
	#superclass : #YavuSystem,
	#instVars : [
		'kegs'
	],
	#category : #'YavuBeerStack-Environment'
}

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
