Class {
	#name : #YavuSaleSpecialOrderCategory,
	#superclass : #YavuSaleCategory,
	#classVars : [
		'Current'
	],
	#category : #'YavuSale-Entities'
}

{ #category : #accessing }
YavuSaleSpecialOrderCategory class >> current [

	Current ifNil: [ Current := self newSpecialOfferCategory].
	^Current
]

{ #category : #'instance creation' }
YavuSaleSpecialOrderCategory class >> newSpecialOfferCategory [

	^ self new
		name: 'Las Promos de Mati y Jorge';
		order: 0;
		yourself
]

{ #category : #accessing }
YavuSaleSpecialOrderCategory class >> subsystemClass [
	"Hack to no show this class as available."
	^ Smalltalk at: #YavuSubsystem
]

{ #category : #testing }
YavuSaleSpecialOrderCategory >> isSpecialOffer [

	^ true
]

{ #category : #'as yet unclassified' }
YavuSaleSpecialOrderCategory >> price1OfPriceListItem: aPriceListItem [

	^ aPriceListItem specialOfferPrice1
]

{ #category : #'as yet unclassified' }
YavuSaleSpecialOrderCategory >> price2OfPriceListItem: aPriceListItem [

	^ aPriceListItem specialOfferPrice2
]
