Class {
	#name : #YavuInvoiceType,
	#superclass : #YavuObject,
	#category : #'YavuPurchase-Model'
}

{ #category : #'as yet unclassified' }
YavuInvoiceType class >> afipTipoComprobante [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
YavuInvoiceType class >> availableForSales [

	^ self subclassResponsibility 
]
