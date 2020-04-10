Class {
	#name : #TBSExampleMenu,
	#superclass : #WAComponent,
	#category : #'YavuCommon-Bootstrap-Magritte-Examples'
}

{ #category : #accessing }
TBSExampleMenu >> examples [
	^ Array with: TBSMagritteExampleFormTask  with: TBSMagritteReportExampleTask
]

{ #category : #rendering }
TBSExampleMenu >> renderContentOn: html [
	html tbsPageHeader: [ 
			html heading level3; with:  'Bootstrap Seaside examples' ].
		
	html tbsTable
		beStriped;
		with: [
			html tableHead: [
				html tableRow: [
					html tableHeading: 'Example' ] ].
			html tableBody: [
				self examples do: [ :each | 
					html tableRow: [
						html tableData: [ 
							html anchor 
								callback: [ self show: each new ];
								with: each label  ] ] ] ] ].
				
	html div: [
		html text: 'You can load this code with: '.
		html div: [ 
			html preformatted: [ 
				html code: 'Gofer it
    url: ''http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main'';
    package: ''ConfigurationOfBootstrap'';
    load.

ConfigurationOfBootstrap project stableVersion load: #(''Examples'').' ] ] ].

	html div: [
		html text: 'For more information see the '.
		html anchor url: 'http://twitter.github.com/bootstrap/'; with: 'Twitter Bootstrap documentation' ]
]
