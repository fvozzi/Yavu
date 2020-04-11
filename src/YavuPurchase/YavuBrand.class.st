Class {
	#name : #YavuBrand,
	#superclass : #YavuEntity,
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuBrand class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuBrand class >> label [ 

	 ^ 'Marca'
]

{ #category : #'as yet unclassified' }
YavuBrand >> addToSystem [
	
	self yavuSystem purchaseSubsystem addBrand: self
]

{ #category : #removing }
YavuBrand >> removeFromSystem [
	
	self yavuSystem purchaseSubsystem removeBrand: self
]
