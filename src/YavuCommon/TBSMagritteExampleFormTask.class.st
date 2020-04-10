Class {
	#name : #TBSMagritteExampleFormTask,
	#superclass : #WATask,
	#category : #'YavuCommon-Bootstrap-Magritte-Examples'
}

{ #category : #accessing }
TBSMagritteExampleFormTask class >> label [
	^ 'Magritte Form example'
]

{ #category : #private }
TBSMagritteExampleFormTask >> createFormBasedOn: formChooser [
	| theForm |
	theForm := TBSMagritteExampleFormDescription new asComponent.
	
	formChooser isValidationMessageStyleTop ifTrue: [
		theForm addDecoration: TBSMagritteValidationDecoration new ].
	
	theForm
		addDecoration: 
			(TBSMagritteFormDecoration newWithDefaultButtons 
				formCss: formChooser layoutStyle;
				legend: formChooser optionsSelectedString;
				yourself);
		yourself.
	
	formChooser comments ifFalse: [ 
		theForm magritteDescription do: [ :aDescription |
			aDescription comment: nil ]  ].
	theForm magritteDescription tbsInlineValidationMessages: formChooser isValidationMessageStyleInline.
	theForm magritteDescription tbsFormInline: formChooser isLayoutStyleFormInline.
	theForm magritteDescription tbsFormHorizontal: formChooser isLayoutStyleFormHorizontal.
	
	^ theForm
]

{ #category : #private }
TBSMagritteExampleFormTask >> formChooser [
	^ (TBSMagritteExampleFormChooser new asComponent)
		addDecoration: (TBSMagritteFormDecoration buttons: (Array with: #save -> 'Create a new form'));
		yourself
]

{ #category : #running }
TBSMagritteExampleFormTask >> go [
	| chosenForm formChooser chosenFormAnswer |
	"formChooser := self call: self formChooser."
	chosenForm := (self createFormBasedOn: formChooser).
	
	chosenFormAnswer := self call: chosenForm.
	chosenFormAnswer notNil
		ifTrue: [ self informSuccess: [ :r | r strong: 'Well done'; text: ' you have managed to survive this sample''s arbitary validation.' ] ]
		ifFalse: [ self informWarning: [ :r | r strong: 'Cancelled'; text: ' Oh well you can always try again to see if you can work-through this sample''s arbitary validation.' ] ]
]
