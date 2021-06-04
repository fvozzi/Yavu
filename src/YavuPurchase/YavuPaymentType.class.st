Class {
	#name : #YavuPaymentType,
	#superclass : #YavuEntity,
	#category : #'YavuPurchase-Model'
}

{ #category : #testing }
YavuPaymentType class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuPaymentType class >> label [ 

	 ^ 'Método de pago'
]

{ #category : #accessing }
YavuPaymentType class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]
