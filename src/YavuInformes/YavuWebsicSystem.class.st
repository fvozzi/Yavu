Class {
	#name : #YavuWebsicSystem,
	#superclass : #YavuSystem,
	#category : #'YavuInformes-Environment'
}

{ #category : #'as yet unclassified' }
YavuWebsicSystem class >> mongoDatabaseName [ 
	
	^ 'yavuWebsic'
]

{ #category : #testing }
YavuWebsicSystem >> searchCustomerByNumber: aString customerType: aCustomerType [

	| cuitNumberLiteral |
	cuitNumberLiteral := aString size = 11 ifTrue: [aString] ifFalse: [aCustomerType cuitNumberOf: aString].
	^self searchCustomerByCUIT: cuitNumberLiteral
]
