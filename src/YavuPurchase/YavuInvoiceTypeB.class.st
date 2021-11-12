Class {
	#name : #YavuInvoiceTypeB,
	#superclass : #YavuInvoiceType,
	#category : #'YavuPurchase-Model'
}

{ #category : #'as yet unclassified' }
YavuInvoiceTypeB class >> afipTipoComprobante [
	^ '006'
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeB class >> availableForSales [

	^ true 
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeB class >> discriminateVat [
	
	^ false
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeB class >> formattedInvoiceType [

	^ 'FACT B'
]
