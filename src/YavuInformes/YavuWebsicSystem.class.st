Class {
	#name : #YavuWebsicSystem,
	#superclass : #YavuSystem,
	#category : #'YavuInformes-Environment'
}

{ #category : #testing }
YavuWebsicSystem >> searchCustomerByNumber: aString customerType: aCustomerType [

	| cuitNumberLiteral |
	cuitNumberLiteral := aString size = 11 ifTrue: [aString] ifFalse: [aCustomerType cuitNumberOf: aString].
	^self searchCustomerByCUIT: cuitNumberLiteral
]
