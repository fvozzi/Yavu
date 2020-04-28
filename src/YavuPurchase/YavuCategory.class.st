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

{ #category : #crud }
YavuCategory >> addToSystem [
	self subsystem addCategory: self
]

{ #category : #crud }
YavuCategory >> removeFromSystem [
	
	self yavuSystem purchaseSubsystem removeCategory: self
]

{ #category : #environment }
YavuCategory >> subsystem [
	^ self yavuSystem purchaseSubsystem
]
