Class {
	#name : #YavuPurchaseSubsystemTest,
	#superclass : #TestCase,
	#instVars : [
		'resources'
	],
	#category : #'YavuPurchase-Test'
}

{ #category : #running }
YavuPurchaseSubsystemTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	resources := YavuSystemTestResource current.
	resources newQuesosDelAbastoSupplier addToSystem
]

{ #category : #accessing }
YavuPurchaseSubsystemTest >> system [ 

	^ resources system
]

{ #category : #running }
YavuPurchaseSubsystemTest >> tearDown [

	YavuSystemTestResource reset
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testAddPrefixAndInvoiceNumberToInvoice [

	| invoice |
	
	invoice := resources quesosDelAbastoPurchaseInvoice.
	invoice prefix: 1.
	invoice invoiceNumber: 100.
	self assert: invoice prefix equals: 1.
	self assert: invoice invoiceNumber equals: 100.
	self assert: invoice formattedPrefix equals: '00001'.
	self assert: invoice formattedInvoiceNumber equals: '00000100'.
	invoice prefix: 103.
	self assert: invoice formattedPrefix equals: '00103'
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testAddProductsToPurchaseTransaction [

	| purchaseTransaction itemProduct1 |
	
	purchaseTransaction := resources quesosDelAbastoPurchaseTransaction.
	itemProduct1 := resources itemOnBarraDamboLaPaulina.
	purchaseTransaction addPurchaseTransactionItem: itemProduct1 .
	self assert: purchaseTransaction purchaseTransactionItems size = 1.
	self assert: (purchaseTransaction purchaseTransactionItems first product = itemProduct1 product). 
	self assert: itemProduct1 unitPrice equals: 10.
	self assert: itemProduct1 unitPriceAfterTaxs asFloat equals: 12.1.
	self assert: purchaseTransaction total equals: itemProduct1 subtotalAfterTaxs
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testAddPurchaseInvoice [

	| invoice |
	
	invoice := resources quesosDelAbastoPurchaseInvoice.
	invoice addToSystem.
	self assert: (self system purchaseSubsystem purchaseInvoicesOfSupplier: resources quesosDelAbastoSupplier) size = 1.
	self assert: (self system purchaseSubsystem purchaseInvoicesOfSupplier: resources quesosDelAbastoSupplier) first date = invoice date
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testPurchaseInvoiceFactAVATCalculation [

	| invoice |
	
	invoice := resources quesosDelAbastoPurchaseInvoice.
	self assert: invoice invoiceType = YavuInvoiceTypeA.
	invoice addPurchaseTransaction: resources purchaseTransaction1.
	self assert: invoice netPrice equals: ((invoice purchaseTransactionItems sum: [ :each | each subtotal]) round: self system purchaseSubsystem decimalFiscalAccuracy) .
		self assert: invoice vat210 equals: ((invoice purchaseTransactionItems sum: [ :each | each subtotalAfterTaxs - each subtotal]) round: self system purchaseSubsystem decimalFiscalAccuracy) .
	self assert: invoice total equals: invoice netPrice + invoice vat105 + invoice vat210.
	self assert: invoice total equals: ((invoice purchaseTransactionItems sum: [ :each | each subtotalAfterTaxs ]) round: self system purchaseSubsystem decimalFiscalAccuracy)  
	

]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testPurchaseInvoiceFactXVATCalculation [

	| invoice |
	
	invoice := resources panaderiaGalliPurchaseInvoice.
	self assert: invoice invoiceType equals: YavuInvoiceTypeC.
	invoice addPurchaseTransaction: resources purchaseTransaction1.
	self assert: invoice netPrice equals: ((invoice purchaseTransactionItems sum: [ :each | each subtotalAfterTaxs ]) round: self system purchaseSubsystem decimalFiscalAccuracy).
	self assert: invoice total equals: invoice netPrice.
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testPurchaseInvoiceTypeDependingOnSupplier [

	| invoice |
	
	invoice := resources quesosDelAbastoPurchaseInvoice.
	self assert: invoice invoiceType = YavuInvoiceTypeA.
	invoice := resources panaderiaGalliPurchaseInvoice.
	self assert: invoice invoiceType = YavuInvoiceTypeC
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testPurchaseTransactionDecimalPrecision [

	| purchaseTransaction |

	purchaseTransaction := resources purchaseTransaction1.
	self assert: purchaseTransaction total equals: 4746.421.
	self assert: purchaseTransaction total equals: (purchaseTransaction purchaseTransactionItems inject: 0 into: [:accum :each | accum + each subtotalAfterTaxs  ]).
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testQueryPurchaseInvoices [

	| invoice query |
	
	invoice := resources quesosDelAbastoPurchaseInvoice.
	invoice addToSystem.
	query := invoice class instancesFrom: invoice date to: invoice date entity: invoice entity.
	self assert: query size = 1.
	self assert: query first date = invoice date
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testRecipeCostCalculation [

	| recipe tapasTransaction date |
	
	recipe := resources empanadasRecipe.
	tapasTransaction := resources mauroTapasEmpanadaTransaction.
   tapasTransaction entity addToSystem.
	date := tapasTransaction date.
	recipe addToSystem.
	tapasTransaction addToSystem.
	self assert: (self system purchaseSubsystem recipeCost: recipe at: date) equals: 2
]
