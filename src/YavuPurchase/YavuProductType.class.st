Class {
	#name : #YavuProductType,
	#superclass : #YavuEntity,
	#instVars : [
		'category'
	],
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuProductType class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuProductType class >> label [ 

	^ 'Tipo de producto'
]

{ #category : #'as yet unclassified' }
YavuProductType >> addToSystem [

	self yavuSystem purchaseSubsystem addProductType: self
]

{ #category : #accessing }
YavuProductType >> category [ 
	
	^ category 
]

{ #category : #accessing }
YavuProductType >> category: aCategory [
	
	category := aCategory
]

{ #category : #'as yet unclassified' }
YavuProductType >> descriptionSubcategory [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #category;
		label: 'Categoría';
		priority: 140;
		options: YavuCategory all;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #removing }
YavuProductType >> removeFromSystem [
	
	self yavuSystem purchaseSubsystem removeProductType: self
]
