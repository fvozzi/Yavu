Class {
	#name : #YavuInvoiceType,
	#superclass : #YavuObject,
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'as yet unclassified' }
YavuInvoiceType class >> availableForSales [

	^ self subclassResponsibility 
]
