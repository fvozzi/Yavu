Class {
	#name : #TBSMagritteReportWrapper,
	#superclass : #WAComponent,
	#instVars : [
		'report'
	],
	#category : #'YavuCommon-Bootstrap-Magritte-Examples'
}

{ #category : #'initialize-release' }
TBSMagritteReportWrapper >> close [

	self answer: nil
]

{ #category : #rendering }
TBSMagritteReportWrapper >> renderContentOn: html [

	html render: self report.
	
	html div 
		class: 'form-actions'; 
		with: [
			html anchor
				class: 'btn' ;
				callback: [ self close ] ;
				with: 'Close' ]
]

{ #category : #accessing }
TBSMagritteReportWrapper >> report [
	^ report
]

{ #category : #accessing }
TBSMagritteReportWrapper >> report: anObject [
	report := anObject
]
