Class {
	#name : #TBSReportDataSelector,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'reportType',
		'steps',
		'stepIndex'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #'as yet unclassified' }
TBSReportDataSelector class >> on: aFinancialSituationReportType [

	^self new 
		initializeReportType: aFinancialSituationReportType;
		yourself
]

{ #category : #accessing }
TBSReportDataSelector >> amountOfSteps [
	
	^ self reportType amountOfSteps
]

{ #category : #'as yet unclassified' }
TBSReportDataSelector >> currentStep [

	^self stepAt: self stepIndex
]

{ #category : #accessing }
TBSReportDataSelector >> customer [

	^(self stepAt: 1) customer
]

{ #category : #accessing }
TBSReportDataSelector >> generateReport [

	| financialReport |

	financialReport := self reportType financialReportFor: self customer using: self session yavuSystem.
	self currentStep isCompleted ifTrue: [ 
		self parent content: (self reportType financialReportViewClass on: financialReport)
		
		 ]
]

{ #category : #'as yet unclassified' }
TBSReportDataSelector >> initialize [ 
	
	super initialize.
	self resetStepIndex
]

{ #category : #'as yet unclassified' }
TBSReportDataSelector >> initializeReportType: aFinancialSituationReportType [

	reportType := aFinancialSituationReportType
]

{ #category : #'as yet unclassified' }
TBSReportDataSelector >> initializeSteps [

	steps := Dictionary new.
	self reportType steps keysAndValuesDo: [ :key :stepClass |
		steps at: key put: stepClass new
		 ]
]

{ #category : #'as yet unclassified' }
TBSReportDataSelector >> renderContentOn: html [

	html form: [  
	html tbsContainer: [ 
		html tbsPanel bePrimary with: [ 
			html tbsPanelHeading: [ html tbsPanelTitle level: 3; with: self stepTitle ].
			html tbsPanelBody: [self renderStepOn: html].
		html tbsButton 
			bePrimary;
			callback: [ self stepAction ];
			with: self stepActionTitle.
		html break.
		html break
		].
		]
	]
]

{ #category : #accessing }
TBSReportDataSelector >> renderStepOn: html [

	html render: (self stepAt: self stepIndex) 
	
	
	
]

{ #category : #accessing }
TBSReportDataSelector >> reportType [
	
	^ reportType
]

{ #category : #accessing }
TBSReportDataSelector >> resetStepIndex [

	stepIndex := 1
]

{ #category : #accessing }
TBSReportDataSelector >> stepAction [
	
	self stepIndex = self amountOfSteps ifTrue: [ ^self generateReport ].
	^self nextStep
]

{ #category : #accessing }
TBSReportDataSelector >> stepActionTitle [
	
	self stepIndex = self amountOfSteps ifTrue: [ ^'Generar reporte' ].
	^'Siguiente'
]

{ #category : #accessing }
TBSReportDataSelector >> stepAt: anIndex [

	^ self steps at: anIndex
]

{ #category : #accessing }
TBSReportDataSelector >> stepIndex [
	
	^ stepIndex
]

{ #category : #accessing }
TBSReportDataSelector >> stepTitle [

	^'Paso ', self stepIndex asString, ' de ',self amountOfSteps asString
]

{ #category : #'as yet unclassified' }
TBSReportDataSelector >> steps [

	steps isNil ifTrue: [ self initializeSteps ].
	^steps
]

{ #category : #'as yet unclassified' }
TBSReportDataSelector >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet resourceUrl: 'css/tbsReportDataSelector.css'
]
