Class {
	#name : #AffectationStrategy,
	#superclass : #FinancialSituationInputStrategy,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
AffectationStrategy class >> typeFor: aFinancialSituationOrNil [ 
	"Si no hay afectación vigente entonces el unico tipo posible es Afectación.
	Sino, le pide el tipo posible al tipo de la situación financiera."
	
	aFinancialSituationOrNil isNil ifTrue: [ ^Affectation ].
	^aFinancialSituationOrNil type possibleType
]
