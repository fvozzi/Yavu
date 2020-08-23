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
	activeProductsByCategory := self yavuSystem activeSaleProducts asSortedCollection groupedBy: [ :each | each saleProductCategory].
	categories := activeProductsByCategory keys asSortedCollection.
	category := categories ifNotEmpty: [ :col | col first ].
	currentPriceList := self yavuSystem currentPriceList
]

{ #category : #'as yet unclassified' }
TBSCustomerMenuView >> priceMenuDescriptionOf: aYavuSaleProduct [ 

	| priceListItem priceDescription |

	priceListItem := self currentPriceList priceListItemOf: aYavuSaleProduct.
	priceListItem ifNil: [ ^ 'Precio?. Preguntale al Tibu!' ].
	priceDescription := WriteStream on: String new.
	priceDescription nextPutAll: (priceListItem sizeDescription1, ' $ ', priceListItem price1 asString).
	priceListItem sizeDescription2 notNil ifTrue: [ 
		priceDescription nextPutAll: (' | ', priceListItem sizeDescription2, ' $ ', priceListItem price2 asString)].
	^ priceDescription contents
	
]

{ #category : #rendering }
TBSCustomerMenuView >> renderContentOn: html [

	html break.
	html form: [ 
	html containerFluid: [ 
		html row: [ 
			html column mediumSize: 12; smallSize: 12; marginBottom: 1; with: [ self renderMenuImageHeaderOn: html ]].
		html row: [ 
			html column mediumSize: 2; smallSize: 12; with: [ self renderMenuCategoriesOn: html ].
			html column mediumSize: 10; smallSize: 12; with: [ self renderMenuOn: html ].
			 ].
	
		 ] ]
]

{ #category : #rendering }
TBSCustomerMenuView >> renderMenuCategoriesOn: html [

	html
		listGroup: [ 
			self categories do: [ :each | | item |
				item := html listGroupLinkedItem.
				self category = each ifTrue: [ item beActive ].
				item
					callback: [ self category: each];
					with: each name.
				
				 ]
		 ]
]

{ #category : #rendering }
TBSCustomerMenuView >> renderMenuImageHeaderOn: html [
	^ html  
		imageFluid 
		floatRight;
		resourceUrl: 'img/' , 'logoEsquina.png' 
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
TBSCustomerMenuView >> renderProductCard: product on: html [
	^ html card
		style: 'width: 16.3rem;';
		with: [ html cardImage resourceUrl: 'img/' , product imageName.
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

{ #category : #rendering }
TBSCustomerMenuView >> renderResenasBannerOn: html [ 

	html carousel 
		id: 'example';
		slide; 
		style: 'width: 36rem;';
		with:[ 
		html carouselInner: [
			html carouselItem active with: [ 
				html cardImage resourceUrl: 'img/laTarzanDeCastelar.jpg'.
				html text: 'Mamma Silvia'.
				html anchor: 'https://antigourmet.com.ar/la-tarzan-de-castelar/' ].
			html carouselItem with: [ 
				html text: 'Cantina Palermo' ].					
		].		
		html carouselControlPreviousFor: 'example'.	
		html carouselControlNextFor: 'example'. 	
	].
	html script: '$(".carousel").carousel()'
]
