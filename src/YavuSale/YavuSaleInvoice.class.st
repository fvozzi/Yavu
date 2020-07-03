Class {
	#name : #YavuSaleInvoice,
	#superclass : #YavuInvoice,
	#category : #'YavuSale-DomainObjects'
}

{ #category : #'sin categoria' }
YavuSaleInvoice class >> entityClass [
	
	^ YavuCustomer 
]

{ #category : #testing }
YavuSaleInvoice class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuSaleInvoice class >> label [ 

	^ 'Factura de Venta'
]

{ #category : #accessing }
YavuSaleInvoice class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #accessing }
YavuSaleInvoice >> total [

	^ (self netPrice + self vat105 + self vat210 ) round: self subsystem decimalAccuracy 
]
