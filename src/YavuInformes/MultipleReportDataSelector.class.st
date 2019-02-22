Class {
	#name : #MultipleReportDataSelector,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'showBCRACaptcha',
		'reportDataSelectors',
		'financialView',
		'reportDataSelected'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
MultipleReportDataSelector class >> showBCRACaptcha: aBoolean financialReportView: aFinancialView [

	^super new 
		showBCRACaptcha: aBoolean;
		financialView: aFinancialView;
		yourself
]

{ #category : #accessing }
MultipleReportDataSelector >> financialView [
	
	^ financialView
]

{ #category : #accessing }
MultipleReportDataSelector >> financialView: anObject [
	
	financialView := anObject
]

{ #category : #accessing }
MultipleReportDataSelector >> initializeReportDataSelectors [

	reportDataSelectors := ReportDataSelector subclasses 
								collect: [ :each | each showBCRACaptcha: self showBCRACaptcha owner: self ]
]

{ #category : #'as yet unclassified' }
MultipleReportDataSelector >> renderContentOn: html [
  
	| index |

	html div id: #multipleReportDataSelector; with: [
		html div class: 'tabs'; class: 'tabsDataSelector'; with: [
		index := 1.
		self reportDataSelectors do: [ :selector | 
			html div class: 'tab'; with: [
				html radioButton name: 'tab-group-1'; id: ('tab-', index asString); selected: (index = self selectedIndex).
				html label for: ('tab-', index asString); with: [html text: selector labelForTab ].
				html div class: 'content'; class: 'contentDataSelector'; with: [html render: selector] 
				].
			index := index + 1
		]]
	]
]

{ #category : #accessing }
MultipleReportDataSelector >> reportDataSelected [
	
	^ reportDataSelected
]

{ #category : #accessing }
MultipleReportDataSelector >> reportDataSelected: anObject [
	
	reportDataSelected := anObject
]

{ #category : #accessing }
MultipleReportDataSelector >> reportDataSelectors [
	
	reportDataSelectors ifNil: [ self initializeReportDataSelectors].
	^reportDataSelectors
]

{ #category : #accessing }
MultipleReportDataSelector >> reportDataSelectors: anObject [
	
	reportDataSelectors := anObject
]

{ #category : #'as yet unclassified' }
MultipleReportDataSelector >> selectedIndex [

	^self reportDataSelected isNil ifTrue: [ 1 ] ifFalse: [ self reportDataSelected tabIndex ]
]

{ #category : #accessing }
MultipleReportDataSelector >> showBCRACaptcha [
	
	^ showBCRACaptcha
]

{ #category : #accessing }
MultipleReportDataSelector >> showBCRACaptcha: anObject [
	
	showBCRACaptcha := anObject
]

{ #category : #accessing }
MultipleReportDataSelector >> tryToGuestReportDataSelected [
	"intenta solucionar el problema de si presionan enter en lugar de click sobre la opcion."

	self reportDataSelectors first documentNumber notEmpty ifTrue: [ ^self reportDataSelectors first  ].
	^self reportDataSelectors second
]
