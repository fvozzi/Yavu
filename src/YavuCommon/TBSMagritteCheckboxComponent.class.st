Class {
	#name : #TBSMagritteCheckboxComponent,
	#superclass : #MACheckboxComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #rendering }
TBSMagritteCheckboxComponent >> renderEditorOn: html [
	html div
		class: 'checkbox';
		with: [
			html label: [ 
				html checkbox
					id: self labelId;
					disabled: self isReadonly;
					on: #value of: self.
				html space; render: self magritteDescription checkboxLabel ] ]
]

{ #category : #rendering }
TBSMagritteCheckboxComponent >> renderEditorOn: html ajaxScript: aScript [
	html div
		class: 'checkbox';
		with: [
			html label: [ 
				html checkbox
					id: self labelId;
					disabled: self isReadonly;
					onChange: aScript;
					on: #value of: self.
				html space; render: self magritteDescription checkboxLabel ] ]
]

{ #category : #rendering }
TBSMagritteCheckboxComponent >> renderEditorOn: html ajaxScripts: aScriptList [
	html div
		class: 'checkbox';
		with: [
			html label: [ 
				| tag |
				tag := html checkbox
					id: self labelId;
					disabled: self isReadonly;
					yourself.
				aScriptList do: [ :each | tag onChange: each ].
				tag on: #value of: self.
				html space; render: self magritteDescription checkboxLabel ] ]
]

{ #category : #rendering }
TBSMagritteCheckboxComponent >> renderViewerOn: html [
	html paragraph
		class: 'form-control-static';
		with: self string
]
