Class {
	#name : #YavuSaleCategory,
	#superclass : #YavuEntity,
	#instVars : [
		'order'
	],
	#category : #'YavuSale-Entities'
}

{ #category : #testing }
YavuSaleCategory class >> isVoyageRoot [ 

	^ true
]

{ #category : #'sin categoria' }
YavuSaleCategory class >> label [ 

	 ^ 'Categoria Producto de Venta'
]

{ #category : #accessing }
YavuSaleCategory class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #'as yet unclassified' }
YavuSaleCategory >> descriptionOrder [

	<magritteDescription>
	^MANumberDescription new 
      accessor: #order;
      label: 'Orden';
      	priority: 140;
		beRequired;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #testing }
YavuSaleCategory >> isSpecialOffer [

	^ false
]

{ #category : #accessing }
YavuSaleCategory >> order [
	order ifNil: [ order := 1 ].
	^ order
]

{ #category : #accessing }
YavuSaleCategory >> order: anObject [
	order := anObject
]

{ #category : #'as yet unclassified' }
YavuSaleCategory >> price1OfPriceListItem: aPriceListItem [

	^ aPriceListItem price1
]

{ #category : #'as yet unclassified' }
YavuSaleCategory >> price2OfPriceListItem: aPriceListItem [

	^ aPriceListItem price2
]
