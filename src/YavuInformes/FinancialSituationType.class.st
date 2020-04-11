Class {
	#name : #FinancialSituationType,
	#superclass : #YvObject,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
FinancialSituationType class >> financialSituationDescriptionCSSLabelFor: aFinancialSituation [
	
	^self financialSituationDescriptionCSSLabel
]

{ #category : #'as yet unclassified' }
FinancialSituationType class >> financialSituationDescriptionFor: aFinancialSituation [ 
	
	^self financialSituationDescription
]

{ #category : #accessing }
FinancialSituationType class >> financialSituationNula [
	
	^FinancialSituation nula
]

{ #category : #accessing }
FinancialSituationType class >> inputAmountOfDebt [
	
	^false
]

{ #category : #accessing }
FinancialSituationType class >> onlyMonthlyDebt [
	^false
]
