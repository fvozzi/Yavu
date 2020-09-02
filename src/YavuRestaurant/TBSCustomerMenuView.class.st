Class {
	#name : #TBSCustomerMenuView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'category',
		'categories',
		'activeProductsByCategory',
		'currentPriceList'
	],
	#category : #'YavuRestaurant-View'
}

{ #category : #rendering }
TBSCustomerMenuView class >> canBeRoot [
	^ true
]

{ #category : #rendering }
TBSCustomerMenuView class >> imagePlaceHolderSVG [

	^'<svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://localhost:8081/img/tbsPremium.png" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Image cap"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>'
]

{ #category : #'as yet unclassified' }
TBSCustomerMenuView class >> on: aClass [ 
	
	^ self new
]

{ #category : #accessing }
TBSCustomerMenuView >> activeProductsByCategory [
	^ activeProductsByCategory
]

{ #category : #accessing }
TBSCustomerMenuView >> activeProductsByCategory: anObject [
	activeProductsByCategory := anObject
]

{ #category : #accessing }
TBSCustomerMenuView >> categories [
	^ categories
]

{ #category : #accessing }
TBSCustomerMenuView >> categories: anObject [
	categories := anObject
]

{ #category : #'as yet unclassified' }
TBSCustomerMenuView >> category [
	^ category
]

{ #category : #'as yet unclassified' }
TBSCustomerMenuView >> category: aCategory [ 
	
	category := aCategory 
]

{ #category : #accessing }
TBSCustomerMenuView >> currentPriceList [
	^ currentPriceList
]

{ #category : #accessing }
TBSCustomerMenuView >> currentPriceList: anObject [
	currentPriceList := anObject
]

{ #category : #initialization }
TBSCustomerMenuView >> initialize [ 

	super initialize.
	activeProductsByCategory := self yavuSystem activeSaleProducts asSortedCollection groupedBy: [ :each | each saleProductCategoryOrSpecialOfferCategory].
	categories := activeProductsByCategory keys asSortedCollection: [:a :b | a order < b order].
	category := categories ifNotEmpty: [ :col | col first ].
	currentPriceList := self yavuSystem currentPriceList
]

{ #category : #'as yet unclassified' }
TBSCustomerMenuView >> priceMenuDescriptionOf: aYavuSaleProduct [ 

	| priceListItem priceDescription |

	priceListItem := self currentPriceList priceListItemOf: aYavuSaleProduct.
	priceListItem ifNil: [ ^ 'Precio?. Llamalo a Jorge!' ].
	priceDescription := WriteStream on: String new.
	priceDescription nextPutAll: (priceListItem sizeDescription1, ' $ ', (aYavuSaleProduct saleProductCategoryOrSpecialOfferCategory  price1OfPriceListItem: priceListItem) asString).
	priceListItem sizeDescription2 notNil ifTrue: [ 
		priceDescription nextPutAll: (' | ', priceListItem sizeDescription2, ' $ ', (aYavuSaleProduct saleProductCategoryOrSpecialOfferCategory price2OfPriceListItem: priceListItem) asString)].
	^ priceDescription contents
	
]

{ #category : #rendering }
TBSCustomerMenuView >> renderContentOn: html [

	html containerFluid: [ 
			html column mediumSize: 12; smallSize: 12; marginBottom: 1; with: [ self renderMenuImageHeaderOn: html ].
		self renderMenuAccordionOn: html 
			 ].
	

]

{ #category : #rendering }
TBSCustomerMenuView >> renderMenuAccordionOn: html [

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
TBSCustomerMenuView >> renderMenuImageHeaderOn: html [

	| image |
	
	html div 
		id: #imageMenuLogo;
		with: [ 
			image := 	html imageFluid.
			image width: '100%'; resourceUrl: 'img/' , 'logoEsquina.png'.
			image attributes at: 'max-width' put: '600px']
]

{ #category : #rendering }
TBSCustomerMenuView >> renderMenuOn: html [
	| products columnsPerRow amountOfrows index columnSize |
	products := self activeProductsByCategory at: self category.
	columnsPerRow := 4.
	columnSize := 12 // columnsPerRow.
	amountOfrows := products size // columnsPerRow.
	products size \\ columnsPerRow > 0
		ifTrue: [ amountOfrows := amountOfrows + 1 ].
	1 to: amountOfrows do: [ :rowIndex | 
		html row: [ 
		1 to: columnsPerRow do: [ :colIndex | 
			| product offset |
			offset := (rowIndex - 1) * columnsPerRow.
			product := products at: colIndex + offset ifAbsent: [ ].
			product notNil ifTrue: [ 
				html column mediumSize: columnSize; smallSize: 12; with: [
				self renderProductCard: product on: html  ]
			] ]]]
]

{ #category : #rendering }
TBSCustomerMenuView >> renderMenuOn: html category: each [ 
		
		self category: each.
		self renderMenuOn: html
	
]

{ #category : #rendering }
TBSCustomerMenuView >> renderProductCard: product on: html [
	^ html card
		style: 'width: 16.3rem;';
		with: [ html cardImage resourceUrl: 'img/baja/' , product imageName.
			html
				cardBody: [ html cardTitle level5 with: product name.
					html cardSubtitle
						level6;
						mutedText;
						with: product subtitle.
					html cardText: product description.
					html cardSubtitle
						level6;
						with: (self priceMenuDescriptionOf: product) ] ]
]

{ #category : #hooks }
TBSCustomerMenuView >> style [

	^ '#imageMenuLogo {
			width: 100%;
  			max-width: 600px;
		}'
]

{ #category : #updating }
TBSCustomerMenuView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
	anHtmlRoot meta
        name: 'viewport';
        content: 'width=device-width, initial-scale=1.0'.
	anHtmlRoot title: 'La esquina del Antigourmet'
]
