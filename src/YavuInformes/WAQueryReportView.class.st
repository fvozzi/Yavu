Class {
	#name : #WAQueryReportView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'entitySelector',
		'tableReport'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAQueryReportView class >> forRows: aRows [

	^super new
		rows: aRows
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> children [

	^Array with: self entitySelector
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> entitySelector [

	^entitySelector
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> entitySelector: anEntitySelector [

	entitySelector:= anEntitySelector
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> executeQuery [

	self tableReport rows: self queryResultElements
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> initializeTableReport [

	tableReport := (WATableReport new
						columns: self entitySelector transactionClass waTableReportColumns;
						rowColors: #(lightgray lightyellow);
						rowPeriod: 1;
						yourself)
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> queryResultElements [

	^self entitySelector queryResultElements
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> renderContentOn: html [
	"Render the menu elements."
	
		html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Resultado de la consulta'].
		html div id: 'queryResult'; with: [html render: self tableReport]
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> rows: aRows [

	tableReport := aRows isEmpty
		ifTrue: [MAReport new]
		ifFalse: [MAReport rows: aRows description: aRows first maDescriptionForReport]
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> tableReport [

	tableReport isNil ifTrue: [self initializeTableReport].
	^tableReport
]

{ #category : #'as yet unclassified' }
WAQueryReportView >> updateRoot: anHtmlRoot [

			super updateRoot: anHtmlRoot.  

    anHtmlRoot stylesheet resourceUrl: 'queryResult.css'
]
