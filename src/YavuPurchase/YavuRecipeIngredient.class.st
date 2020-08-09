Class {
	#name : #YavuRecipeIngredient,
	#superclass : #YavuObject,
	#instVars : [
		'ingredient',
		'unit',
		'quantity',
		'owner'
	],
	#category : #'YavuPurchase-Entities'
}

{ #category : #'as yet unclassified' }
YavuRecipeIngredient class >> owner: aYavuRecipe [ 
	
		^ self new initializeOwner: aYavuRecipe 
]

{ #category : #accessing }
YavuRecipeIngredient class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #descriptions }
YavuRecipeIngredient >> descriptionIngredient [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #ingredient;
		label: 'Ingrediente';
		priority: 100;
		options: self subsystem possibleRecipeIngredients;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuRecipeIngredient >> descriptionQuantity [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MANumberDescription new 
		accessor: #quantity;
		label: 'Cantidad';
		priority: 130;
		beRequired;
		bePositive;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuRecipeIngredient >> descriptionUnit [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #unit;
		default: self subsystem kilogramPresentationUnit;
		options: self subsystem presentationUnits;
		label: 'Unidad';
		priority: 120;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #accessing }
YavuRecipeIngredient >> ingredient [
	^ ingredient
]

{ #category : #accessing }
YavuRecipeIngredient >> ingredient: anObject [
	ingredient := anObject
]

{ #category : #'as yet unclassified' }
YavuRecipeIngredient >> initializeOwner: aYavuRecipe [ 
	
	owner := aYavuRecipe 
]

{ #category : #accessing }
YavuRecipeIngredient >> quantity [
	^ quantity
]

{ #category : #accessing }
YavuRecipeIngredient >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
YavuRecipeIngredient >> unit [
	^ unit
]

{ #category : #accessing }
YavuRecipeIngredient >> unit: anObject [
	unit := anObject
]
