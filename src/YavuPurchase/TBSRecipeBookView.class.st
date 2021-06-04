Class {
	#name : #TBSRecipeBookView,
	#superclass : #WAYavuBootstrap,
	#category : #'YavuPurchase-View'
}

{ #category : #testing }
TBSRecipeBookView class >> canBeRoot [
	^ true
]

{ #category : #'instance creation' }
TBSRecipeBookView class >> on: aClass [ 
	
	^ self new
]

{ #category : #rendering }
TBSRecipeBookView >> addRecipe [

	self call: TBSRecipeView new
]

{ #category : #rendering }
TBSRecipeBookView >> renderContentOn: html [
	html form: [ 
		
		html 
		containerFluid: [ html column
				mediumSize: 12;
				smallSize: 12;
				marginBottom: 1;
				with: [ self renderLogoImageHeaderOn: html ].
			html break.
			html table
				class: 'table table-hover';
				with: [ html tableHead: [ html tableRow: [ html tableHeading: 'Recetas' ] ].
					html
						tableBody: [ self yavuSystem purchaseSubsystem recipes asSortedCollection
								do: [ :eachRecipe | 
									html
										tableRow: [ html
												tableData: [ html formButton
														beLink;
														callback: [ self showRecipe: eachRecipe ];
														with: eachRecipe name ] ] ] ] ] ]]
]

{ #category : #rendering }
TBSRecipeBookView >> renderLogoImageHeaderOn: html [

	| image |
	
	html div 
		id: #imageMenuLogo;
		with: [ 
			image := 	html imageFluid.
			image width: '100%'; resourceUrl: 'img/' , 'logoEsquina.png'.
			image attributes at: 'max-width' put: '600px']
]

{ #category : #rendering }
TBSRecipeBookView >> showRecipe: aRecipe [ 

	self call: (TBSRecipeView withRecipe: aRecipe)
]

{ #category : #hooks }
TBSRecipeBookView >> style [

	^ '#imageMenuLogo {
			width: 100%;
  			max-width: 600px;
		}'
]
