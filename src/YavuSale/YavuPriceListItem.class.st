Class {
	#name : #YavuPriceListItem,
	#superclass : #YavuObject,
	#instVars : [
		'product',
		'sizeDescription1',
		'price1',
		'sizeDescription2',
		'price2',
		'owner'
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
			beRequired;
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
