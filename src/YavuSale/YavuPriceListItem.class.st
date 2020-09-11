Class {
	#name : #YavuPriceListItem,
	#superclass : #YavuObject,
	#instVars : [
		'product',
		'sizeDescription1',
		'price1',
		'owner',
		'specialOfferPrice1',
		'rappiPrice',
		'unit'
	],
	#category : #'YavuSale-DomainObjects'
}

{ #category : #accessing }
YavuPriceListItem class >> label [ 

	^ 'Item de Lista de Precio'
]

{ #category : #accessing }
YavuPriceListItem class >> owner: aYavuPriceList [ 
	
	^ self new initializeOwner: aYavuPriceList 
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionPrice1 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #price1;
			beRequired;
        	label: 'Precio';
        	priority: 120;
        	yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionProduct [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #product;
		default: nil;
		options: YavuSaleProduct all;
		label: YavuSaleProduct label;
		priority: 100;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionRappi [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #rappiPrice;
        	label: 'Precio Rappi';
        	priority: 160;
        	yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionSizeDescription1 [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #sizeDescription1;
      label: 'Descripción';
      	priority: 110;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionSpecialOfferPrice1 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #specialOfferPrice1;
			beRequired;
        	label: 'Precio PROMO';
        	priority: 125;
        	yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionUnit [

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
YavuPriceListItem >> initializeOwner: aPriceList [

	owner := aPriceList 
]

{ #category : #descriptions }
YavuPriceListItem >> mementoClass [

	^MAStraightMemento
]

{ #category : #accessing }
YavuPriceListItem >> owner [
	^ owner
]

{ #category : #accessing }
YavuPriceListItem >> owner: aOwner [
	
	owner:= aOwner
]

{ #category : #accessing }
YavuPriceListItem >> price1 [
	^ price1
]

{ #category : #accessing }
YavuPriceListItem >> price1: anObject [
	price1 := anObject
]

{ #category : #accessing }
YavuPriceListItem >> product [
	^ product
]

{ #category : #accessing }
YavuPriceListItem >> product: anObject [
	product := anObject
]

{ #category : #accessing }
YavuPriceListItem >> rappiPrice [
	^ rappiPrice
]

{ #category : #accessing }
YavuPriceListItem >> rappiPrice: anObject [
	rappiPrice := anObject
]

{ #category : #accessing }
YavuPriceListItem >> sizeDescription1 [
	^ sizeDescription1
]

{ #category : #accessing }
YavuPriceListItem >> sizeDescription1: anObject [
	sizeDescription1 := anObject
]

{ #category : #accessing }
YavuPriceListItem >> specialOfferPrice1 [
	^ specialOfferPrice1
]

{ #category : #accessing }
YavuPriceListItem >> specialOfferPrice1: anObject [
	specialOfferPrice1 := anObject
]

{ #category : #accessing }
YavuPriceListItem >> unit [
	^ unit
]

{ #category : #accessing }
YavuPriceListItem >> unit: anObject [
	unit := anObject
]
