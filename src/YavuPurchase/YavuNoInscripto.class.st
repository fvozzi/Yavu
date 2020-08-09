Class {
	#name : #YavuNoInscripto,
	#superclass : #YavuVatCondition,
	#category : #'YavuPurchase-Entities'
}

{ #category : #'as yet unclassified' }
YavuNoInscripto class >> discriminateVat [ 
	
	^ false
]

{ #category : #'as yet unclassified' }
YavuNoInscripto class >> invoiceType [
	
	^ YavuInvoiceTypeC 
]

{ #category : #'sin categoria' }
YavuNoInscripto class >> label [ 

	^ 'No Inscripto'
]
