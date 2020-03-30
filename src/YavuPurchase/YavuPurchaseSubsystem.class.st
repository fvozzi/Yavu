Class {
	#name : #YavuPurchaseSubsystem,
	#superclass : #YavuSubsystem,
	#instVars : [
		'suppliers'
	],
	#category : #'YavuPurchase-Environment'
}

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> subsystemName [

	^ 'Compras'
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> subsystemTag [

	 ^'purchaseSubsystem'
]

{ #category : #adding }
YavuPurchaseSubsystem >> addSupplier: aSupplier [
	
	self suppliers add: aSupplier.
	self halt.
	self system storedSubsystem store: aSupplier
]

{ #category : #accessing }
YavuPurchaseSubsystem >> name [ 

	 ^ 'Compras'
]

{ #category : #accessing }
YavuPurchaseSubsystem >> suppliers [
	^ suppliers ifNil: [ self system storedSubsystem instancesOf: Supplier ]
]
