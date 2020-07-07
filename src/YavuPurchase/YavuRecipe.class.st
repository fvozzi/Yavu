Class {
	#name : #YavuRecipe,
	#superclass : #YavuEntity,
	#instVars : [
		'recipeIngredients',
		'amountOfPortions',
		'process'
	],
	#category : #'YavuPurchase-Entities'
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
YavuRecipe >> descriptionProcess [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAMemoDescription new 
		accessor: #process;
		label: 'Proceso';
		priority: 130;
		beRequired;
		componentClass: TBSMagritteTextAreaComponent;
		yourself
]

{ #category : #descriptions }
YavuRecipe >> descriptionPurchaseTransactionItems [
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

{ #category : #'sin categoria' }
YavuRecipe >> initialize [ 

	recipeIngredients := OrderedCollection new
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
