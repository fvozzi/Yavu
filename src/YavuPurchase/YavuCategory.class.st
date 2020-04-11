Class {
	#name : #YavuCategory,
	#superclass : #YavuEntity,
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuCategory class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuCategory class >> label [ 

	^ 'Categoria'
]

{ #category : #'as yet unclassified' }
YavuCategory >> addToSystem [
	
	self yavuSystem purchaseSubsystem addCategory: self
]

{ #category : #removing }
YavuCategory >> removeFromSystem [
	
	self yavuSystem purchaseSubsystem removeCategory: self
]
