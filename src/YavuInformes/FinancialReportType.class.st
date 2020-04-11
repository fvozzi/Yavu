Class {
	#name : #FinancialReportType,
	#superclass : #YvObject,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
FinancialReportType class >> financialReportFor: aNaturalPerson using: aYavuSystem [ 
	
	^FinancialReport basicFor: aNaturalPerson using: aYavuSystem
]

{ #category : #'as yet unclassified' }
FinancialReportType class >> stepAt: anIndex [

	^ self steps at: anIndex
]

{ #category : #'as yet unclassified' }
FinancialReportType class >> steps [

	^ Dictionary new
		at: 1 put: TBSReportCustomerSelector ;
		yourself
]
