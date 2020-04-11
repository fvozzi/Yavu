Class {
	#name : #YavuCategory,
	#superclass : #YvEntity,
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
