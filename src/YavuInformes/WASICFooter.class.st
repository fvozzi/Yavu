Class {
	#name : #WASICFooter,
	#superclass : #WAYavuComponent,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WASICFooter >> renderContentOn: html [

	"Renderiza el contenido del receptor."
	html div id: 'pie'; with: [
		html heading level5 with: [
			html
				text: '2013 WebSic'.
			self session user notNil ifTrue: [
				html text: ' - Conectado como: ', self session user name
					]
			].
		]
	
]
