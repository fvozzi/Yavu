Class {
	#name : #FinancialReportTypePlus,
	#superclass : #FinancialReportType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
FinancialReportTypePlus class >> steps [

	^ super steps
		at: 2 put: TBSReportCaptchaSelector ;
		yourself
]
