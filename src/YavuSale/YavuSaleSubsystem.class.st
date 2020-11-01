Class {
	#name : #YavuSaleSubsystem,
	#superclass : #YavuSubsystem,
	#category : #'YavuSale-Environment'
}

{ #category : #'as yet unclassified' }
YavuSaleSubsystem class >> fontAwesomeClass [
	

	^ 'fa-money'
]

{ #category : #accessing }
YavuSaleSubsystem class >> label [ 

	^ 'Subsistema Ventas'
]

{ #category : #configuration }
YavuSaleSubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		add: ((YavuSimpleMenuElement label: 'Ventas' presenterClass: TBSTransactionsBrowserView subsystem: self) id: 2);
		yourself
]

{ #category : #configuration }
YavuSaleSubsystem class >> subsystemName [

	^ 'Ventas'
]

{ #category : #configuration }
YavuSaleSubsystem class >> subsystemTag [

	 ^'saleSubsystem'
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> activeSaleProducts [
	"Si en algun momento hay muchos productos desactivados se deberia hacer la consulta con fechas a la BD."
	
	^ self saleProducts select: [ :each | each validAt: Date today]
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> allAvailableRecipes [
	
	^ self system purchaseSubsystem allAvailableRecipes
]

{ #category : #'api/queries' }
YavuSaleSubsystem >> decimalAccuracy [

	^ 2
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> invoiceTypes [
	
		^ YavuInvoiceType allSubclasses select: [ :each | each availableForSales ]
]

{ #category : #accessing }
YavuSaleSubsystem >> lastZNumber [

	 ^ 0
]

{ #category : #accessing }
YavuSaleSubsystem >> name [ 

	 ^ 'Ventas'
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> priceListAt: aDate [ 
	
	| currentPriceOfSaleProducts priceOfSaleProducts grouped |
	
	"Reemplazar por una query de vigentes"
	priceOfSaleProducts := self system storedSubsystem instancesOfClass: YavuPriceOfSaleProduct  from: '08/01/2020' asDate to: aDate.
	grouped := priceOfSaleProducts groupedBy: [ :each | each product name, each sizeDescription1 ].
	currentPriceOfSaleProducts := grouped values collect: [:each |
		each asSortedCollection reverse first 
		  ].
	^ YavuPriceList new 
		date: aDate;
		priceListItems: currentPriceOfSaleProducts
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> saleProducts [
	
	^ YavuSaleProduct all
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> salesOfEntity: aYavuBusinessName month: aDate [ 
	
	^ (self system storedSubsystem 
		instancesOfClass: YavuSaleInvoice 
		from: aDate beginOfMonth to: aDate endOfMonth ),
		(self system storedSubsystem 
		instancesOfClass: YavuZLock  
		from: aDate beginOfMonth to: aDate endOfMonth )
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> specialOfferCategory [

	^ YavuSaleSpecialOrderCategory current
]
