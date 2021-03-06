Class {
	#name : #YavuInvoiceTypeC,
	#superclass : #YavuInvoiceType,
	#category : #'YavuPurchase-Model'
}

{ #category : #'as yet unclassified' }
YavuInvoiceTypeC class >> afipTipoComprobante [
	^ '011'
]

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

{ #category : #'as yet unclassified' }
YavuInvoiceTypeC class >> hiddenDescriptionsOn: aPurchaseInvoice [

	^aPurchaseInvoice hiddenDescriptionsOnTypeC
]

{ #category : #'as yet unclassified' }
YavuInvoiceTypeC class >> netPriceValueOf: aPurchaseTransactionItem vatPercentaje: aPercentaje [
	^ aPurchaseTransactionItem product vatPercentage = aPercentaje 
		ifTrue: [ aPurchaseTransactionItem subtotalAfterTaxs] 
		ifFalse: [ 0 ]
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
