Class {
	#name : #YavuBeerStackSystem,
	#superclass : #YavuSystem,
	#instVars : [
		'kegs'
	],
	#category : #'YavuBeerStack-Environment'
}

{ #category : #'as yet unclassified' }
YavuBeerStackSystem class >> mongoDatabaseName [ 
	
	^ 'yavuBeerStack'
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
