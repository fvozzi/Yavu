Class {
	#name : #YavuInvoiceTypeC,
	#superclass : #YavuInvoiceType,
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'as yet unclassified' }
YavuInvoiceTypeC class >> formattedInvoiceType [

	^ 'FACT C'
]

{ #category : #accessing }
YavuInvoiceTypeC class >> totalPriceOf: aPrice vatPercentage: aPercentage [

	^ aPrice
]
