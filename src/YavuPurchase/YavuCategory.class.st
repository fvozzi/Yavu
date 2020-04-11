Class {
	#name : #YavuCategory,
	#superclass : #YavuEntity,
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuCategory class >> isVoyageRoot [

	 ^true 
]

{ #category : #'as yet unclassified' }
YavuCategory >> addToSystem [
	
	self yavuSystem purchaseSubsystem addCategory: self
]
