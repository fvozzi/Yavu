Class {
	#name : #TBSRecipeView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'recipe'
	],
	#category : #'YavuPurchase-View'
}

{ #category : #'as yet unclassified' }
TBSRecipeView class >> withRecipe: aRecipe [

	^ self new initializeRecipe: aRecipe
]

{ #category : #initialization }
TBSRecipeView >> initializeRecipe: aRecipe [ 

	recipe := aRecipe
]

{ #category : #rendering }
TBSRecipeView >> renderContentOn: html [

	html form  with: [ 
		html formGroup with: [ 
			html label: 'Nombre: '.
			html textInput formControl readonly: true;  with: recipe name. 
		].
		html formGroup: [ 
			html label: 'Porciones: '.
			html textInput formControl readonly: true;  with: recipe amountOfPortions
		].
		html formGroup: [ 
			html label: 'Ingredientes:'.
			self renderRecipeIngredientTableOn: html. 
		].
		html formGroup: [ 
			html label: 'Proceso:'.
			self renderRecipeStepTableOn: html. 
		]
	
	]
]

{ #category : #rendering }
TBSRecipeView >> renderRecipeIngredientTableOn: html [

	html table
		class: 'table table-hover';
		with: [ 
			html tableHead: [ 
				html tableRow: [ 	
					html tableHeading: 'Ingrediente'.	
					html tableHeading: 'Cantidad'.
					html tableHeading: 'Unidad']].
			html tableBody: [ 
				recipe recipeIngredients do: [ :each | 
				html tableRow: 	[ 
					html tableData: each ingredient name.	
					html tableData: each quantity.
					html tableData: each unit name].
				]]].
]

{ #category : #rendering }
TBSRecipeView >> renderRecipeStepTableOn: html [

	html table
		class: 'table table-hover';
		with: [ 
			html tableHead: [ 
				html tableRow: [ 	
					html tableHeading: 'Paso'.	
					html tableHeading: 'Proceso'.
					html tableHeading: 'Tiempo']].
			html tableBody: [ 
				recipe recipeProcessSteps do: [ :each | 
				html tableRow: 	[ 
					html tableData: each number.	
					html tableData: each process.
					html tableData: each time].
				]]].
]
