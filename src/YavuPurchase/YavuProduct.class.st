Class {
	#name : #YavuProduct,
	#superclass : #YavuEntity,
	#instVars : [
		'brand',
		'productType',
		'vatPercentage'
	],
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuProduct class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuProduct class >> label [ 

	 ^ 'Producto'
]

{ #category : #crud }
YavuProduct >> addToSystem [
	self subsystem addProduct: self
]

{ #category : #accessing }
YavuProduct >> brand [

	 ^ brand
]

{ #category : #accessing }
YavuProduct >> brand: aBrand [

	 brand := aBrand
]

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
		options: YavuBrand all;
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
		options: YavuProductType all;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuProduct >> descriptionVatPercentage [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MANumberDescription new 
		accessor: #vatPercentage ;
		label: 'IVA';
		priority: 140;
		beRequired;
		bePositive;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'sin categoria' }
YavuProduct >> initialize [ 

	super initialize.
	vatPercentage := self yavuSystem purchaseSubsystem vatPercentageDefault
]

{ #category : #'sin categoria' }
YavuProduct >> name [ 

	^ (self productType notNil & self brand notNil) 
		ifTrue: [ self productType name, ' ', self brand name ]
		ifFalse: [ '' ]
]

{ #category : #accessing }
YavuProduct >> productType [

	 ^ productType
]

{ #category : #accessing }
YavuProduct >> productType: aProductType [

	 productType := aProductType
]

{ #category : #crud }
YavuProduct >> removeFromSystem [
	
	self yavuSystem purchaseSubsystem removeProduct: self
]

{ #category : #environment }
YavuProduct >> subsystem [
	^ self yavuSystem purchaseSubsystem
]

{ #category : #accessing }
YavuProduct >> vatCondition: anInteger [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
YavuProduct >> vatPercentage [
	^ vatPercentage
]

{ #category : #accessing }
YavuProduct >> vatPercentage: anInteger [ 
	vatPercentage := anInteger
]
