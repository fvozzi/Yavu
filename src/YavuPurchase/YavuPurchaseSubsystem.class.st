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

{ #category : #accessing }
YavuPurchaseSubsystem class >> label [ 

	^ 'Subsistema Compras'
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		add: ((YavuSimpleMenuElement label: 'Compras' presenterClass: TBSTransactionsBrowserView subsystem: self) id: 2);
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

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> transactionsClasses [
	
	^ OrderedCollection new
		add: YavuPurchaseTransaction;
		add: YavuPurchaseInvoice;
		yourself
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

{ #category : #crud }
YavuPurchaseSubsystem >> addPurchaseInvoice: aPurchaseInvoice [ 

	self halt.
	self system storedSubsystem save: aPurchaseInvoice

]

{ #category : #crud }
YavuPurchaseSubsystem >> addSupplier: aProduct [
	
	self suppliers add: aProduct.
	self system storedSubsystem save: aProduct
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> availablePurchaseTransactionsFor: aYavuSupplier [ 
	
	^ (self purchaseTransactionsOfSupplier: aYavuSupplier) select: [ :each | each available ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> brands [

	^ brands ifNil: [ brands := (self system storedSubsystem instancesOf: YavuBrand) copy ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> categories [

	^ categories ifNil: [ categories := (self system storedSubsystem instancesOf: YavuCategory) copy ]
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> decimalAccuracy [

	^ 2
]

{ #category : #accessing }
YavuPurchaseSubsystem >> invoiceTypes [

	^ YavuInvoiceType allSubclasses 
]

{ #category : #accessing }
YavuPurchaseSubsystem >> name [ 

	 ^ 'Compras'
]

{ #category : #accessing }
YavuPurchaseSubsystem >> productTypes [

	^ productTypes ifNil: [ productTypes := (self system storedSubsystem instancesOf: YavuProductType) copy ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> products [

	^ products ifNil: [ products := (self system storedSubsystem instancesOf: YavuProduct) copy ]
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> purchaseInvoices [
	self shouldBeImplemented.
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> purchaseInvoicesOfSupplier: aYavuSupplier [ 
	
	 ^ self system storedSubsystem instancesOfClass: YavuPurchaseInvoice withEntity: aYavuSupplier
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> purchaseInvoicesOfSuppliers: aCollectionOfSuppliers from: startDate to: endDate [ 

	^ self system storedSubsystem 
		instancesOfClass: YavuPurchaseTransaction
		from: startDate 
		to: endDate
		entities: aCollectionOfSuppliers
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> purchaseTransactionsOfSupplier: aYavuSupplier [ 
	
	 ^ self system storedSubsystem instancesOfClass: YavuPurchaseTransaction withEntity: aYavuSupplier
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
YavuPurchaseSubsystem >> removeProduct: aProduct [
	
	self products remove: aProduct.
	self system storedSubsystem remove: aProduct
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
YavuPurchaseSubsystem >> update: aYavuObject [
	
	self system storedSubsystem update: aYavuObject
]

{ #category : #accessing }
YavuPurchaseSubsystem >> vatPercentageDefault [
	
	^ 21
]
