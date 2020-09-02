Class {
	#name : #TBSCustomerMenuAdminView,
	#superclass : #TBSCustomerMenuView,
	#category : #'YavuRestaurant-View'
}

{ #category : #initialization }
TBSCustomerMenuAdminView >> activeSaleProducts [
	"Show all the product in order to be a helper for administration."

	^ self yavuSystem saleProducts
]

{ #category : #rendering }
TBSCustomerMenuAdminView >> renderProductActivityButtons: product on: html [

	html row with: [  
	(product validAt: Date today )
		ifTrue: [ html formButton beWarning callback: [ self yavuSystem disableProduct: product] ; with: 'Deshabilitar' ]
		ifFalse: [ html formButton bePrimary callback: [ self yavuSystem enableProduct: product]; with: 'Habilitar' ].
	product isSpecialOffer
		ifTrue: [ html formButton beInfo callback: [ self yavuSystem unsetSpecialOfferOnProduct: product] ; with: 'Quitar Promo'  ]
		ifFalse: [ html formButton beSecondary callback: [ self yavuSystem setSpecialOfferOnProduct: product] ; with: 'Promo'  ]]
]
