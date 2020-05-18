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
	
	^ YavuInvoiceItem new 
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

	YavuTestEnvironment beCurrent.
	YavuTestEnvironment 
		systemClass: (YavuRestaurantSystem
			enabledSubsystemsClasses: (Array with: YavuTransientSubsystem with: YavuPurchaseSubsystem )).
	^ YavuTestEnvironment currentSystem
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> panaderiaGalliPurchaseInvoice [
	
	^ YavuPurchaseInvoice new
		entity: self panaderiaGalliSupplier;
		date: '04/11/2020' asDate;
		yourself
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> panaderiaGalliSupplier [

	^ (YavuSupplier name: 'Panaderia Galli')
			businessName: 'Carlitos Pan';
			vatCondition: YavuNoInscripto;
			yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystemTest >> purchaseInvoiceItem1 [
	
	^ YavuInvoiceItem new
		quantity: 1;
		unitPrice: 10;
		yourself
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> quesoCategory [

	^ YavuCategory name: 'Quesos'
]

{ #category : #resources }
YavuPurchaseSubsystemTest >> quesosDelAbastoPurchaseInvoice [
	
	^ YavuPurchaseInvoice new
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

{ #category : #running }
YavuPurchaseSubsystemTest >> tearDown [
	"Hooks that subclasses may override to define the fixture of test."

	"YavuSupplier removeAll.
	YavuPurchaseInvoice removeAll"
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testAddPrefixAndInvoiceNumberToInvoice [

	| invoice |
	
	invoice := self quesosDelAbastoPurchaseInvoice.
	invoice prefix: 1.
	invoice invoiceNumber: 100.
	self assert: invoice prefix equals: 1.
	self assert: invoice invoiceNumber equals: 100.
	self assert: invoice formattedPrefix equals: '0001'.
	self assert: invoice formattedInvoiceNumber equals: '00000100'.
	invoice prefix: 103.
	self assert: invoice formattedPrefix equals: '0103'
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testAddProductsToInvoice [

	| invoice itemProduct1 |
	
	invoice := self quesosDelAbastoPurchaseInvoice.
	itemProduct1 := self itemOnBarraDamboLaPaulina.
	invoice addInvoiceItem: itemProduct1 .
	self assert: invoice invoiceItems size = 1.
	self assert: (invoice invoiceItems first product = itemProduct1 product). 
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
YavuPurchaseSubsystemTest >> testPurchaseInvoiceFactAVATCalculation [

	| invoice |
	
	invoice := self quesosDelAbastoPurchaseInvoice.
	self assert: invoice invoiceType = YavuInvoiceTypeA.
	invoice addInvoiceItem: self purchaseInvoiceItem1.
	self assert: invoice netPrice equals: invoice invoiceItems first netPrice.
	self assert: invoice total equals: invoice netPrice + (invoice netPrice * invoice invoiceItems first vatPercentage / 100)
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testPurchaseInvoiceFactXVATCalculation [

	| invoice |
	
	invoice := self panaderiaGalliPurchaseInvoice.
	self assert: invoice invoiceType = YavuInvoiceTypeX.
	invoice addInvoiceItem: self purchaseInvoiceItem1.
	self assert: invoice netPrice equals: invoice invoiceItems first netPrice.
	self assert: invoice total equals: invoice netPrice.
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testPurchaseInvoiceTypeDependingOnSupplier [

	| invoice |
	
	invoice := self quesosDelAbastoPurchaseInvoice.
	self assert: invoice invoiceType = YavuInvoiceTypeA.
	invoice := self panaderiaGalliPurchaseInvoice.
	self assert: invoice invoiceType = YavuInvoiceTypeX 
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testQueryPurchaseInvoices [

	| invoice query |
	
	invoice := self quesosDelAbastoPurchaseInvoice.
	invoice addToSystem.
	query := invoice class instancesFrom: invoice date to: invoice date entity: invoice entity.
	self assert: query size = 1.
	self assert: query first date = invoice date
]
