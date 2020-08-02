Class {
	#name : #YavuMonotributo,
	#superclass : #YavuVatCondition,
	#category : #'YavuPurchase-Entities'
}

{ #category : #'as yet unclassified' }
YavuMonotributo class >> discriminateVat [ 
	
	^ false
]

{ #category : #'as yet unclassified' }
YavuMonotributo class >> invoiceType [
	
	^ YavuInvoiceTypeC
]

{ #category : #'sin categoria' }
YavuMonotributo class >> label [ 

	 ^ 'Monotributo'
]
