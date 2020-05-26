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

{ #category : #'magritte-descriptions' }
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

	quantity := 0.
	unitPrice := 0
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

{ #category : #'magritte-descriptions' }
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

{ #category : #'magritte-descriptions' }
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

{ #category : #'magritte-descriptions' }
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

{ #category : #'magritte-descriptions' }
YavuPurchaseTransactionItem >> subtotalDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #subtotal;
			beReadonly;
        	label: 'Precio Neto';
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

{ #category : #'magritte-descriptions' }
YavuPurchaseTransactionItem >> unitPriceDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #unitPriceAfterTaxs;
        	label: 'Precio U. + Iva';
        	priority: 125;
			beRequired;
			bePositive;
        	yourself
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> vatPercentage [

	vatPercentage ifNil: [ self initializeVatPercentage].
	^ vatPercentage 
]
