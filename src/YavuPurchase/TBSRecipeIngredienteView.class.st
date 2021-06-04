Class {
	#name : #TBSRecipeIngredienteView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'recipeIngredientsDropDown',
		'identifiedView'
	],
	#category : #'YavuPurchase-View'
}

{ #category : #accessing }
TBSRecipeIngredienteView >> componentSupplier [

	^ Bootstrap4ComponentSupplier online
]

{ #category : #initialization }
TBSRecipeIngredienteView >> initialize [ 

	self 
		initializeIdentifiedView;
		initializeRecipeIngredientesDropdown 
]

{ #category : #initialization }
TBSRecipeIngredienteView >> initializeIdentifiedView [

	identifiedView := IdentifiedWebView
		forDivNamed: 'behavior-selection'
		containing: [ :canvas | ]
]

{ #category : #initialization }
TBSRecipeIngredienteView >> initializeRecipeIngredientesDropdown [

	recipeIngredientsDropDown := self componentSupplier
		dropdownListApplying:
			[ :dropdown | ( dropdown labelItemsWith: [ :package | package name ] ) + BootstrapSelectLiveSearchCommand default ].
	recipeIngredientsDropDown onTrigger
		evaluate: [ recipeIngredientsDropDown
				withCurrentSelectionDo: [ :ingredientSelected | self setSelectedPackageTo: ingredientSelected ]
			];
		render: identifiedView 
]

{ #category : #rendering }
TBSRecipeIngredienteView >> recipeIngredients [
		
	^ (Array 
		with: 'Carne Picada'
		with: 'Tapa de empanada'
		with: 'Cebolla') asSortedCollection 
]

{ #category : #rendering }
TBSRecipeIngredienteView >> renderContentOn: html [
	html
		render:
			(self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent:
					(self componentSupplier
						fieldSetContaining:
							(self componentSupplier
								delayedViewShowing: SpinKitCircle new
								whileEvaluating: [ recipeIngredientsDropDown allowAnyOf: self recipeIngredients ]
								thenRendering: recipeIngredientsDropDown)
						applying: [  ]
						withLegend: 'Packages'
						applying: [  ]);
				addContent: [ :canvas | canvas horizontalRule ])
]

{ #category : #rendering }
TBSRecipeIngredienteView >> search [
]
