Class {
	#name : #TBSExamples,
	#superclass : #WAComponent,
	#instVars : [
		'menu'
	],
	#category : #'YavuCommon-Bootstrap-Magritte-Examples'
}

{ #category : #initialization }
TBSExamples class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'bootstrap-examples'.
	application preferenceAt: #scriptGeneratorClass put: JQScriptGenerator	
]

{ #category : #hooks }
TBSExamples >> children [
	^ Array with: self menu
]

{ #category : #accessing }
TBSExamples >> label [
	" should be overridden to be used with pageChoice "
	^'Bootstrap Seaside examples'
]

{ #category : #accessing }
TBSExamples >> menu [
	^ menu ifNil: [ menu := TBSExampleMenu new ]
]

{ #category : #rendering }
TBSExamples >> renderContentOn: html [
	html tbsContainer: [
		html tbsRow: [
			html tbsColumn mediumSize: 12; with: [
				html heading level1; with: [
					html text: 'Twitter Bootstrap '; small: 'Seaside and Magritte rendering examples' ] ] ].
		html tbsRow: [
			html tbsColumn mediumSize: 9; with: self menu ] ].
]

{ #category : #updating }
TBSExamples >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	
	JQDevelopmentLibrary default updateRoot: anHtmlRoot.
	TBSDevelopmentLibrary default updateRoot: anHtmlRoot.
	
	anHtmlRoot title: 'Seaside Bootstrap examples'
]
