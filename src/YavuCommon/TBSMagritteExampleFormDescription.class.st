Class {
	#name : #TBSMagritteExampleFormDescription,
	#superclass : #GRObject,
	#instVars : [
		'name',
		'number',
		'bePositive'
	],
	#category : #'YavuCommon-Bootstrap-Magritte-Examples'
}

{ #category : #accessing }
TBSMagritteExampleFormDescription >> bePositive [
	^ bePositive ifNil: [ bePositive := true ]
]

{ #category : #accessing }
TBSMagritteExampleFormDescription >> bePositive: anObject [
	bePositive := anObject
]

{ #category : #'magritte descriptions' }
TBSMagritteExampleFormDescription >> bePositiveDescription [
	<magritteDescription>
	^ MABooleanDescription new
		checkboxLabel: 'Be positive';
		accessor: #bePositive;
		componentClass: TBSMagritteCheckboxComponent;
		priority: 600;
		yourself
]

{ #category : #'magritte descriptions' }
TBSMagritteExampleFormDescription >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: TBSMagritteFormRenderer;
		yourself
]

{ #category : #accessing }
TBSMagritteExampleFormDescription >> name [
	^ name

]

{ #category : #accessing }
TBSMagritteExampleFormDescription >> name: anObject [
	name := anObject
]

{ #category : #'magritte descriptions' }
TBSMagritteExampleFormDescription >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		priority: 10;
		label: 'Name';
		accessor: #name;
		beRequired;
		requiredErrorMessage: 'We cannot proceed without a name.';
		comment: 'Please enter your name';
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #accessing }
TBSMagritteExampleFormDescription >> number [
	^ number
]

{ #category : #accessing }
TBSMagritteExampleFormDescription >> number: anObject [
	number := anObject
]

{ #category : #'magritte descriptions' }
TBSMagritteExampleFormDescription >> numberDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		priority: 30;
		label: 'Numbers';
		accessor: #number;
		options: (0 to: 10);
		comment: 'select your favourite number';
		addCondition: [ :v | v ~= 0 ] labelled: 'sorry we are not permitting zero to be favourite';
		addCondition: [ :v | v ~= 1 ] labelled: 'sorry we are not permitting one to be favourite';
		componentClass: TBSMagritteSelectListComponent;
		beRequired;
		yourself
]
