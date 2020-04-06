Class {
	#name : #TBSMagritteReportExampleTask,
	#superclass : #WATask,
	#category : #'YavuCommon-Bootstrap-Magritte-Examples'
}

{ #category : #accessing }
TBSMagritteReportExampleTask class >> label [
	^ 'Magritte Report example'
]

{ #category : #private }
TBSMagritteReportExampleTask >> createReportBasedOn: reportChooser [

	| theReport |
	
	theReport := TBSMagritteReport rows: self demoRows description: TBSMagritteExampleFormDescription new magritteDescription. 
	theReport
		showBatchFirstLast: reportChooser showBatchFirstLast ;
		showBordered: reportChooser bordered ;
		showStriped: reportChooser striped ;
		showCondensed: reportChooser condensed;
		showHover: reportChooser hover.
	
	^ TBSMagritteReportWrapper new
		report: theReport ;
		yourself
]

{ #category : #private }
TBSMagritteReportExampleTask >> demoRows [

	| rows |
	
	rows := OrderedCollection new.
	Collection withAllSubclasses doWithIndex: [ :each :index |
		rows add: (TBSMagritteExampleFormDescription new
			name: each name;
			number: index ;
			bePositive: index odd ;
			yourself ) ].
	^ rows


]

{ #category : #running }
TBSMagritteReportExampleTask >> go [
	| chosenReport reportChooser |
	reportChooser := self call: self reportChooser.
	chosenReport := (self createReportBasedOn: reportChooser).
	
	self call: chosenReport.
	self informSuccess: [ :r | r strong: 'Thanks for looking at my report!' ]
]

{ #category : #private }
TBSMagritteReportExampleTask >> reportChooser [
	^ (TBSMagritteReportChooser new asComponent)
		addDecoration: ((TBSMagritteFormDecoration buttons: (Array with: #save -> 'Create a new report'))
			legend: 'Select a report style';
			formCss: 'form-horizontal' ;
			yourself );
		yourself
]
