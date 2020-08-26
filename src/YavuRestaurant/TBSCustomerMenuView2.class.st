Class {
	#name : #TBSCustomerMenuView2,
	#superclass : #TBSCustomerMenuView,
	#category : #'YavuRestaurant-View'
}

{ #category : #rendering }
TBSCustomerMenuView2 >> renderContentOn: html [

	html break.
	"html form: [ "
	html containerFluid: [ 
		html row: [ 
			html column mediumSize: 12; smallSize: 12; with: [ self renderMenuAccordionOn: html ].
			 ].
	
		 ]" ]"
]

{ #category : #rendering }
TBSCustomerMenuView2 >> renderMenuAccordionOn: html [

	| first |
	
	first := true.
	html div
		id: 'accordion';
		with: [ 
	self categories
		do: [ :eachCategory | 
			html card: [ 
				self renderMenuCategoryHeaderOf: eachCategory on: html.
				html div 	
					id: 'collapse', eachCategory name;
					class: 'collapse';
					attributeAt: 'aria-labelledby' put: 'heading', eachCategory name;
					attributeAt: 'data-parent' put: '#accordion';
					with: [ 
						html cardBody: [ 
							self renderMenuOn: html category: eachCategory
							 ] ]
				
				
				] ]]
]

{ #category : #rendering }
TBSCustomerMenuView2 >> renderMenuCategoriesOn: html [

			self categories do: [ :each | 
			html paragraph: [ 
				html formButton bePrimary  
					dataToggle: 'collapse';
					dataTarget: '#collapse', each name;
					callback: [ self category: each ];
					with: each name].
			html collapse show 
				id: 'collapse', each name;
				with: [self renderMenuOn: html category: each ] 
				
				 ]
		 
	
]

{ #category : #rendering }
TBSCustomerMenuView2 >> renderMenuCategoryHeaderOf: each on: html [
	^ html cardHeader
		id: 'heading' , each name;
		with: [ html heading
				level: 5;
				class: 'mb-0';
				with: [ html formButton
						beLink;
						dataToggle: 'collapse';
						dataTarget: '#collapse' , each name;
						attributeAt: 'aria-expanded' put: 'true';
						attributeAt: 'aria-controls' put: 'collapseOne';
						with: each name ] ]
]

{ #category : #rendering }
TBSCustomerMenuView2 >> renderMenuOn: html category: each [ 
		
		self category: each.
		self renderMenuOn: html
	
]
