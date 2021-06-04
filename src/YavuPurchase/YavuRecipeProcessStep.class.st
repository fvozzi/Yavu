Class {
	#name : #YavuRecipeProcessStep,
	#superclass : #YavuObject,
	#instVars : [
		'number',
		'process',
		'time',
		'owner'
	],
	#category : #'YavuPurchase-Model'
}

{ #category : #accessing }
YavuRecipeProcessStep class >> owner: aYavuRecipe [ 
	
		^ self new initializeOwner: aYavuRecipe 
]

{ #category : #accessing }
YavuRecipeProcessStep class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #'as yet unclassified' }
YavuRecipeProcessStep >> descriptionNumber [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MANumberDescription new 
		accessor: #number;
		label: 'Paso';
		priority: 100;
		beRequired;
		bePositive;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'as yet unclassified' }
YavuRecipeProcessStep >> descriptionProcess [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #process;
		label: 'Proceso';
		priority: 110;
		beRequired;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'as yet unclassified' }
YavuRecipeProcessStep >> descriptionTime [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MANumberDescription new 
		accessor: #time;
		label: 'Tiempo de Elaboración';
		priority: 130;
		beRequired;
		bePositive;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #initialization }
YavuRecipeProcessStep >> initializeOwner: aYavuRecipe [ 
	
	owner := aYavuRecipe 
]

{ #category : #accessing }
YavuRecipeProcessStep >> number [
	^ number
]

{ #category : #accessing }
YavuRecipeProcessStep >> number: anObject [
	number := anObject
]

{ #category : #accessing }
YavuRecipeProcessStep >> process [
	^ process
]

{ #category : #accessing }
YavuRecipeProcessStep >> process: anObject [
	process := anObject
]

{ #category : #accessing }
YavuRecipeProcessStep >> time [
	^ time
]

{ #category : #accessing }
YavuRecipeProcessStep >> time: anObject [
	time := anObject
]
