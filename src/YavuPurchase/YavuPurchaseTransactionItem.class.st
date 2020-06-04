Class {
	#name : #YavuPurchaseTransactionItem,
	#superclass : #YavuObject,
	#instVars : [
		'quantity',
		'unitPrice',
		'product',
		'description',
		'vatPercentage',
		'unitPriceAfterTaxs'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #accessing }
YavuPurchaseTransactionItem >> description [  
	
	^ description
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> description: aDescription [ 
	
	description := aDescription 
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> descriptionDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new
		accessor: #description;
		priority: 105;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #initialization }
YavuPurchaseTransactionItem >> initialize [ 

	quantity := unitPrice := unitPriceAfterTaxs := 0
	
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> initializeVatPercentage [

	vatPercentage :=
		product 
			ifNil: [  self yavuSystem purchaseSubsystem vatPercentageDefault ]
			ifNotNil: [ :selectedProduct | selectedProduct vatPercentage ]

]

{ #category : #accessing }
YavuPurchaseTransactionItem >> name [ 

	^ 'item'
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> name: aName [

	^ 'item'
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> onUnitPriceAfterTaxsChanged [
	
	unitPrice := unitPriceAfterTaxs / (1 + (self vatPercentage / 100))
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> onUnitPriceChanged [
	
	unitPriceAfterTaxs := unitPrice + (unitPrice * self vatPercentage / 100)
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> product [ 
	
	^ product
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> product: aYavuProduct [ 
	
	product := aYavuProduct.
	self initializeVatPercentage 
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> productDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #product;
		default: nil;
		options: YavuProduct all;
		label: YavuProduct label;
		priority: 100;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> quantity [
	^ quantity
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> quantity: anInteger [ 
	quantity := anInteger
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> quantityDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #quantity;
        	label: 'Cantidad';
        	priority: 110;
			beRequired;
			bePositive;
			min: 0.1;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> subtotal [
	
	^ self quantity * self unitPrice
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> subtotalAfterTaxs [
	
	^ self quantity * self unitPriceAfterTaxs
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> subtotalAfterTaxsDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #subtotalAfterTaxs;
			beReadonly;
        	label: 'Subotal + Iva';
        	priority: 140;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> subtotalDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #subtotal;
			beReadonly;
        	label: 'Subtotal';
        	priority: 130;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> unitPrice [
	^ unitPrice
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> unitPrice: anInteger [ 
	unitPrice := anInteger.
	self onUnitPriceChanged
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> unitPriceAfterTaxs [
	^ unitPriceAfterTaxs 
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> unitPriceAfterTaxs: aValue [
	
	unitPriceAfterTaxs := aValue.
	self onUnitPriceAfterTaxsChanged 
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> unitPriceAfterTaxsDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #unitPriceAfterTaxs;
        	label: 'P. Uunitario + Iva';
        	priority: 125;
			beRequired;
			bePositive;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> unitPriceDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #unitPrice;
        	label: 'P. Unitario';
        	priority: 120;
			beRequired;
			bePositive;
        	yourself
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> vatPercentage [

	vatPercentage ifNil: [ self initializeVatPercentage].
	^ vatPercentage 
]
