Class {
	#name : #YavuPurchaseSubsystem,
	#superclass : #YavuSubsystem,
	#instVars : [
		'suppliers'
	],
	#category : #'YavuPurchase-Environment'
}

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> entitiesClasses [
	
	^ OrderedCollection with: Supplier  
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((SimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> subsystemName [

	^ 'Compras'
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> subsystemTag [

	 ^'purchaseSubsystem'
]

{ #category : #crud }
YavuPurchaseSubsystem >> addSupplier: aSupplier [
	
	self suppliers add: aSupplier.
	self system storedSubsystem save: aSupplier
]

{ #category : #accessing }
YavuPurchaseSubsystem >> name [ 

	 ^ 'Compras'
]

{ #category : #crud }
YavuPurchaseSubsystem >> removeSupplier: aSupplier [
	
	self halt.
	self suppliers remove: aSupplier.
	self system storedSubsystem remove: aSupplier
]

{ #category : #accessing }
YavuPurchaseSubsystem >> suppliers [

	self halt.
	^ suppliers ifNil: [ suppliers := self system storedSubsystem instancesOf: Supplier ]
]

{ #category : #crud }
YavuPurchaseSubsystem >> update: aSupplier [
	
	self system storedSubsystem save: aSupplier
]
