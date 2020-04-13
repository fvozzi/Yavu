Class {
	#name : #InvoiceItem,
	#superclass : #YavuObject,
	#instVars : [
		'quantity',
		'unitPrice',
		'product'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'as yet unclassified' }
InvoiceItem >> netPrice [
	
	^ self quantity * self unitPrice
]

{ #category : #'as yet unclassified' }
InvoiceItem >> product: aYavuProduct [ 
	
	product := aYavuProduct 
]

{ #category : #'as yet unclassified' }
InvoiceItem >> quantity [
	^ quantity
]

{ #category : #'as yet unclassified' }
InvoiceItem >> quantity: anInteger [ 
	quantity := anInteger
]

{ #category : #'as yet unclassified' }
InvoiceItem >> total [
	
	^ self quantity * self unitPriceAfterTaxs 
]

{ #category : #'as yet unclassified' }
InvoiceItem >> unitPrice [
	^ unitPrice
]

{ #category : #'as yet unclassified' }
InvoiceItem >> unitPrice: anInteger [ 
	unitPrice := anInteger
]

{ #category : #'as yet unclassified' }
InvoiceItem >> unitPriceAfterTaxs [
	
	^ unitPrice + (unitPrice * product vatPercentage / 100)
]
