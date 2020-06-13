Class {
	#name : #YavuInvoiceTypeA,
	#superclass : #YavuInvoiceType,
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'as yet unclassified' }
YavuInvoiceTypeA class >> availableForSales [

	^ true
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeA class >> discriminateVat [
	
	^ true
]

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

{ #category : #'as yet unclassified' }
YavuInvoiceTypeA class >> vatValueOf: aPurchaseTransactionItem vatPercentaje: aPercentaje [
	^ aPurchaseTransactionItem product vatPercentage = aPercentaje 
		ifTrue: [ aPurchaseTransactionItem subtotalTaxs ] 
		ifFalse: [ 0 ]
	

]
