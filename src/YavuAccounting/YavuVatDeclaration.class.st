Class {
	#name : #YavuVatDeclaration,
	#superclass : #YavuTransaction,
	#instVars : [
		'vatTaxDebit',
		'vatTaxCredit',
		'state',
		'officialPresentationDate',
		'sales',
		'purchases'
	],
	#category : #'YavuAccounting-DomainObjects'
}

{ #category : #accessing }
YavuVatDeclaration class >> subsystemClass [
	^ Smalltalk at: #YavuAccountingSubsystem
]

{ #category : #'sin categoria' }
YavuVatDeclaration >> initializeEntity: anEntity date: aDate [

	super initializeEntity: anEntity date: aDate.
	state := self yavuSystem toReviseStatus
	
	
]

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> sales: aCollection [ 
	sales := aCollection
]
