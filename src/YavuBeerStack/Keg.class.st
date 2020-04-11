Class {
	#name : #Keg,
	#superclass : #YavuEntity,
	#instVars : [
		'number',
		'size'
	],
	#category : #'YavuBeerStack-Test'
}

{ #category : #'instance creation' }
Keg class >> number: aKegNumber size: aKegSize [ 
	
	^self new initializeNumber: aKegNumber size: aKegSize 
]

{ #category : #initialization }
Keg >> initializeNumber: aKegNumber size: aKegSize [ 
	
	number := aKegNumber.
	size := aKegSize
]
