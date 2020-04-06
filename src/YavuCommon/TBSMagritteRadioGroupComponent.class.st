Class {
	#name : #TBSMagritteRadioGroupComponent,
	#superclass : #MARadioGroupComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #testing }
TBSMagritteRadioGroupComponent class >> isAbstract [
	^ false
]

{ #category : #rendering }
TBSMagritteRadioGroupComponent >> renderEditorOn: html [
	| group |
	group := html radioGroup.
	html span
		id: self labelId;
		with: [
			self optionsWithIndexDo: [ :each :index |
				self renderOption: each
					index: index
					in: group
					on: html ]
				separatedBy: [ ] ]
]

{ #category : #rendering }
TBSMagritteRadioGroupComponent >> renderOption: anObject index: anInteger in: aRadioGroup on: html [
	| optionId |
	optionId := self optionId: anInteger.
	html label
		class: 'radio';
		with: [
			html radioButton
				id: optionId;
				group: aRadioGroup;
				selected: self value = anObject;
				callback: [ self value: anObject ].
			html space.
			html text: (self labelForOption: anObject) ].



]
