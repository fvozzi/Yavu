Class {
	#name : #YavuRecipe,
	#superclass : #YavuEntity,
	#instVars : [
		'recipeIngredients',
		'amountOfPortions',
		'process',
		'availableAsIngredient',
		'recipeProcessSteps'
	],
	#category : #'YavuPurchase-Model'
}

{ #category : #testing }
YavuRecipe class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuRecipe class >> label [ 

	^ 'Receta'
]

{ #category : #accessing }
YavuRecipe class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #accessing }
YavuRecipe >> amountOfPortions [
	^ amountOfPortions
]

{ #category : #accessing }
YavuRecipe >> amountOfPortions: anObject [
	amountOfPortions := anObject
]

{ #category : #accessing }
YavuRecipe >> availableAsIngredient [
	^ availableAsIngredient
]

{ #category : #accessing }
YavuRecipe >> availableAsIngredient: anObject [
	availableAsIngredient := anObject
]

{ #category : #'as yet unclassified' }
YavuRecipe >> descriptionAmountOfPortions [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MANumberDescription new 
		accessor: #amountOfPortions;
		label: 'Porciones';
		priority: 110;
		beRequired;
		bePositive;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'as yet unclassified' }
YavuRecipe >> descriptionAvailableAsIngredient [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MABooleanDescription new 
		accessor: #availableAsIngredient;
		label: 'Ingrediente?';
		priority: 120;
		componentClass: TBSMagritteCheckboxComponent;
		yourself
]

{ #category : #'as yet unclassified' }
YavuRecipe >> descriptionProcess [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAMemoDescription new 
		accessor: #process;
		label: 'Proceso';
		priority: 130;
		componentClass: TBSMagritteTextAreaComponent;
		yourself
]

{ #category : #descriptions }
YavuRecipe >> descriptionRecipeIngredients [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAToManyRelationDescription new
		accessor: #recipeIngredients;
		classes: (OrderedCollection with: YavuRecipeIngredient);
		default: nil;
		label: 'Ingredientes';
		priority: 120;
		beRequired;
		componentClass: TBSMagritteOneToManyComponent;
		canExport: false;
		yourself
]

{ #category : #descriptions }
YavuRecipe >> descriptionRecipeProcessSteps [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAToManyRelationDescription new
		accessor: #recipeProcessSteps;
		classes: (OrderedCollection with: YavuRecipeProcessStep);
		default: nil;
		label: 'Pasos del proceso';
		priority: 130;
		beRequired;
		componentClass: TBSMagritteOneToManyComponent;
		canExport: false;
		yourself
]

{ #category : #'sin categoria' }
YavuRecipe >> initialize [ 

	availableAsIngredient := false.
	recipeIngredients := OrderedCollection new.
	recipeProcessSteps := OrderedCollection new
]

{ #category : #accessing }
YavuRecipe >> process [
	^ process
]

{ #category : #accessing }
YavuRecipe >> process: anObject [
	process := anObject
]

{ #category : #accessing }
YavuRecipe >> recipeIngredients [
	^ recipeIngredients
]

{ #category : #accessing }
YavuRecipe >> recipeIngredients: anObject [
	recipeIngredients := anObject
]

{ #category : #accessing }
YavuRecipe >> recipeProcessSteps [
	recipeProcessSteps ifNil: [ recipeProcessSteps := OrderedCollection new ].
	^ recipeProcessSteps
]

{ #category : #accessing }
YavuRecipe >> recipeProcessSteps: anObject [
	recipeProcessSteps := anObject
]
