Class {
	#name : #YavuAccountingSubsystem,
	#superclass : #YavuSubsystem,
	#category : #'YavuAccounting-Environment'
}

{ #category : #accessing }
YavuAccountingSubsystem class >> label [ 

	^ 'Contabilidad'
]

{ #category : #configuration }
YavuAccountingSubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		add: ((YavuSimpleMenuElement label: 'Declaraciones y cierres' presenterClass: TBSTransactionsBrowserView subsystem: self) id: 2);
		yourself
]

{ #category : #configuration }
YavuAccountingSubsystem class >> subsystemName [

	^ 'Contabilidad'
]

{ #category : #configuration }
YavuAccountingSubsystem class >> subsystemTag [

	 ^ 'accountingSubsystem'
]

{ #category : #'as yet unclassified' }
YavuAccountingSubsystem >> newVatDeclarationOnDate: aDate entity: aYavuBusinessName [ 
	
	^ YavuVatDeclaration entity: aYavuBusinessName date: aDate
]

{ #category : #'as yet unclassified' }
YavuAccountingSubsystem >> purchasesOfEntity: aYavuBusinessName month: aDate [

	^ self system purchaseSubsystem purchaseInvoicesOfBusinessName: aYavuBusinessName month: aDate
]

{ #category : #'as yet unclassified' }
YavuAccountingSubsystem >> salesOfEntity: aYavuBusinessName month: aDate [

	^ self system saleSubsystem salesOfEntity: aYavuBusinessName month: aDate
]

{ #category : #'as yet unclassified' }
YavuAccountingSubsystem >> vatDeclarationOnDate: aDate entity: aYavuBusinessName [ 
	
	| declaration instances entities |
	
	entities := OrderedCollection with: aYavuBusinessName.
	instances := self system storedSubsystem instancesOfClass: YavuVatDeclaration from: aDate to: aDate entities: entities.
	declaration := instances ifEmpty: [ self newVatDeclarationOnDate: aDate entity: aYavuBusinessName ] ifNotEmpty: [:col | col first ].
	declaration sales: (self salesOfEntity: aYavuBusinessName month: aDate).
	declaration purchases: (self purchasesOfEntity: aYavuBusinessName month: aDate).
	^ declaration 
]
