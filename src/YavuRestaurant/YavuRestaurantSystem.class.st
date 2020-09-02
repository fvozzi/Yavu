Class {
	#name : #YavuRestaurantSystem,
	#superclass : #YavuSystem,
	#category : #'YavuRestaurant-Environment'
}

{ #category : #'as yet unclassified' }
YavuRestaurantSystem class >> fontAwesomeClass [

	^ 'fa-beer'
]

{ #category : #subsystemsProtocol }
YavuRestaurantSystem class >> systemMenuElements [

	^ super systemMenuElements 
		add: ((YavuSimpleMenuElement label: 'Menu' presenterClass: TBSCustomerMenuView subsystem: self) id: 3) ;
		add: ((YavuSimpleMenuElement label: 'Menu Admin' presenterClass: TBSCustomerMenuAdminView subsystem: self) id: 4) ;
		yourself
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem class >> systemName [
	
	^ 'YavuRestaurant'
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> activeSaleProducts [
	
	^ self saleSubsystem activeSaleProducts 
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> currentPriceList [
	
	^ self saleSubsystem priceListAt: Date today 
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> disableProduct: aSaleProduct [

	^ aSaleProduct 
		validEndDate: (Date yesterday );
		addToSystem
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> enableProduct: aSaleProduct [

	^ aSaleProduct 
		validEndDate: nil;
		addToSystem
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> menuCategories [
	
	^ YavuSaleCategory all
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> saleProducts [
	
	^ self saleSubsystem saleProducts 
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> setSpecialOfferOnProduct: aSaleProduct [

	^ aSaleProduct 
		isSpecialOffer:  true;
		addToSystem
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> unsetSpecialOfferOnProduct: aSaleProduct [

	^ aSaleProduct 
		isSpecialOffer:  false;
		addToSystem
]
