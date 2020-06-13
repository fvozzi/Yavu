Class {
	#name : #YavuAccountingSubsystemTest,
	#superclass : #TestCase,
	#instVars : [
		'system'
	],
	#category : #'YavuAccounting-Test'
}

{ #category : #'instance creation' }
YavuAccountingSubsystemTest >> newSubsystem [

	YavuTestEnvironment beCurrent.
	YavuTestEnvironment 
		systemClass: (YavuRestaurantSystem
			enabledSubsystemsClasses: (Array with: YavuTransientSubsystem with: YavuPurchaseSubsystem with: YavuSaleSubsystem with: YavuAccountingSubsystem)).
	^ YavuTestEnvironment currentSystem
]

{ #category : #running }
YavuAccountingSubsystemTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	system := self newSubsystem.
]
