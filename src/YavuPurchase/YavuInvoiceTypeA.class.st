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
YavuInvoiceTypeA class >> totalPriceOf: aPrice vatPercentage: aVatPercentage [ 
	
	^  aPrice + (aPrice * aVatPercentage / 100)
]
