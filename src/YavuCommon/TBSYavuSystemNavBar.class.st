Class {
	#name : #TBSYavuSystemNavBar,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'selectedMenuID',
		'main'
	],
	#category : #'YavuCommon-View'
}

{ #category : #accessing }
TBSYavuSystemNavBar class >> main: aTBSSicMain [ 
	
	^self new initializeMain: aTBSSicMain
]

{ #category : #evaluating }
TBSYavuSystemNavBar >> executeMenuActionFor: aMenuElement [
	| component |
	component := aMenuElement presenterView.
	self openComponent: component.
	selectedMenuID := aMenuElement id
]

{ #category : #'as yet unclassified' }
TBSYavuSystemNavBar >> initialize [ 

	super initialize.
	selectedMenuID := 1
]

{ #category : #initialization }
TBSYavuSystemNavBar >> initializeMain: aTBSSicMain [ 
	

	main := aTBSSicMain 
]

{ #category : #evaluating }
TBSYavuSystemNavBar >> openComponent: component [
	parent content: component
]

{ #category : #'as yet unclassified' }
TBSYavuSystemNavBar >> renderContentOn: html [
	html tbsNavbar
		beDefault;
		beInverse;
		with: [ html tbsContainer
				with: [ self renderNavbarHeaderOn: html.
					self renderNavbarSubsystemsMenues: html.
					self renderNavbarSystemMenues: html ] ]
]

{ #category : #'as yet unclassified' }
TBSYavuSystemNavBar >> renderNavbarHeaderOn: html [
	html tbsNavbarHeader
		with: [ html tbsNavbarBrand
				callback: [ self openComponent: self systemHomeView ];
				with: self systemName ]
]

{ #category : #'as yet unclassified' }
TBSYavuSystemNavBar >> renderNavbarSubsystemsMenues: html [
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

{ #category : #'as yet unclassified' }
TBSYavuSystemNavBar >> renderNavbarSystemMenues: html [
	^ html unorderedList
		class: 'nav navbar-nav navbar-right';
		with: [ html tbsNavItem
				with: [ html anchor
						callback: [ self openComponent: (WAConfirmLogOffView onParent: parent)];
						with: [ html span class: 'glyphicon glyphicon-log-out'.
							html text: ' Salir' ] ] ]
]

{ #category : #'as yet unclassified' }
TBSYavuSystemNavBar >> systemHomeView [

	 ^self session yavuSystem homeViewClass new
]

{ #category : #'as yet unclassified' }
TBSYavuSystemNavBar >> systemName [
	
	^ self session yavuSystem systemName
]
