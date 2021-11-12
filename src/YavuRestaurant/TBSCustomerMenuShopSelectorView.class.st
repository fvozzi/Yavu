Class {
	#name : #TBSCustomerMenuShopSelectorView,
	#superclass : #WAYavuBootstrap,
	#category : #'YavuRestaurant-View'
}

{ #category : #testing }
TBSCustomerMenuShopSelectorView class >> canBeRoot [
	^ true
]

{ #category : #'instance creation' }
TBSCustomerMenuShopSelectorView class >> on: aClass [

	^ self new
]

{ #category : #rendering }
TBSCustomerMenuShopSelectorView >> renderContentOn: html [ 

	html heading: '¿Estás en el Clú o en La Esquina?'.
	html form: [ 
		self yavuSystem shops do: [ :eachShop | 
			| image |
			html div 
			class: 'imageMenuLogo' ;
			with: [ 
				image := 	html imageButton .
				image width: '100%'; resourceUrl: 'img/' , eachShop logoImageName.
				image attributes at: 'max-width' put: '200px'.
				image callback: [
					self call: (TBSCustomerMenuView on: eachShop)
			 ].

			]
		]
	]
]

{ #category : #hooks }
TBSCustomerMenuShopSelectorView >> style [

	^ '.imageMenuLogo {
			width: 100%;
  			max-width: 300px;
			border-bottom-style: solid;
			height: 300px;
			  display: flex;
  			justify-content: center;
  			align-items: center;
		}
		
		'
]
