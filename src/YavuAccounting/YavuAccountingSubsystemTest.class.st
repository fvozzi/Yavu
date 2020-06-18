Class {
	#name : #YavuAccountingSubsystemTest,
	#superclass : #TestCase,
	#instVars : [
		'system',
		'resources'
	],
	#category : #'YavuAccounting-Test'
}

{ #category : #running }
YavuAccountingSubsystemTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	resources := YavuSystemTestResource current
]

{ #category : #running }
YavuAccountingSubsystemTest >> system [ 

	^ resources system
]

{ #category : #running }
YavuAccountingSubsystemTest >> tearDown [

	YavuSystemTestResource reset
]
