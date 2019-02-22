Class {
	#name : #TBSSicMain,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'menuElements',
		'content'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #accessing }
TBSSicMain >> content [
	
	^content
]

{ #category : #accessing }
TBSSicMain >> content: aWAFactoryView [ 
	
	content := aWAFactoryView
]

{ #category : #'as yet unclassified' }
TBSSicMain >> initialize [ 
	
	super initialize.
	menuElements := TBSSicMenuBar main: self.
	content := TBSSicHome new
]

{ #category : #'as yet unclassified' }
TBSSicMain >> renderContentOn: html [

		html render: menuElements.
		html render: (self content parent: self)
]

{ #category : #'as yet unclassified' }
TBSSicMain >> renderNavigationbarOn: html [
	
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
TBSSicMain >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet resourceUrl: 'css/tbsReportDataSelector.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/financialReport.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/reportDataSelector.css'
]
