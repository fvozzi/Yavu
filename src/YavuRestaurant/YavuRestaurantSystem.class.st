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
YavuRestaurantSystem >> menuCategories [
	
	^ YavuSaleCategory all
]
