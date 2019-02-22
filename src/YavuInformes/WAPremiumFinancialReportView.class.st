Class {
	#name : #WAPremiumFinancialReportView,
	#superclass : #WABasicPlusFinancialReportView,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAPremiumFinancialReportView >> renderScoringOn: html [

	html div id: #scoring; with: [
		html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Scoring'].
		html div id: #scoringValue; with: [html text: self financialReport scoring]
		 ]
]

{ #category : #'as yet unclassified' }
WAPremiumFinancialReportView >> reportKind [

	^'Premium'
]

{ #category : #'as yet unclassified' }
WAPremiumFinancialReportView >> reportKindClass [

	^'premium'
]

{ #category : #'as yet unclassified' }
WAPremiumFinancialReportView >> reportTitle [

	^'Informe Premium'
]
