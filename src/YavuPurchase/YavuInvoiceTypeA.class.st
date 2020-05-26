Class {
	#name : #YavuInvoiceTypeA,
	#superclass : #YavuInvoiceType,
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'as yet unclassified' }
YavuInvoiceTypeA class >> formattedInvoiceType [

	^ 'FACT A'
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeA class >> subtotalPriceOf: aPurchaseTransactionItem [ 
	^ aPurchaseTransactionItem subtotal 
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeA class >> totalPriceOf: aPurchaseTransactionItem [

	^ aPurchaseTransactionItem subtotalAfterTaxs 
]
