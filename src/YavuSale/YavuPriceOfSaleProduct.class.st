Class {
	#name : #YavuPriceOfSaleProduct,
	#superclass : #YavuTransaction,
	#instVars : [
		'sizeDescription1',
		'price1',
		'owner',
		'specialOfferPrice1',
		'rappiPrice',
		'unit'
	],
	#category : #'YavuSale-DomainObjects'
}

{ #category : #'sin categoria' }
YavuPriceOfSaleProduct class >> entityClass [ 

	^ YavuSaleProduct 
]

{ #category : #testing }
YavuPriceOfSaleProduct class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuPriceOfSaleProduct class >> label [ 

	^ 'Precio de Producto de Venta'
]

{ #category : #accessing }
YavuPriceOfSaleProduct class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #descriptions }
YavuPriceOfSaleProduct >> descriptionPrice1 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #price1;
			beRequired;
        	label: 'Precio';
        	priority: 120;
        	yourself
]

{ #category : #descriptions }
YavuPriceOfSaleProduct >> descriptionRappi [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #rappiPrice;
        	label: 'Precio Rappi';
        	priority: 160;
        	yourself
]

{ #category : #descriptions }
YavuPriceOfSaleProduct >> descriptionSizeDescription1 [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #sizeDescription1;
      label: 'Descripción';
      	priority: 110;
		componentClass: TBSMagritteTextInputComponent;
		beRequired;
      	yourself
]

{ #category : #descriptions }
YavuPriceOfSaleProduct >> descriptionSpecialOfferPrice1 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #specialOfferPrice1;
			beRequired;
        	label: 'Precio PROMO';
        	priority: 125;
        	yourself
]

{ #category : #descriptions }
YavuPriceOfSaleProduct >> descriptionUnit [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #unit;
		default: self yavuSystem kilogramPresentationUnit;
		options: self yavuSystem presentationUnits;
		label: 'Unidad';
		priority: 120;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #initialization }
YavuPriceOfSaleProduct >> initializeOwner: aPriceList [

	owner := aPriceList 
]

{ #category : #descriptions }
YavuPriceOfSaleProduct >> mementoClass [

	^MAStraightMemento
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> owner [
	^ owner
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> owner: aOwner [
	
	owner:= aOwner
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> price1 [
	^ price1
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> price1: anObject [
	price1 := anObject
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> product [
	^ self entity
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> rappiPrice [
	^ rappiPrice
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> rappiPrice: anObject [
	rappiPrice := anObject
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> sizeDescription1 [
	^ sizeDescription1
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> sizeDescription1: anObject [
	sizeDescription1 := anObject
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> specialOfferPrice1 [
	^ specialOfferPrice1
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> specialOfferPrice1: anObject [
	specialOfferPrice1 := anObject
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> unit [
	^ unit
]

{ #category : #accessing }
YavuPriceOfSaleProduct >> unit: anObject [
	unit := anObject
]
