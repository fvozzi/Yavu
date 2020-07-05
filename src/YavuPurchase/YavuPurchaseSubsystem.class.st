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
YavuPurchaseSubsystem >> accountingAccounts [

	^ self system accountingSubsystem accountingAccounts
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

	self system storedSubsystem save: aPurchaseInvoice

]

{ #category : #crud }
YavuPurchaseSubsystem >> addSupplier: aProduct [
	
	self suppliers add: aProduct.
	self system storedSubsystem save: aProduct
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> availablePurchaseTransactionsFor: aYavuSupplier [ 
	
	^ (self purchaseTransactionsOfSupplier: aYavuSupplier) select: [ :each | each available ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> brands [

	^ brands ifNil: [ brands := (self system storedSubsystem instancesOf: YavuBrand) copy ]
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> cashPaymentType [
	self paymentTypes select: [ :each | each name = 'Efectivo' ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> categories [

	^ categories ifNil: [ categories := (self system storedSubsystem instancesOf: YavuCategory) copy ]
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> decimalAccuracy [

	^ 4
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> decimalFiscalAccuracy [

	^ 2
]

{ #category : #removing }
YavuPurchaseSubsystem >> dependencies [
	^ super dependencies
		at: YavuPaymentType
			put:
			(OrderedCollection
				with:
					(YavuObjectDependecyChecker
						on: YavuPurchaseTransaction
						referencesMethod: #paymentType));
		at: YavuPurchaseTransaction
			put:
			(OrderedCollection
				with:
					(YavuNotNullDependecyChecker
						on: YavuPurchaseTransaction
						referencesMethod: #invoice));
		"at: YavuPurchaseInvoice
			put:
			(OrderedCollection
				with:
					(YavuObjectDependecyChecker
						on: YavuPurchaseTransaction
						referencesMethod: #invoice));"
		at: YavuBrand
			put:
			(OrderedCollection
				with:
					(YavuObjectDependecyChecker on: YavuProduct referencesMethod: #brand));
		at: YavuProduct
			put:
			(OrderedCollection
				with:
					(YavuSubcollectionElementDependecyChecker
						on: YavuPurchaseTransaction
						referencesMethod: #product
						collectionMethod: #purchaseTransactionItems));
		at: YavuSupplier 
			put:
			(OrderedCollection
				with:
					(YavuObjectDependecyChecker on: YavuPurchaseTransaction referencesMethod: #entity)
				with:
					(YavuObjectDependecyChecker on: YavuPurchaseInvoice referencesMethod: #entity));
		yourself
]

{ #category : #accessing }
YavuPurchaseSubsystem >> invoiceTypes [

	^ YavuInvoiceType allSubclasses 
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> kilogramPresentationUnit [
	
	^ self presentationUnits detect: [ :each | each name = 'Kilogramo' ] ifNone: [ self kilogramPresentationUnitDefault ]
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> kilogramPresentationUnitDefault [
	
	^ YavuProductPresentationUnit new
		name: 'Kilogramo';
		kilograms: 1;
		yourself
]

{ #category : #accessing }
YavuPurchaseSubsystem >> name [ 

	 ^ 'Compras'
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> paymentTypes [

	^ self system storedSubsystem instancesOf: YavuPaymentType 
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> presentationUnits [

	^ self system storedSubsystem instancesOf: YavuProductPresentationUnit 
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

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> purchaseInvoicesOfBusinessName: aYavuBusinessName vatDeclarationMonth: aDate [ 
	
	^ self system storedSubsystem 
		instancesOfClass: YavuPurchaseInvoice
		from: aDate beginOfMonth 
		to: aDate endOfMonth 
		dateSelector: #vatDeclarationMonth
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
