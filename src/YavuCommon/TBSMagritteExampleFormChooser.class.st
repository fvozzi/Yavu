Class {
	#name : #TBSMagritteExampleFormChooser,
	#superclass : #GRObject,
	#instVars : [
		'layoutStyle',
		'validationMessageStyle',
		'comments'
	],
	#category : #'YavuCommon-Bootstrap-Magritte-Examples'
}

{ #category : #'magritte descriptions' }
TBSMagritteExampleFormChooser >> commentDescription [
	<magritteDescription>
	^ MABooleanDescription new
		checkboxLabel: 'Show comments';
		accessor: #comments;
		componentClass: TBSMagritteCheckboxComponent;
		priority: 700;
		yourself
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> comments [
	^comments ifNil: [ true ]
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> comments: aBoolean [
	comments := aBoolean
]

{ #category : #'magritte descriptions' }
TBSMagritteExampleFormChooser >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: TBSMagritteFormRenderer;
		yourself
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> isLayoutStyleFormHorizontal [
	^ self layoutStyle = 'form-horizontal'
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> isLayoutStyleFormInline [
	^ self layoutStyle = 'form-inline'
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> isValidationMessageStyleBoth [
	^ self validationMessageStyle = 'Inline and top validation messages'
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> isValidationMessageStyleInline [
	^ self isValidationMessageStyleTop not or: [ self isValidationMessageStyleBoth ]
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> isValidationMessageStyleTop [
	^ self validationMessageStyle = 'top validation messages' or: [ self isValidationMessageStyleBoth ]
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> layoutStyle [
	^ layoutStyle ifNil: [ layoutStyle := self layoutStyles first ]
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> layoutStyle: anObject [
	layoutStyle := anObject
]

{ #category : #'magritte descriptions' }
TBSMagritteExampleFormChooser >> layoutStyleDescription [
	<magritteDescription>
	^ MASingleOptionDescription new 
		label: 'Layout styles';
		accessor: #layoutStyle;
		options: self layoutStyles;
		comment: 'choose a layout style';
		componentClass: TBSMagritteRadioGroupComponent;
		beRequired;
		yourself
]

{ #category : #options }
TBSMagritteExampleFormChooser >> layoutStyles [
	^ Array with: 'form-vertical' with: 'form-inline' with: 'form-horizontal'
]

{ #category : #printing }
TBSMagritteExampleFormChooser >> optionsSelectedString [
	^ layoutStyle, ', ', validationMessageStyle
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> validationMessageStyle [
	^ validationMessageStyle ifNil: [ validationMessageStyle := self validationMessageStyles first ]
]

{ #category : #accessing }
TBSMagritteExampleFormChooser >> validationMessageStyle: anObject [
	validationMessageStyle := anObject
]

{ #category : #'magritte descriptions' }
TBSMagritteExampleFormChooser >> validationMessageStyleDescription [
	<magritteDescription>
	^ MASingleOptionDescription new 
		label: 'Error message styles';
		accessor: #validationMessageStyle;
		options: self validationMessageStyles;
		comment: 'choose an error message style';
		componentClass: MASelectListRowsComponent;
		beRequired;
		yourself
]

{ #category : #options }
TBSMagritteExampleFormChooser >> validationMessageStyles [
	^ Array with: 'inline validation messages' with: 'top validation messages' with: 'Inline and top validation messages'
]
