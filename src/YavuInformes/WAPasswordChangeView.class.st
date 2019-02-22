Class {
	#name : #WAPasswordChangeView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'model',
		'errorDescription'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAPasswordChangeView >> cancel [

	self parent content: WAHomeView new
	
]

{ #category : #'as yet unclassified' }
WAPasswordChangeView >> errorDescription [

	^errorDescription 
]

{ #category : #'as yet unclassified' }
WAPasswordChangeView >> errorDescription: anExecption [

	errorDescription:= anExecption
]

{ #category : #'as yet unclassified' }
WAPasswordChangeView >> initializeModel [
	
	model:= PasswordChange on: self session user
]

{ #category : #'as yet unclassified' }
WAPasswordChangeView >> model [

	model ifNil: [self initializeModel].
	^model
]

{ #category : #'as yet unclassified' }
WAPasswordChangeView >> renderContentOn: html [
	"Render the menu elements."
	
		html div class: 'passwordChange'; with: [
		html form: [
			html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Cambiar contraseña'].
			html div class: 'fila'; with: [
				html div class: 'label'; with: [html text: 'Contraseña Actual'].
				html passwordInput on: #currentPassword of: self model].
			html div class: 'fila'; with: [
				html div class: 'label'; with: [html text: 'Contraseña Nueva'].
				html passwordInput on: #newPassword of: self model].
			html div class: 'fila'; with: [
				html div class: 'label'; with: [html text: 'Repetir contraseña nueva'].
				html passwordInput on: #confirmedPassword of: self model].
			html div class: 'errors'; with: [html text: self errorDescription].
			html div class: 'accion'; with: [
					html submitButton text: 'Cambiar contraseña'; callback: [self save].
					html submitButton text: 'Cancelar'; callback: [self cancel]				
				]
			]]
]

{ #category : #'as yet unclassified' }
WAPasswordChangeView >> save [

	[self model apply] on: Error do: [:ex | ^self errorDescription: ex].
	self parent content: WAHomeView new
	
]

{ #category : #'as yet unclassified' }
WAPasswordChangeView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
	 anHtmlRoot stylesheet resourceUrl: 'passwordChange.css'
]
