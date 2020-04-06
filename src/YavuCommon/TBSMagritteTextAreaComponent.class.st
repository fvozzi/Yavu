Class {
	#name : #TBSMagritteTextAreaComponent,
	#superclass : #MATextAreaComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #rendering }
TBSMagritteTextAreaComponent >> renderEditorOn: html [
	| tag |
	tag := html textArea tbsFormControl 
		id: self labelId;
		rows: self magritteDescription lineCount;
		yourself.
	self magritteDescription hasComment ifTrue: [ tag placeholder: self magritteDescription comment ].
	tag on: #string of: self
]

{ #category : #rendering }
TBSMagritteTextAreaComponent >> renderEditorOn: html ajaxScript: aScript [
	| tag |
	tag := html textArea tbsFormControl 
		id: self labelId;
		rows: self magritteDescription lineCount;
		onChange: aScript;
		yourself.
	self magritteDescription hasComment ifTrue: [ tag placeholder: self magritteDescription comment ].
	tag on: #string of: self
]

{ #category : #rendering }
TBSMagritteTextAreaComponent >> renderEditorOn: html ajaxScripts: aScriptList [
	| tag |
	tag := html textArea tbsFormControl 
		id: self labelId;
		rows: self magritteDescription lineCount;
		yourself.
	aScriptList do: [ :each | tag onChange: each ].
	self magritteDescription hasComment ifTrue: [ tag placeholder: self magritteDescription comment ].
	tag on: #string of: self
]

{ #category : #rendering }
TBSMagritteTextAreaComponent >> renderViewerOn: html [
	html paragraph
		class: 'form-control-static';
		with: self string
]
