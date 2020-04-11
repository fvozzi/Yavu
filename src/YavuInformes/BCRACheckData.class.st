Class {
	#name : #BCRACheckData,
	#superclass : #YvObject,
	#instVars : [
		'owner',
		'checkNumber',
		'bouncedDate',
		'amountOfCheck',
		'cause',
		'paymentDate',
		'finePaymentDate',
		'revision',
		'judicial',
		'denomination',
		'type'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
BCRACheckData >> amountOfCheck [
	
	^ amountOfCheck
]

{ #category : #accessing }
BCRACheckData >> amountOfCheck: anObject [
	
	amountOfCheck := anObject
]

{ #category : #accessing }
BCRACheckData >> bouncedDate [
	
	^ bouncedDate
]

{ #category : #accessing }
BCRACheckData >> bouncedDate: anObject [
	
	bouncedDate := anObject
]

{ #category : #accessing }
BCRACheckData >> cause [
	
	^ cause
]

{ #category : #accessing }
BCRACheckData >> cause: anObject [
	
	cause := anObject
]

{ #category : #accessing }
BCRACheckData >> checkNumber [
	
	^ checkNumber
]

{ #category : #accessing }
BCRACheckData >> checkNumber: anObject [
	
	checkNumber := anObject
]

{ #category : #accessing }
BCRACheckData >> denomination [
	
	^ denomination
]

{ #category : #accessing }
BCRACheckData >> denomination: anObject [
	
	denomination := anObject
]

{ #category : #accessing }
BCRACheckData >> finePaymentDate [
	
	^ finePaymentDate
]

{ #category : #accessing }
BCRACheckData >> finePaymentDate: anObject [
	
	finePaymentDate := anObject
]

{ #category : #accessing }
BCRACheckData >> judicial [
	
	^ judicial
]

{ #category : #accessing }
BCRACheckData >> judicial: anObject [
	
	judicial := anObject
]

{ #category : #accessing }
BCRACheckData >> owner [
	
	^ owner
]

{ #category : #accessing }
BCRACheckData >> owner: anObject [
	
	owner := anObject
]

{ #category : #accessing }
BCRACheckData >> paymentDate [
	
	^ paymentDate
]

{ #category : #accessing }
BCRACheckData >> paymentDate: anObject [
	
	paymentDate := anObject
]

{ #category : #accessing }
BCRACheckData >> revision [
	
	^ revision
]

{ #category : #accessing }
BCRACheckData >> revision: anObject [
	
	revision := anObject
]

{ #category : #accessing }
BCRACheckData >> type [
	
	^ type
]

{ #category : #accessing }
BCRACheckData >> type: anObject [
	
	type := anObject
]
