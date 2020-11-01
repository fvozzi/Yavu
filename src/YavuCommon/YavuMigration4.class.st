Class {
	#name : #YavuMigration4,
	#superclass : #YavuSystemMigration,
	#category : #'YavuCommon-Migrations'
}

{ #category : #accessing }
YavuMigration4 class >> description [ 

	^ 'Migra los items de lista de precio (YavuPriceListItem) a YavuPriceOfSaleProduct.'
]

{ #category : #accessing }
YavuMigration4 class >> migrationIdentifier [

	 ^ 4
]

{ #category : #'as yet unclassified' }
YavuMigration4 class >> runMigration [

	| priceList |
	
	priceList :=  (self yavuSystem storedSubsystem instancesOf: YavuPriceList) first. 
	priceList priceListItems  do: [ :each | | newPriceOfSaleProduct |
		newPriceOfSaleProduct := YavuPriceOfSaleProduct entity: each product date: '10/01/2020' asDate.
		newPriceOfSaleProduct
			sizeDescription1: each sizeDescription1;
			price1: each price1;
			owner: each owner;
			specialOfferPrice1: each specialOfferPrice1;
			rappiPrice: each rappiPrice;
			unit: each unit.
		self yavuSystem storedSubsystem save: newPriceOfSaleProduct.
		 ].

]
