Class {
	#name : #YavuBusinessName,
	#superclass : #YavuEntity,
	#instVars : [
		'cuitNumber'
	],
	#category : #'YavuAccounting-Entities'
}

{ #category : #testing }
YavuBusinessName class >> isVoyageRoot [

	 ^true 
]

{ #category : #accessing }
YavuBusinessName class >> label [ 

	^ 'Razón Social'
]

{ #category : #accessing }
YavuBusinessName class >> subsystemClass [
	^ Smalltalk at: #YavuAccountingSubsystem
]

{ #category : #accessing }
YavuBusinessName >> cuitNumber [
	^ cuitNumber
]

{ #category : #accessing }
YavuBusinessName >> cuitNumber: anObject [
	cuitNumber := anObject
]

{ #category : #descriptions }
YavuBusinessName >> descriptionCUITNumber [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #cuitNumber;
      label: 'CUIT';
      	priority: 140;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]
