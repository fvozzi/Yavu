Class {
	#name : #YavuPurchaseInvoice,
	#superclass : #YavuTransaction,
	#instVars : [
		'invoiceType',
		'invoiceItems',
		'total',
		'netPrice'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice class >> instancesFrom: startDate to: endDate entities: aCollectionOfEntities [

	^ self yavuSystem purchaseSubsystem 
		purchaseInvoicesOfSuppliers: aCollectionOfEntities 
		from: startDate
		to: endDate
]

{ #category : #testing }
YavuPurchaseInvoice class >> isVoyageRoot [ 

	^ true
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> addInvoiceItem: anInvoiceItem [ 
	
	invoiceItems add: anInvoiceItem.
	self onInvoiceItemsChange
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> entity: aSupplier [

	super entity: aSupplier.
	self onSupplierChanged: aSupplier
]

{ #category : #initialization }
YavuPurchaseInvoice >> initialize [ 

	super initialize.
	invoiceItems := OrderedCollection new
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoice: aClass [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceItems [
	^ invoiceItems
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceType [
	
	^ invoiceType
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceType: aClass [ 
	invoiceType := aClass
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> netPrice [
	
	^ netPrice
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> onInvoiceItemsChange [

	netPrice  := self invoiceItems inject: 0 into: [ :accum :each | accum + each netPrice ].
	total := self invoiceItems inject: 0 into: [ :accum :each | accum + each total ]
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> onSupplierChanged: aSupplier [

	self invoiceType: aSupplier invoiceType
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> total [
	^ total
]
