Class {
	#name : #YavuAccountingSubsystem,
	#superclass : #YavuSubsystem,
	#category : #'YavuAccounting-Environment'
}

{ #category : #configuration }
YavuAccountingSubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		add: ((YavuSimpleMenuElement label: 'Declaracion de IVA' presenterClass: TBSYavuVatDeclarationView subsystem: self) id: 2);
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

	^ self system purchaseSubsystem purchasesOfEntity: aYavuBusinessName month: aDate
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
