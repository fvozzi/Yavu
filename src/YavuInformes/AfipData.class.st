Class {
	#name : #AfipData,
	#superclass : #Transaction,
	#instVars : [
		'contributions'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
AfipData >> addContribution: aContribution [

	contributions add: aContribution
]

{ #category : #accessing }
AfipData >> contributionDataCount [
	
	
	^self contributions size
]

{ #category : #'as yet unclassified' }
AfipData >> contributions [

	^contributions
]

{ #category : #accessing }
AfipData >> hasAnyData [
	
	
	^self contributions notEmpty
]

{ #category : #'as yet unclassified' }
AfipData >> initialize [

	super initialize.
	contributions := OrderedCollection new
]

{ #category : #'as yet unclassified' }
AfipData >> store [ 
	"no hace nada por ahora."
]
