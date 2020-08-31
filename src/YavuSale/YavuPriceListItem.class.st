Class {
	#name : #YavuPriceListItem,
	#superclass : #YavuObject,
	#instVars : [
		'product',
		'sizeDescription1',
		'price1',
		'sizeDescription2',
		'price2',
		'owner',
		'specialOfferPrice1',
		'specialOfferPrice2',
		'rappiPrice'
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
        	label: 'Precio tamaño 1';
        	priority: 120;
        	yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionPrice2 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #price2;
        	label: 'Precio tamaño 2';
        	priority: 140;
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
      label: 'Descripción tamaño 1';
      	priority: 110;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionSizeDescription2 [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #sizeDescription2;
      label: 'Descripción tamaño 2';
      	priority: 130;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionSpecialOfferPrice1 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #specialOfferPrice1;
			beRequired;
        	label: 'Precio PROMO tamaño 1';
        	priority: 125;
        	yourself
]

{ #category : #descriptions }
YavuPriceListItem >> descriptionSpecialOfferPrice2 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #specialOfferPrice2;
        	label: 'Precio PROMO tamaño 2';
        	priority: 145;
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
YavuPriceListItem >> price2 [
	^ price2
]

{ #category : #accessing }
YavuPriceListItem >> price2: anObject [
	price2 := anObject
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
YavuPriceListItem >> sizeDescription2 [
	^ sizeDescription2
]

{ #category : #accessing }
YavuPriceListItem >> sizeDescription2: anObject [
	sizeDescription2 := anObject
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
YavuPriceListItem >> specialOfferPrice2 [
	^ specialOfferPrice2
]

{ #category : #accessing }
YavuPriceListItem >> specialOfferPrice2: anObject [
	specialOfferPrice2 := anObject
]
