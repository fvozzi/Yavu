Class {
	#name : #YavuRestaurantSystem,
	#superclass : #YavuSystem,
	#category : #'YavuRestaurant-Environment'
}

{ #category : #initialization }
YavuRestaurantSystem class >> initializeSubsystemsForDevelopment [

	self enabledSubsystemsClasses: (Array 
											with: YavuMongoSubsystem 
											with: YavuSecuritySubsystem
											with: YavuPurchaseSubsystem
											with: YavuSaleSubsystem 
											with: YavuAccountingSubsystem
											with: YavuSalarySubsystem)
]

{ #category : #initialization }
YavuRestaurantSystem class >> initializeSubsystemsForProduction [

	self initializeSubsystemsForDevelopment 
]

{ #category : #initialization }
YavuRestaurantSystem class >> initializeSubsystemsForTesting [

	self enabledSubsystemsClasses: (Array 
											with: YavuTransientSubsystem 
											with: YavuSecuritySubsystem
											with: YavuPurchaseSubsystem
											with: YavuSaleSubsystem 
											with: YavuAccountingSubsystem
											with: YavuSalarySubsystem)
]

{ #category : #seaside }
YavuRestaurantSystem class >> registerAntiRecipesApp [
	(WAAdmin
		register: self restaurantApplicationRecipesRoot
		asApplicationAt: self restaurantApplicationRecipes)
		preferenceAt: #sessionClass put: YavuGuestSession;
		preferenceAt: #resourceBaseUrl put: YavuEnvironment current resourceBaseUrl;
		preferenceAt: #maximumRelativeAge put: 28800;
		addLibrary: YavuEnvironment current jqLibrary;
		addLibrary: YavuEnvironment current tbsLibrary;
		addLibrary: YavuEnvironment current fontAwesomeLibrary
]

{ #category : #seaside }
YavuRestaurantSystem class >> registerAntimenuApp [
	(WAAdmin
		register: self restaurantApplicationMenuRoot
		asApplicationAt: self restaurantApplicationMenu)
		preferenceAt: #sessionClass put: YavuGuestSession;
		preferenceAt: #resourceBaseUrl put: YavuEnvironment current resourceBaseUrl;
		preferenceAt: #maximumRelativeAge put: 28800;
		addLibrary: YavuEnvironment current jqLibrary;
		addLibrary: YavuEnvironment current tbsLibrary;
		addLibrary: YavuEnvironment current fontAwesomeLibrary
]

{ #category : #seaside }
YavuRestaurantSystem class >> registerSeasideApplication [

	super registerSeasideApplication.
	self 
		registerAntimenuApp;
		registerAntiRecipesApp 
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem class >> resourceBaseUrlForProduction [

	^ 'https://laesquinadelantigourmet.com.ar'
]

{ #category : #seaside }
YavuRestaurantSystem class >> restaurantApplicationMenu [
	"Devuelve el root para la url del menu."

	^ 'antimenu' 
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem class >> restaurantApplicationMenuRoot [

	^ TBSCustomerMenuView 
]

{ #category : #seaside }
YavuRestaurantSystem class >> restaurantApplicationRecipes [
	"Devuelve el root para la url del menu."

	^ 'recetas' 
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem class >> restaurantApplicationRecipesRoot [

	^ TBSRecipeBookView 
]

{ #category : #subsystemsProtocol }
YavuRestaurantSystem class >> systemMenuElements [

	^ super systemMenuElements 
		add: ((YavuSimpleMenuElement label: 'Menu' presenterClass: TBSCustomerMenuView subsystem: self) id: 3) ;
		add: ((YavuSimpleMenuElement label: 'Menu Admin' presenterClass: TBSCustomerMenuAdminView subsystem: self) id: 4) ;
		add: ((YavuSimpleMenuElement label: 'Imagenes' presenterClass: TBSMenuImageUploadForm subsystem: self) id: 5) ;
		add: ((YavuSimpleMenuElement label: 'Libro de Recetas' presenterClass: TBSRecipeBookView subsystem: self) id: 6) ;
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

{ #category : #'api/queries' }
YavuRestaurantSystem >> kilogramPresentationUnit [
	
	^ self presentationUnits detect: [ :each | each name = 'Kilogramo' ] ifNone: [ self kilogramPresentationUnitDefault ]
]

{ #category : #'as yet unclassified' }
YavuRestaurantSystem >> menuCategories [
	
	^ YavuSaleCategory all
]

{ #category : #'api/queries' }
YavuRestaurantSystem >> presentationUnits [

	^ self storedSubsystem instancesOf: YavuProductPresentationUnit 
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
