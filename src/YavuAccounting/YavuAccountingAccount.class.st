Class {
	#name : #YavuAccountingAccount,
	#superclass : #YavuEntity,
	#instVars : [
		'accountType'
	],
	#category : #'YavuAccounting-Entities'
}

{ #category : #testing }
YavuAccountingAccount class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuAccountingAccount class >> label [ 

	^ 'Cuenta contable'
]

{ #category : #accessing }
YavuAccountingAccount class >> subsystemClass [
	^ Smalltalk at: #YavuAccountingSubsystem
]

{ #category : #accessing }
YavuAccountingAccount >> accountType [
	^ accountType
]

{ #category : #accessing }
YavuAccountingAccount >> accountType: anObject [
	accountType := anObject
]

{ #category : #'as yet unclassified' }
YavuAccountingAccount >> descriptionAccountType [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #accountType;
		label: 'Tipo de cuenta';
		priority: 120;
		optionsAndLabels: (YavuAccountType allSubclasses collect: [:each | each -> each label]);
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]
