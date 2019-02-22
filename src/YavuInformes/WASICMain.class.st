Class {
	#name : #WASICMain,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'header',
		'footer',
		'menu',
		'content'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WASICMain >> cerrarSession [

	self session unregister.
	self requestContext redirectTo: self application url
]

{ #category : #'as yet unclassified' }
WASICMain >> children [
^ Array with: header with: footer with: menu with: content
]

{ #category : #accessing }
WASICMain >> content [
	
	^content
]

{ #category : #accessing }
WASICMain >> content: anObject [
	content := anObject
]

{ #category : #accessing }
WASICMain >> footer [
	^ footer
]

{ #category : #accessing }
WASICMain >> footer: anObject [
	footer := anObject
]

{ #category : #accessing }
WASICMain >> header [
	^ header
]

{ #category : #accessing }
WASICMain >> header: anObject [
	header := anObject
]

{ #category : #'initialize-release' }
WASICMain >> initialize [

	super initialize.
	header := WASICHeader new.
	footer := WASICFooter new.
	content := WAHomeView new
	
]

{ #category : #accessing }
WASICMain >> initializeMenu [

	self halt.
	menu:= (WASICMenu forElements: self session user menuElements) main: self; yourself
]

{ #category : #accessing }
WASICMain >> menu [

	menu isNil ifTrue: [self initializeMenu].
	^menu
]

{ #category : #accessing }
WASICMain >> menu: anObject [
	menu := anObject
]

{ #category : #rendering }
WASICMain >> renderContentOn: html [
	"Renderiza la pagina principal del sistema."
	
	"html render: self header."
	html render: self menu.
	html div id: #content; with: [html render: (self content parent: self )].
	"html render: self footer"
]

{ #category : #'as yet unclassified' }
WASICMain >> states [
^ Array with: self
]

{ #category : #'as yet unclassified' }
WASICMain >> updateRoot: anHtmlRoot [
	
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet resourceUrl: 'sic.css'.
	anHtmlRoot stylesheet resourceUrl: 'menu.css'.
	anHtmlRoot stylesheet resourceUrl: 'factory.css'.
	anHtmlRoot javascript resourceUrl: 'https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js'.
	anHtmlRoot javascript resourceUrl: 'scripts/jquery.jqplot.min.js'.
	anHtmlRoot javascript resourceUrl: 'scripts/jqplot.canvasTextRenderer.min.js'.
	anHtmlRoot javascript resourceUrl: 'scripts/jqplot.canvasAxisLabelRenderer.min.js'.
	anHtmlRoot javascript resourceUrl: 'scripts/jqplot.canvasAxisTickRenderer.min.js'.
	anHtmlRoot javascript resourceUrl: 'scripts/jqplot.barRenderer.min.js'.
	anHtmlRoot javascript resourceUrl: 'scripts/jqplot.categoryAxisRenderer.min.js'.
	anHtmlRoot javascript resourceUrl: 'scripts/jqplot.dateAxisRenderer.min.js'.
	anHtmlRoot javascript resourceUrl: 'scripts/jqplot.pointLabels.min.js'.
	anHtmlRoot title: 'Websic'

  
]
