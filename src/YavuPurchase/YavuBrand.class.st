Class {
	#name : #YavuBrand,
	#superclass : #YavuEntity,
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuBrand class >> isVoyageRoot [

	 ^true 
]

{ #category : #'as yet unclassified' }
YavuBrand >> addToSystem [
	
	self yavuSystem purchaseSubsystem addBrand: self
]
