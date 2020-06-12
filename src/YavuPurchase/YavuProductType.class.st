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

{ #category : #accessing }
YavuProductType class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #accessing }
YavuProductType >> category [ 
	
	^ category 
]

{ #category : #accessing }
YavuProductType >> category: aCategory [
	
	category := aCategory
]

{ #category : #descriptions }
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
