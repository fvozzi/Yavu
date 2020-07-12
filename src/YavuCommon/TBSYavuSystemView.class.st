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
	"navBar := TBSYavuSystemNavBar onParent: self."
	content := self session yavuSystem homeViewClass onParent: self
]

{ #category : #rendering }
TBSYavuSystemView >> renderContentOn: html [

	self renderNavigationBarOn:  html.
	html column largeSize: 12; with: [self content renderOn: html]
]

{ #category : #'rendering navbar' }
TBSYavuSystemView >> renderNavbarHeaderOn: html [
	html navigationBarBrand
				callback: [ self content: self systemHomeView.
					];
				with: self systemName 
]

{ #category : #'rendering navbar' }
TBSYavuSystemView >> renderNavbarSubsystemsMenues: html [
	(self session yavuSystem allowedRootMenuActions
		groupedBy: [ :each | each subsystem ])
		keysAndValuesDo: [ :subsystem :submenues | 
			html navigationItem dropdown
				with: [ html div
						fontAwesome;
						with: [ html navigationLink
								class: subsystem fontAwesomeClass;
								dropdownToggle;
								dataToggle: 'dropdown';
								with: ' ', subsystem subsystemName.
							html dropdownMenu
								attributeAt: 'aria-labelledby' put: 'navbarDropdown';
								with: [ submenues
										do: [ :each | 
											| menuItem |
											menuItem := html dropdownItem.
											each id = selectedMenuID
												ifTrue: [ menuItem beActive ].
											menuItem
												callback: [ self executeMenuActionFor: each ];
												with: each label ] ] ] ] ]
]

{ #category : #'rendering navbar' }
TBSYavuSystemView >> renderNavbarSystemMenues: html [
	^ html navigationItem
		with: [ html div
				fontAwesome;
				with: [ html navigationLink fontAwesomeSignOutIcon
						callback: [ self content: (WAConfirmLogOffView onParent: self) ];
						with: ' Salir' ] ]
]

{ #category : #'rendering navbar' }
TBSYavuSystemView >> renderNavigationBarOn: html [

	| bar id |
	
	id :=  '#navbarCollapsed'..
	bar := html navigationBar.
	bar id: id.
	bar beDark; expandLarge.
	bar background beDark.
	bar 	with: [ 
	
		self renderNavbarHeaderOn: html.
		html
			navigationBarToggler
			beButtonType;
			collapse;
			dataTarget: id;
			with: [ html navigationBarTogglerIcon ].
	html navigationBarCollapse collapse id: 'navbarCollapsed'; with: [ 
			html navigationBarNavigation: [
		self renderNavbarSubsystemsMenues: html.
					self renderNavbarSystemMenues: html ] ]]
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
	anHtmlRoot title: self session yavuSystem companyName, ' (', self session yavuSystem loggedUser name, ')'
]
