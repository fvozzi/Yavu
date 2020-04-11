Class {
	#name : #BCRADebt,
	#superclass : #YvObject,
	#instVars : [
		'owner',
		'denomination',
		'entity',
		'period',
		'situation',
		'amount',
		'days',
		'observation'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
BCRADebt >> amount [
	
	^ amount
]

{ #category : #accessing }
BCRADebt >> amount: anObject [
	
	amount := anObject
]

{ #category : #accessing }
BCRADebt >> days [
	
	^ days
]

{ #category : #accessing }
BCRADebt >> days: anObject [
	
	days := anObject
]

{ #category : #accessing }
BCRADebt >> denomination [
	
	^ denomination
]

{ #category : #accessing }
BCRADebt >> denomination: anObject [
	
	denomination := anObject
]

{ #category : #accessing }
BCRADebt >> entity [
	
	^ entity
]

{ #category : #accessing }
BCRADebt >> entity: anObject [
	
	entity := anObject
]

{ #category : #accessing }
BCRADebt >> observation [
	
	^ observation
]

{ #category : #accessing }
BCRADebt >> observation: anObject [
	
	observation := anObject
]

{ #category : #accessing }
BCRADebt >> owner [
	
	^ owner
]

{ #category : #accessing }
BCRADebt >> owner: anObject [
	
	owner := anObject
]

{ #category : #accessing }
BCRADebt >> period [
	
	^ period
]

{ #category : #accessing }
BCRADebt >> period: anObject [
	
	period := anObject
]

{ #category : #accessing }
BCRADebt >> situation [
	
	^ situation
]

{ #category : #accessing }
BCRADebt >> situation: anObject [
	
	situation := anObject
]
