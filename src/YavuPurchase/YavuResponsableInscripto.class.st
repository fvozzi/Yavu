Class {
	#name : #YavuResponsableInscripto,
	#superclass : #YavuVatCondition,
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuResponsableInscripto class >> cuitNumberIsRequired [

	^ true
]

{ #category : #'as yet unclassified' }
YavuResponsableInscripto class >> invoiceType [
	
	^ YavuInvoiceTypeA 
]

{ #category : #'sin categoria' }
YavuResponsableInscripto class >> label [ 

	^ 'Resp. Inscripto'
]
