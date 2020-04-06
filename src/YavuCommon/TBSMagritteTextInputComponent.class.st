Class {
	#name : #TBSMagritteTextInputComponent,
	#superclass : #MATextInputComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #rendering }
TBSMagritteTextInputComponent >> renderInputOn: html [
	| textInput |
	textInput := html textInput tbsFormControl.
	description placeholder notNil ifTrue: [ 
		textInput placeholder: description placeholder ].
		
	description cssClasses do: [ :cls | textInput class: cls ].
		
	textInput
		id: self labelId;
		on: #string of: self
]

{ #category : #rendering }
TBSMagritteTextInputComponent >> renderInputOn: html  ajaxScript: aScript [ 
	| textInput |
	textInput := html textInput tbsFormControl
		id: self labelId;
		onChange: aScript;
		yourself.
	description placeholder notNil ifTrue: [ 
		textInput placeholder: description placeholder ].
	description cssClasses do: [ :cls | textInput class: cls ].
	textInput on: #string of: self
]

{ #category : #rendering }
TBSMagritteTextInputComponent >> renderInputOn: html ajaxScripts: aScriptList [
	| textInput |
	textInput := html textInput tbsFormControl
		id: self labelId;
		yourself.
	aScriptList do: [ :each | textInput onChange: each ].
	description placeholder notNil ifTrue: [ 
		textInput placeholder: description placeholder ].
	description cssClasses do: [ :cls | textInput class: cls ].
	textInput on: #string of: self
]

{ #category : #rendering }
TBSMagritteTextInputComponent >> renderViewerOn: html [
	html paragraph
		class: 'form-control-static';
		with: self string
]
