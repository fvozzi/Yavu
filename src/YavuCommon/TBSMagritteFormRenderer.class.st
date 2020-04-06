Class {
	#name : #TBSMagritteFormRenderer,
	#superclass : #MAComponentRenderer,
	#instVars : [
		'validationMessagesInline',
		'formInline',
		'formHorizontal'
	],
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #private }
TBSMagritteFormRenderer >> classFor: aDescription [
	| classes |
	classes := OrderedCollection withAll: aDescription currentCssClasses.
	(self hasError: aDescription)
		ifTrue: [ classes add: 'has-error' ].
	^ classes isEmpty
		ifFalse: [ classes reduce: [ :a :b | a , ' ' , b ] ]
]

{ #category : #'error handling' }
TBSMagritteFormRenderer >> errorsForDescription: aDescription [ 
	^ component errors select: [ :anError | anError tag = aDescription ]
]

{ #category : #accessing }
TBSMagritteFormRenderer >> formHorizontal [
	^formHorizontal ifNil: [ false ]
]

{ #category : #accessing }
TBSMagritteFormRenderer >> formHorizontal: anObject [
	formHorizontal := anObject
]

{ #category : #accessing }
TBSMagritteFormRenderer >> formInline [
	^ formInline ifNil: [ false ]
]

{ #category : #accessing }
TBSMagritteFormRenderer >> formInline: anObject [
	formInline := anObject
]

{ #category : #rendering }
TBSMagritteFormRenderer >> renderComment:  aDescription [
	aDescription comment notNil ifTrue: [
		html paragraph
			class: 'help-block';
			with: aDescription comment ]
]

{ #category : #rendering }
TBSMagritteFormRenderer >> renderContainer: aDescription [
	self validationMessagesInline: aDescription tbsInlineValidationMessages.
	self formInline: aDescription tbsFormInline.
	self formHorizontal: aDescription tbsFormHorizontal.
	
	super renderContainer: aDescription
]

{ #category : #rendering }
TBSMagritteFormRenderer >> renderControl: aDescription [
	html render: (self childAt: aDescription)
]

{ #category : #rendering }
TBSMagritteFormRenderer >> renderElement: aDescription [
	aDescription group = group
		ifFalse: [ self renderGroup: aDescription ].
		
	html tbsFormGroup
		class: (self classFor: aDescription);
		with: [
			| tag |
			self renderLabel: aDescription.
			tag := html div
				class: 'controls';
				yourself.
			self formHorizontal ifTrue: [ tag class: 'col-sm-10' ].
			tag
				with: [ 
					self renderControl: aDescription.
					component isReadonly ifFalse: [ self renderComment: aDescription ].
					self validationMessagesInline ifTrue: [ self renderInlineError: aDescription ] ] ]
]

{ #category : #rendering }
TBSMagritteFormRenderer >> renderInlineError: aDescription [
	(self errorsForDescription: aDescription) do: [ :error |
		html tbsAlert
			beDanger;
			with: error messageText ]
]

{ #category : #rendering }
TBSMagritteFormRenderer >> renderLabel: aDescription [
	| label |
	aDescription hasLabel ifFalse: [ 
		self formHorizontal ifTrue: [ html label
			class: 'col-sm-2';
			with: [ html space ] ].
		^ self ].
	label := html label
		class: 'control-label';
		yourself.
	(self childAt: aDescription) hasLabelId
		ifTrue: [ label for: (self childAt: aDescription) labelId ].
	self formInline ifTrue: [ label class: 'sr-only' ].
	self formHorizontal ifTrue: [ label class: 'col-sm-2'; class: 'control-label' ].
	label with: [ html html: aDescription label ]
]

{ #category : #accessing }
TBSMagritteFormRenderer >> validationMessagesInline [
	^ validationMessagesInline ifNil: [ validationMessagesInline := true ]
]

{ #category : #accessing }
TBSMagritteFormRenderer >> validationMessagesInline: anObject [
	validationMessagesInline := anObject
]
