Class {
	#name : #TBSYavuSystemView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'navBar',
		'sideBar',
		'content',
		'selectedMenuID'
	],
	#category : #'YavuCommon-View'
}

{ #category : #testing }
TBSYavuSystemView class >> canBeRoot [

	 ^ true
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> cerrarSession [

	self requestContext redirectTo: self application url.
	self session unregister.
	
]

{ #category : #hooks }
TBSYavuSystemView >> children [ 

	^ Array with: content
]

{ #category : #accessing }
TBSYavuSystemView >> content [
	
	^content
]

{ #category : #accessing }
TBSYavuSystemView >> content: aWAFactoryView [ 

	content := aWAFactoryView
]

{ #category : #evaluating }
TBSYavuSystemView >> executeMenuActionFor: aMenuElement [
	| component |
	component := aMenuElement presenterView.
	content := component.
	selectedMenuID := aMenuElement id
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> initialize [ 
	
	super initialize.
	navBar := TBSYavuSystemNavBar onParent: self.
	content := self session yavuSystem homeViewClass onParent: self
]

{ #category : #rendering }
TBSYavuSystemView >> renderContentOn: html [

	self renderNavigationBarOn:  html.
	html tbsColumn largeSize: 12; with: [self content renderOn: html]
]

{ #category : #'rendering navbar' }
TBSYavuSystemView >> renderNavbarHeaderOn: html [
	html tbsNavbarHeader
		with: [ html tbsNavbarBrand
				callback: [ self content: self systemHomeView.
					];
				with: self systemName ]
]

{ #category : #'rendering navbar' }
TBSYavuSystemView >> renderNavbarSubsystemsMenues: html [


	html unorderedList
		class: 'nav navbar-nav';
		with: [ (self session yavuSystem allowedRootMenuActions
				groupedBy: [ :each | each subsystem ])
				keysAndValuesDo: [ :subsystem :submenues | 
					html tbsNavItem
						class: 'dropdown';
						with: [ html anchor
								class: 'dropdown-toggle';
								attributeAt: 'data-toggle' put: 'dropdown';
								attributeAt: 'href' put: '#';
								with: subsystem subsystemName.
							html unorderedList
								class: 'dropdown-menu';
								with: [ submenues
										do: [ :each | 
											| menuItem |
											menuItem := html tbsNavItem.
											each id = selectedMenuID
												ifTrue: [ menuItem beActive ].
											menuItem
												with: [ html anchor
														callback: [ self executeMenuActionFor: each ];
														with: each label ] ] ] ] ] ]
]

{ #category : #'rendering navbar' }
TBSYavuSystemView >> renderNavbarSystemMenues: html [
	^ html unorderedList
		class: 'nav navbar-nav navbar-right';
		with: [ html tbsNavItem
				with: [ html anchor
						callback: [ self content: (WAConfirmLogOffView onParent: self)];
						with: [ html span class: 'glyphicon glyphicon-log-out'.
							html text: ' Salir' ] ] ]
]

{ #category : #'rendering navbar' }
TBSYavuSystemView >> renderNavigationBarOn: html [

	html tbsNavbar
		beDefault;
		beInverse;
		with: [ html tbsContainer
				with: [ self renderNavbarHeaderOn: html.
					self renderNavbarSubsystemsMenues: html.
					self renderNavbarSystemMenues: html ] ]
]

{ #category : #hooks }
TBSYavuSystemView >> states [ 

	^ Array with: content with: navBar 
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> systemHomeView [

	 ^self session yavuSystem homeViewClass new
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> systemName [
	
	^ self session yavuSystem systemName
]

{ #category : #'as yet unclassified' }
TBSYavuSystemView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	"anHtmlRoot stylesheet resourceUrl: 'css/tbsReportDataSelector.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/financialReport.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/reportDataSelector.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/sb-admin-2.css'."
]
