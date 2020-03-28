Class {
	#name : #TBSYavuSystemView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'navBar',
		'sideBar',
		'content'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> cerrarSession [

	self requestContext redirectTo: self application url.
	self session unregister.
	
]

{ #category : #accessing }
TBSYavuSystemView >> content [
	
	^content
]

{ #category : #accessing }
TBSYavuSystemView >> content: aWAFactoryView [ 

	content := aWAFactoryView
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> initialize [ 
	
	super initialize.
	navBar := TBSYavuSystemNavBar main: self.
	sideBar := TBSYavuSystemSideBar main: self.
	content := TBSSicHome new
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> renderContentOn: html [

		html tbsRow 
			with: [ 
				html tbsColumn
					extraSmallSize: 12;
					mediumSize: 12;
					largeSize: 12;
					with: [html render: navBar]].
		html tbsRow 
			with: [ 
				html tbsColumn
					extraSmallSize: 12;
					mediumSize: 2;
					largeSize: 2;
					with: [ html render: sideBar].
				html tbsColumn
					extraSmallSize: 12;
					mediumSize: 10;
					largeSize: 10;
					with: [ html render: (self content parent: self)].
				
	]
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet resourceUrl: 'css/tbsReportDataSelector.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/financialReport.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/reportDataSelector.css'
]
