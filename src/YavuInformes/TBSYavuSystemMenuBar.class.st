Class {
	#name : #TBSYavuSystemMenuBar,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'selectedMenuID',
		'main'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #accessing }
TBSYavuSystemMenuBar class >> main: aTBSSicMain [ 
	
	^self new initializeMain: aTBSSicMain
]

{ #category : #evaluating }
TBSYavuSystemMenuBar >> executeMenuActionFor: aMenuElement [
	| component |
	component := aMenuElement presenterClass new.
	self openComponent: component.
	selectedMenuID := aMenuElement id
]

{ #category : #'as yet unclassified' }
TBSYavuSystemMenuBar >> initialize [ 

	super initialize.
	selectedMenuID := 1
]

{ #category : #initialization }
TBSYavuSystemMenuBar >> initializeMain: aTBSSicMain [ 
	

	main := aTBSSicMain 
]

{ #category : #accessing }
TBSYavuSystemMenuBar >> main [
	
	
	^main
]

{ #category : #evaluating }
TBSYavuSystemMenuBar >> openComponent: component [
	self main content: component
]

{ #category : #'as yet unclassified' }
TBSYavuSystemMenuBar >> renderContentOn: html [

		html tbsNavbar beDefault ; beInverse; attributeAt: 'role' put: 'navigation'; with: [ 
			html tbsContainer with: [ 
				html tbsNavbarHeader with: [ 
					html button 
						bePush;
						class: 'navbar-toggle'; 
						attributeAt: 'data-toggle' put: 'collapse';
						attributeAt: 'data-target' put: '.navbar-collapse';
						with: [ 
					html span class: 'sr-only'; with: [ html text: 'Too	gle navigation'].
					html span class: 'icon-bar'.
					html span class: 'icon-bar'.
					html span class: 'icon-bar' ] .
			html tbsNavbarBrand
				callback: [self openComponent: TBSSicHome new];
				with: 'Yavu Soft'.
				].
			html div class: 'navbar-collapse collapse'; with: [
				html unorderedList class: 'nav navbar-nav'; with: [ 
					self session yavuSystem allowedRootMenuActions do: [ :each | | menuItem |
						menuItem := html tbsNavItem.
						each id = selectedMenuID ifTrue: [ menuItem beActive ].
						menuItem with: [html anchor callback: [ self executeMenuActionFor: each ]; with: each label ] 
					]
					 ]
				]		
					
					
					 ].
		]
]