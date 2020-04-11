Class {
	#name : #YavuProduct,
	#superclass : #YvEntity,
	#instVars : [
		'brand',
		'productType'
	],
	#category : #'YavuPurchase-Entities'
}

{ #category : #accessing }
YavuProduct >> category [

	 ^ self productType category
]

{ #category : #descriptions }
YavuProduct >> descriptionBrand [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #brand;
		label: 'Marca';
		priority: 120;
		options: YvBrand allInstances;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuProduct >> descriptionName [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #name;
		label: 'Nombre';
		priority: 100;
		visible: false;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuProduct >> descriptionProductType [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #productType;
		label: 'Tipo';
		priority: 130;
		options: YavuProductType allInstances;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #'sin categoria' }
YavuProduct >> name [ 

	^ (self productType notNil & self brand notNil) 
		ifTrue: [ self productType name, self brand name ]
		ifFalse: [ '' ]
]

{ #category : #accessing }
YavuProduct >> productType [

	 ^ productType
]
