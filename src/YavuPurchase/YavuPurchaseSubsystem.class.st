Class {
	#name : #YavuPurchaseSubsystem,
	#superclass : #YavuSubsystem,
	#category : #'YavuPurchase-Environment'
}

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem class >> fontAwesomeClass [

	^ 'fa-shopping-cart'
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
YavuPurchaseSubsystem >> accountingAccounts [

	^ self system accountingSubsystem accountingAccounts
]

{ #category : #accessing }
YavuPurchaseSubsystem >> activeServicesContracts [
	"Devuelvo todos los contratos de servicios pero porque Magritte me limita para pasarle el proveedor seleccionado y la fecha del pago."

	^ self system storedSubsystem 
		instancesOf: YavuServiceContract 
]

{ #category : #accessing }
YavuPurchaseSubsystem >> activeSuppliers [

	^ self suppliers reject: [ :each | each isInnactive notNil and: [each isInnactive]]
]

{ #category : #crud }
YavuPurchaseSubsystem >> addPurchaseInvoice: aPurchaseInvoice [ 

	self system storedSubsystem save: aPurchaseInvoice

]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> allAvailableRecipes [
	
	^ YavuRecipe all
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> availablePurchaseTransactionsFor: aYavuSupplier [ 
	
	^ (self purchaseTransactionsOfSupplier: aYavuSupplier) select: [ :each | each available ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> brands [

	^ self system storedSubsystem instancesOf: YavuBrand
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> cashPaymentType [
	self paymentTypes select: [ :each | each name = 'Efectivo' ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> categories [

	^ self system storedSubsystem instancesOf: YavuCategory
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
		at: YavuProductType
			put:
			(OrderedCollection
				with:
					(YavuObjectDependecyChecker on: YavuProduct referencesMethod: #productType));
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

{ #category : #'As yet unclassified' }
YavuPurchaseSubsystem >> possibleRecipeIngredients [
	"Answer possible products and other recipes"
	
	| possibleRecipesAsIngredients |
	
	possibleRecipesAsIngredients := self recipes select: [ :each | each availableAsIngredient ].
	^ self productTypes, possibleRecipesAsIngredients 
	
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> presentationUnits [

	^ self system storedSubsystem instancesOf: YavuProductPresentationUnit 
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> productOfBrand: aYavuBrand type: aYavuProductType [ 
	
		^ self products detect: [ :one | one brand = aYavuBrand and: [ one productType = aYavuProductType  ] ] 
			
]

{ #category : #accessing }
YavuPurchaseSubsystem >> productTypes [

	^ self system storedSubsystem instancesOf: YavuProductType
]

{ #category : #accessing }
YavuPurchaseSubsystem >> products [

	^ self system storedSubsystem instancesOf: YavuProduct
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

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> purchaseTransactionsFrom: startDate to: endDate [ 
	
	^ YavuPurchaseTransaction instancesFrom: startDate to: endDate
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> purchaseTransactionsOfSupplier: aYavuSupplier [ 
	
	 ^ self system storedSubsystem instancesOfClass: YavuPurchaseTransaction withEntity: aYavuSupplier
]

{ #category : #'api/queries' }
YavuPurchaseSubsystem >> purchaseTransactionsOfSuppliers: aCollectionOfSuppliers from: startDate to: endDate [ 

	^ self system storedSubsystem 
		instancesOfClass: YavuPurchaseTransaction
		from: startDate 
		to: endDate
		entities: aCollectionOfSuppliers
]

{ #category : #'tests-as yet unclassified' }
YavuPurchaseSubsystem >> recipeCost: aYavuRecipe at: aDate [ 
	
	| purchases purchaseItems purchaseItemsByProduct |
	
	"Needs refactoring to use a currect query."
	purchases := self purchaseTransactionsOfSuppliers: self suppliers from: '01/01/1900' asDate to: aDate. 
	purchaseItems := purchases collectAll: [ :each | each purchaseTransactionItems].
	purchaseItemsByProduct := purchaseItems classifiedBy: [ :each | each product ].
	^ aYavuRecipe recipeIngredients inject: 0 into: [ :accum :each |  | item cost |
		"Refactor to elimnate this if statemente"
		(item := purchaseItemsByProduct at: each ingredient ifAbsent: [ ]) notNil ifTrue: [ 
			cost := item unitPrice.
			cost * (1 * each unit) / (1 * item presentationUnit) * each quantity 						
			 ]
		ifFalse: [ 0 ]
		
		 ] 
]

{ #category : #accessing }
YavuPurchaseSubsystem >> recipes [

	^ self system storedSubsystem instancesOf: YavuRecipe
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

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystem >> servicesSuppliers [
	
	^ self suppliers select: [ :each | each isServiceProvider ]
]

{ #category : #accessing }
YavuPurchaseSubsystem >> suppliers [

	^ self system storedSubsystem instancesOf: YavuSupplier
]

{ #category : #accessing }
YavuPurchaseSubsystem >> vatPercentageDefault [
	
	^ 21
]
