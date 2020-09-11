Class {
	#name : #YavuPriceList,
	#superclass : #YavuTransaction,
	#instVars : [
		'priceListItems'
	],
	#category : #'YavuSale-DomainObjects'
}

{ #category : #'sin categoria' }
YavuPriceList class >> entityClass [
	
	^ Smalltalk at: #YavuBusinessName 
]

{ #category : #testing }
YavuPriceList class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuPriceList class >> label [ 

	^ 'Lista de Precios'
]

{ #category : #accessing }
YavuPriceList class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #descriptions }
YavuPriceList >> descriptionPurchaseTransactionItems [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAToManyRelationDescription new
		accessor: #priceListItems;
		classes: (OrderedCollection with: YavuPriceListItem);
		default: nil;
		label: 'Items de Lista de Precio';
		priority: 120;
		beRequired;
		componentClass: TBSMagritteOneToManyComponent;
		canExport: false;
		yourself
]

{ #category : #initialization }
YavuPriceList >> initialize [ 

	super initialize.
	priceListItems  := OrderedCollection new 
]

{ #category : #descriptions }
YavuPriceList >> mementoClass [

	^ MAStraightMemento
]

{ #category : #'as yet unclassified' }
YavuPriceList >> priceListItemOf: aProduct [ 
	
	^ self priceListItems detect: [ :each | each product = aProduct ] ifNone: [ ]
]

{ #category : #accessing }
YavuPriceList >> priceListItems [
	^ priceListItems
]

{ #category : #accessing }
YavuPriceList >> priceListItems: anObject [
	priceListItems := anObject
]

{ #category : #'as yet unclassified' }
YavuPriceList >> priceListItemsOf: aProduct [ 
	
	^ self priceListItems select: [ :each | each product = aProduct ]
]
