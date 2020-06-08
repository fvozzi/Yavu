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

{ #category : #accessing }
YavuBrand class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #environment }
YavuBrand >> subsystem [
	^ self yavuSystem purchaseSubsystem
]
