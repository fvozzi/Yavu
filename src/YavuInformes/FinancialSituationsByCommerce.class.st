Class {
	#name : #FinancialSituationsByCommerce,
	#superclass : #ReportData,
	#instVars : [
		'amountOfFinancialSituations'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
FinancialSituationsByCommerce class >> instancesFrom: startDate to: endDate for: anEntity [

	^self yavuSystem readManyOf: FinancialSituationsByCommerce 
		where: [:each | each entity = anEntity AND: [each date between: startDate and: endDate]]
]

{ #category : #'sin categoria' }
FinancialSituationsByCommerce class >> instancesFrom: startDate to: endDate forCompany: aCompany [

	^self yavuSystem readManyOf: FinancialSituationsByCommerce 
		where: [:each | each entity company = aCompany AND: [each date between: startDate and: endDate]]
]

{ #category : #'sin categoria' }
FinancialSituationsByCommerce >> amountOfFinancialSituations [ 

	^amountOfFinancialSituations
]
