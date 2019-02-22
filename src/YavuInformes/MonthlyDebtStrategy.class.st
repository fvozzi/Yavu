Class {
	#name : #MonthlyDebtStrategy,
	#superclass : #FinancialSituationInputStrategy,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
MonthlyDebtStrategy class >> typeFor: aFinancialSituationOrNil [ 

	^MonthlyDebt
]
