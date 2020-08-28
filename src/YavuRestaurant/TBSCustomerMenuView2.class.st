Class {
	#name : #TBSCustomerMenuView2,
	#superclass : #TBSCustomerMenuView,
	#category : #'YavuRestaurant-View'
}

{ #category : #rendering }
TBSCustomerMenuView2 >> renderContentOn: html [

	html containerFluid: [ 
			html column mediumSize: 12; smallSize: 12; marginBottom: 1; with: [ self renderMenuImageHeaderOn: html ].
		self renderMenuAccordionOn: html 
			 ].
	

]

{ #category : #rendering }
TBSCustomerMenuView2 >> renderMenuAccordionOn: html [

	| first |
	
	first := true.
	html div
		id: 'accordion';
		with: [ 
	self categories
		doWithIndex: [ :eachCategory :index| 
			html card: [ 
				html cardHeader
		id: 'heading' , index asString;
		with: [ html heading
				level: 5;
				class: 'mb-0';
				with: [ html formButton
						beLink;
						dataToggle: 'collapse';
						dataTarget: '#collapse' , index asString;
						attributeAt: 'aria-expanded' put: 'true';
						attributeAt: 'aria-controls' put: 'collapse', index asString;
						with: eachCategory name ] ].
				html div 	
					id: 'collapse', index asString;
					class: 'collapse';
					attributeAt: 'aria-labelledby' put: 'heading', index asString;
					attributeAt: 'data-parent' put: '#accordion';
					with: [ 
						html cardBody: [ 
							self renderMenuOn: html category: eachCategory
							 ] ]
				
				
				] ]]
]

{ #category : #rendering }
TBSCustomerMenuView2 >> renderMenuOn: html category: each [ 
		
		self category: each.
		self renderMenuOn: html
	
]

{ #category : #hooks }
TBSCustomerMenuView2 >> style [

	^ '#imageMenuLogo {
			width: 100%;
  			max-width: 600px;
		}'
]

{ #category : #updating }
TBSCustomerMenuView2 >> updateRoot: anHtmlRoot [

    super updateRoot: anHtmlRoot.
    anHtmlRoot meta
        name: 'viewport';
        content: 'width=device-width, initial-scale=1.0'
]
