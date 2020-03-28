Class {
	#name : #WASICMenu,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'elements',
		'main',
		'components'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WASICMenu class >> forElements: aMenuElements [
	"Answer a new receiver instance representing a menu for the user anUser."
	
	^self new elements: aMenuElements 
]

{ #category : #'as yet unclassified' }
WASICMenu >> children [

	^self components asArray
]

{ #category : #'as yet unclassified' }
WASICMenu >> components [

	components isNil ifTrue: [self initializeComponents].
	^components
]

{ #category : #accessing }
WASICMenu >> elements [

	^elements
]

{ #category : #breakpoint }
WASICMenu >> elements: anOrderedCollection [ 

	elements:= anOrderedCollection
]

{ #category : #'as yet unclassified' }
WASICMenu >> initializeComponents [

	components := self elements inject: Dictionary new into: [:accum :each | accum add: each label -> each view; yourself ]
]

{ #category : #accessing }
WASICMenu >> main [
	^ main
]

{ #category : #accessing }
WASICMenu >> main: anObject [
	main := anObject
]

{ #category : #'as yet unclassified' }
WASICMenu >> renderCompositeMenuElement: aMenuElement on: html [
	"Render a simple menu element on html."
	
	self halt.
	html anchor 
		callback: [self main content: aMenuElement presenterClass new];
		with: aMenuElement label.
	html unorderedList: [
		aMenuElement subMenues do: [:each |
			html listItem: [
				html anchor 
					callback: [self main content: each presenterClass new];
					with: each label
				] 
			]
		]
]

{ #category : #'as yet unclassified' }
WASICMenu >> renderContentOn: html [
	"Render the menu elements."

	self halt.
	html div
		id: 'menu';
		class: 'ui-corner-all';
		with: [
			html unorderedList: [
				html div class: 'ui-corner-all'; with: [
				self elements do: [:menuElement |
					html listItem: [menuElement renderContentOn: html on: self	]].
						 ] 
			]]
]

{ #category : #'as yet unclassified' }
WASICMenu >> renderSimpleMenuElement: aMenuElement on: html [
	"Render a simple menu element on html."
	
	html anchor 
		callback: [self main content: aMenuElement presenterClass new];
		with: aMenuElement label
]
