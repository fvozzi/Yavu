Class {
	#name : #TBSVerifiedPasswordComponent,
	#superclass : #MAVerifiedPasswordComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #rendering }
TBSVerifiedPasswordComponent >> renderEditorOn: html [
	| passwordInput verifiedPasswordInput |
	passwordInput := html passwordInput.
	description placeholder notNil ifTrue: [ 
		passwordInput placeholder: description placeholder ].
	passwordInput
		id: self labelId;
		on: #string of: self.
		
	html break.
	
	verifiedPasswordInput := html passwordInput.
	
	description placeholder notNil ifTrue: [ 
		verifiedPasswordInput twbsPlaceholderText: 'verify password' ].
	
	verifiedPasswordInput
		class: 'verification';
		on: #verificationString of: self
]

{ #category : #'as yet unclassified' }
TBSVerifiedPasswordComponent >> renderInputOn: html [
	| textInput |
	textInput := html textInput.
	description placeholder notNil ifTrue: [ 
		textInput placeholder: description placeholder ].	
		
	textInput
		id: self labelId;
		on: #string of: self.
]
