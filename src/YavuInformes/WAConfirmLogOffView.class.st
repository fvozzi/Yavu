Class {
	#name : #WAConfirmLogOffView,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAConfirmLogOffView >> renderContentOn: html [

	html form: [ 
	html div id: 'logOffWindow'; with: [ 
		html text: 'Desea salir del sistema?'.
		html submitButton text: 'Sí'; callback: [ self parent cerrarSession ].
		html submitButton text: 'No'; callback: [ self parent content: WAHomeView new ]
		 ] ]
]
