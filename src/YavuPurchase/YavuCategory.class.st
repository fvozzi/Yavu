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

{ #category : #accessing }
YavuCategory class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #environment }
YavuCategory >> subsystem [
	^ self yavuSystem purchaseSubsystem
]
