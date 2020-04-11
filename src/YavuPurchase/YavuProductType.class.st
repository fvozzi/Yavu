Class {
	#name : #YavuProductType,
	#superclass : #YvEntity,
	#instVars : [
		'category'
	],
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuProductType class >> isVoyageRoot [

	 ^true 
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
		options: YvCategory allInstances;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]
