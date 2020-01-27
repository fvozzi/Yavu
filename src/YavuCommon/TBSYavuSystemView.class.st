Class {
	#name : #TBSYavuSystemView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'menuElements',
		'content'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> cerrarSession [

	self session unregister.
	self requestContext redirectTo: self application url
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
	menuElements := TBSYavuSystemMenuBar main: self.
	content := TBSSicHome new
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> renderContentOn: html [

		html render: menuElements.
		html render: (self content parent: self)
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> renderNavigationbarOn: html [
	
	html tbsNavbar beDefault; with: [ 
		html tbsContainer: [ 
		html tbsNavbarHeader: [ 
			html image tbsPullLeft; style: 'padding: 10px;';url: TBSExamplesLibrary / #logosmallPng.
			html tbsNavbarBrand
				url: 'http://smalltalkhub.com/#!/~TorstenBergmann/Bootstrap';
				with: 'Bootstrap for Seaside'.
		 ].	
		html form: [ 	
		html tbsNavbarButton 
				tbsPullRight;
				callback: [ self returnToIntro ]; 
				with: 'Home'  ]] ]
	
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet resourceUrl: 'css/tbsReportDataSelector.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/financialReport.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/reportDataSelector.css'
]
