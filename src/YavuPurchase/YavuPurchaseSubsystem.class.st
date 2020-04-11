Class {
	#name : #YavuPurchaseSubsystem,
	#superclass : #YavuSubsystem,
	#instVars : [
		'suppliers',
		'brands',
		'categories',
		'productTypes',
		'products'
	],
	#category : #'YavuPurchase-Environment'
}

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> entitiesClasses [
	
	^ OrderedCollection new
		add: YavuSupplier;
		add: YavuProduct;
		add: YavuBrand;
		add: YavuCategory;
		add: YavuProductType;
		yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
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
YavuPurchaseSubsystem >> addBrand: aBrand [
	
	self brands add: aBrand.
	self system storedSubsystem save: aBrand
]

{ #category : #crud }
YavuPurchaseSubsystem >> addCategory: aCategory [
	
	self categories add: aCategory.
	self system storedSubsystem save: aCategory
]

{ #category : #crud }
YavuPurchaseSubsystem >> addProduct: aProduct [
	
	self products add: aProduct.
	self system storedSubsystem save: aProduct
]

{ #category : #crud }
YavuPurchaseSubsystem >> addProductType: aProductType [
	
	self productTypes add: aProductType.
	self system storedSubsystem save: aProductType
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> addPurchaseInvoice: aPurchaseInvoice [ 

	self halt.
	self system storedSubsystem save: aPurchaseInvoice

]

{ #category : #accessing }
YavuPurchaseSubsystem >> brands [

	^ brands ifNil: [ brands := self system storedSubsystem instancesOf: YavuBrand ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> categories [

	^ categories ifNil: [ categories := self system storedSubsystem instancesOf: YavuCategory ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> name [ 

	 ^ 'Compras'
]

{ #category : #accessing }
YavuPurchaseSubsystem >> productTypes [

	^ productTypes ifNil: [ productTypes := self system storedSubsystem instancesOf: YavuProductType ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> products [

	^ products ifNil: [ products := self system storedSubsystem instancesOf: YavuProduct ]
]

{ #category : #'As yet unclassified' }
YavuPurchaseSubsystem >> purchaseInvoices [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> purchaseInvoicesOfSupplier: aYavuSupplier [ 
	
	 ^ self system storedSubsystem instancesOfClass: PurchaseInvoice withEntity: aYavuSupplier
]

{ #category : #crud }
YavuPurchaseSubsystem >> removeBrand: aBrand [
	
	self brands remove: aBrand.
	self system storedSubsystem remove: aBrand
]

{ #category : #crud }
YavuPurchaseSubsystem >> removeCategory: aCategory [
	
	self categories remove: aCategory.
	self system storedSubsystem remove: aCategory
]

{ #category : #crud }
YavuPurchaseSubsystem >> removeProductType: aProductType [
	
	self productTypes remove: aProductType.
	self system storedSubsystem remove: aProductType
]

{ #category : #crud }
YavuPurchaseSubsystem >> removeSupplier: aSupplier [
	
	self suppliers remove: aSupplier.
	self system storedSubsystem remove: aSupplier
]

{ #category : #accessing }
YavuPurchaseSubsystem >> suppliers [

	^ self system storedSubsystem instancesOf: YavuSupplier
]

{ #category : #crud }
YavuPurchaseSubsystem >> update: aSupplier [
	
	self system storedSubsystem save: aSupplier
]
