Class {
	#name : #PurchaseInvoice,
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
PurchaseInvoice >> addInvoiceItem: anInvoiceItem [ 
	
	invoiceItems add: anInvoiceItem.
	self onInvoiceItemsChange
]

{ #category : #'sin categoria' }
PurchaseInvoice >> entity: aSupplier [

	super entity: aSupplier.
	self onSupplierChanged: aSupplier
]

{ #category : #initialization }
PurchaseInvoice >> initialize [ 

	super initialize.
	invoiceItems := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PurchaseInvoice >> invoice: aClass [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
PurchaseInvoice >> invoiceItems [
	^ invoiceItems
]

{ #category : #'as yet unclassified' }
PurchaseInvoice >> invoiceType [
	
	^ invoiceType
]

{ #category : #'as yet unclassified' }
PurchaseInvoice >> invoiceType: aClass [ 
	invoiceType := aClass
]

{ #category : #'as yet unclassified' }
PurchaseInvoice >> netPrice [
	
	^ netPrice
]

{ #category : #'as yet unclassified' }
PurchaseInvoice >> onInvoiceItemsChange [

	netPrice  := self invoiceItems inject: 0 into: [ :accum :each | accum + each netPrice ].
	total := self invoiceItems inject: 0 into: [ :accum :each | accum + each total ]
]

{ #category : #'sin categoria' }
PurchaseInvoice >> onSupplierChanged: aSupplier [

	self invoiceType: aSupplier invoiceType
]

{ #category : #'as yet unclassified' }
PurchaseInvoice >> total [
	^ total
]
