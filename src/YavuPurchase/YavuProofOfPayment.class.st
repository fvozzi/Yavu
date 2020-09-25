Class {
	#name : #YavuProofOfPayment,
	#superclass : #YavuTransaction,
	#instVars : [
		'serviceContract',
		'paymentAmount'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'sin categoria' }
YavuProofOfPayment class >> entityClass [
	
	^ YavuSupplier 
]

{ #category : #testing }
YavuProofOfPayment class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuProofOfPayment class >> label [ 

	^ 'Pago a proveedores'
]
