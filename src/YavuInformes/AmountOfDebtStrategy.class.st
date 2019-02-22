Class {
	#name : #AmountOfDebtStrategy,
	#superclass : #FinancialSituationInputStrategy,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
AmountOfDebtStrategy class >> inputAmountOfDebt [

	^true
]

{ #category : #'as yet unclassified' }
AmountOfDebtStrategy class >> typeFor: aFinancialSituationOrNil [ 

	^AmountOfDebt
]
