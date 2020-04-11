Class {
	#name : #YavuPurchaseSubsystemTest,
	#superclass : #TestCase,
	#instVars : [
		'system'
	],
	#category : #'YavuPurchase-Test'
}

{ #category : #running }
YavuPurchaseSubsystemTest >> newQuesosDelAbastoSupplier [

	^ (YavuSupplier name: 'Bulacio Cesar Oscar')
			businessName: 'Quesos del Abasto';
			vatCondition: YavuResponsableInscripto;
			cuitNumber: '20144310579';
			yourself
]

{ #category : #running }
YavuPurchaseSubsystemTest >> newSubsystem [

	YavuEnvironment 
		systemClass: (YavuResturantSystem
			enabledSubsystemsClasses: (Array with: YavuTransientSubsystem with: YavuPurchaseSubsystem )).
	^ YavuEnvironment currentSystem
]

{ #category : #'as yet unclassified' }
YavuPurchaseSubsystemTest >> quesosDelAbastoPurchaseInvoice [
	
	^ PurchaseInvoice new
		entity: self quesosDelAbastoSupplier;
		date: '04/11/2020' asDate;
		yourself
]

{ #category : #running }
YavuPurchaseSubsystemTest >> quesosDelAbastoSupplier [

	^system purchaseSubsystem suppliers detect: [ :each | each businessName = 'Quesos del Abasto' ]
]

{ #category : #running }
YavuPurchaseSubsystemTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	system := self newSubsystem.
	self newQuesosDelAbastoSupplier addToSystem
]

{ #category : #tests }
YavuPurchaseSubsystemTest >> testAddPurchaseInvoice [

	self quesosDelAbastoPurchaseInvoice addToSystem.
	self assert: (system purchaseSubsystem purchaseInvoicesOfSupplier: self quesosDelAbastoSupplier) size = 1.
]
