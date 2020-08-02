Class {
	#name : #YavuVatCondition,
	#superclass : #YavuEntity,
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuVatCondition class >> afipCodigoDocumentoComprador [

	^ '99'
]

{ #category : #testing }
YavuVatCondition class >> cuitNumberIsRequired [

	^ false
]

{ #category : #'as yet unclassified' }
YavuVatCondition class >> discriminateVat [ 
	
	^ self subclassResponsibility 
]
