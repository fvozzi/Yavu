Class {
	#name : #YavuInvoiceTypeC,
	#superclass : #YavuInvoiceType,
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'as yet unclassified' }
YavuInvoiceTypeC class >> availableForSales [

	^ false
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeC class >> discriminateVat [
	
	^ false
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeC class >> formattedInvoiceType [

	^ 'FACT C'
]

{ #category : #accessing }
YavuInvoiceTypeC class >> subtotalPriceOf: aPurchaseTransactionItem [ 
	^ aPurchaseTransactionItem subtotalAfterTaxs 
]

{ #category : #accessing }
YavuInvoiceTypeC class >> totalPriceOf: aPurchaseTransactionItem [

	^ aPurchaseTransactionItem subtotalAfterTaxs 
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeC class >> vatValueOf: aPurchaseTransactionItem vatPercentaje: aPercentaje [

	^ 0
]
