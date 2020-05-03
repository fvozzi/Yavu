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

{ #category : #crud }
YavuBrand >> addToSystem [


	self halt.
	self subsystem addBrand: self
]

{ #category : #crud }
YavuBrand >> removeFromSystem [
	
	self yavuSystem purchaseSubsystem removeBrand: self
]

{ #category : #environment }
YavuBrand >> subsystem [
	^ self yavuSystem purchaseSubsystem
]
