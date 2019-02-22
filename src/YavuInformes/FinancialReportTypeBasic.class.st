Class {
	#name : #FinancialReportTypeBasic,
	#superclass : #FinancialReportType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
FinancialReportTypeBasic class >> amountOfSteps [
	
	^ 1
]

{ #category : #accessing }
FinancialReportTypeBasic class >> financialReportViewClass [

	^WABasicFinancialReportView
]
