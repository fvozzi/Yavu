Class {
	#name : #YavuPurchaseSubsystemTest,
	#superclass : #TestCase,
	#instVars : [
		'system'
	],
	#category : #'YavuPurchase-Test'
}

{ #category : #resources }
YavuPurchaseSubsystemTest >> barraDamboLaPaulinaProduct [
	
	^ YavuProduct new 
		brand: self laPaulinaBrand;
		productType: self damboProductType;
		vatPercentage: 21;
		yourself
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> damboProductType [
	
	^ (YavuProductType name: 'Dambo')
			category: self quesoCategory;
			yourself 
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> itemOnBarraDamboLaPaulina [
	
	^ InvoiceItem new 
		product: self barraDamboLaPaulinaProduct;
		quantity: 1;
		unitPrice: 10;
		yourself
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> laPaulinaBrand [
	
	^ YavuBrand name: 'La Paulina'
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> newQuesosDelAbastoSupplier [

	^ (YavuSupplier name: 'Bulacio Cesar Oscar')
			businessName: 'Quesos del Abasto';
			vatCondition: YavuResponsableInscripto;
			cuitNumber: '20144310579';
			yourself
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> newSubsystem [

	YavuEnvironment 
		systemClass: (YavuResturantSystem
			enabledSubsystemsClasses: (Array with: YavuTransientSubsystem with: YavuPurchaseSubsystem )).
	^ YavuEnvironment currentSystem
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> quesoCategory [

	^ YavuCategory name: 'Quesos'
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> quesosDelAbastoPurchaseInvoice [
	
	^ PurchaseInvoice new
		entity: self quesosDelAbastoSupplier;
		date: '04/11/2020' asDate;
		yourself
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> quesosDelAbastoSupplier [

	^system purchaseSubsystem suppliers detect: [ :each | each businessName = 'Quesos del Abasto' ]
]

{ #category : #running }
YavuPurchaseSubsystemTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	system := self newSubsystem.
	self newQuesosDelAbastoSupplier addToSystem
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testAddProductsToInvoice [

	| invoice itemProduct1 |
	
	invoice := self quesosDelAbastoPurchaseInvoice.
	itemProduct1 := self itemOnBarraDamboLaPaulina.
	invoice addInvoiceItem: itemProduct1 .
	self assert: invoice invoiceItems size = 1.
	self assert: (invoice invoiceItems first product = itemProduct1 product). 
	self assert: invoice total = itemProduct1 total.
	self assert: invoice netPrice = itemProduct1 netPrice
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testAddPurchaseInvoice [

	| invoice |
	
	invoice := self quesosDelAbastoPurchaseInvoice.
	invoice addToSystem.
	self assert: (system purchaseSubsystem purchaseInvoicesOfSupplier: self quesosDelAbastoSupplier) size = 1.
	self assert: (system purchaseSubsystem purchaseInvoicesOfSupplier: self quesosDelAbastoSupplier) first date = invoice date
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testPurchaseInvoiceTypeDependingOnSupplier [

	| invoice |
	
	invoice := self quesosDelAbastoPurchaseInvoice.
	self assert: invoice invoiceType = InvoiceTypeA
]
