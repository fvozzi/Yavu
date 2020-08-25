Class {
	#name : #YavuPurchaseTransactionItem,
	#superclass : #YavuObject,
	#instVars : [
		'quantity',
		'unitPrice',
		'product',
		'description',
		'vatPercentage',
		'unitPriceAfterTaxs',
		'presentationUnit',
		'owner'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #accessing }
YavuPurchaseTransactionItem class >> label [ 

	^ 'Item de Compra'
]

{ #category : #'as yet unclassified' }
YavuPurchaseTransactionItem class >> owner: aYavuPurchaseTransaction [ 
	
	^ self new initializeOwner: aYavuPurchaseTransaction 
]

{ #category : #accessing }
YavuPurchaseTransactionItem class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

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

{ #category : #descriptions }
YavuPurchaseTransactionItem >> descriptionPresentationUnit [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #presentationUnit;
		default: self subsystem kilogramPresentationUnit;
		options: self subsystem presentationUnits;
		label: 'Unidad Presentación';
		priority: 115;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> descriptionProduct [
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

{ #category : #descriptions }
YavuPurchaseTransactionItem >> descriptionQuantity [

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

{ #category : #descriptions }
YavuPurchaseTransactionItem >> descriptionSubtotal [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #subtotal;
			beReadonly;
        	label: 'Subtotal';
        	priority: 130;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> descriptionSubtotalAfterTaxs [

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
YavuPurchaseTransactionItem >> descriptionUnitPrice [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #unitPrice;
        	label: 'P. Unitario';
        	priority: 120;
			beRequired;
			bePositive;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseTransactionItem >> descriptionUnitPriceAfterTaxs [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #unitPriceAfterTaxs;
        	label: 'P. Uunitario + Iva';
        	priority: 125;
			beRequired;
			bePositive;
        	yourself
]

{ #category : #initialization }
YavuPurchaseTransactionItem >> initialize [ 

	quantity := unitPrice := unitPriceAfterTaxs := 0
	
]

{ #category : #initialization }
YavuPurchaseTransactionItem >> initializeOwner: anObject [

	owner := anObject 
	
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> initializeVatPercentage [

	vatPercentage := owner discriminateVat
		ifTrue: [ self vatPercentageFromProduct ]
		ifFalse: [ 0 ]
]

{ #category : #'as yet unclassified' }
YavuPurchaseTransactionItem >> mementoClass [

	^MAStraightMemento
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> name [ 

	^ 'item'
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> name: aName [

	^ 'item'
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> onUnitPriceAfterTaxsChanged [
	
	| unitPriceFromUnitPriceAfterTaxs |
	
	unitPriceFromUnitPriceAfterTaxs := unitPriceAfterTaxs / (1 + (self vatPercentage / 100)).
	unitPrice := unitPriceFromUnitPriceAfterTaxs asFloat round: self subsystem decimalAccuracy
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> onUnitPriceChanged [
	
	| unitPriceAfterTaxsFromUnitPrice |
	
	unitPrice = 0 ifFalse: [ 
	unitPriceAfterTaxsFromUnitPrice := unitPrice + (unitPrice * self vatPercentage / 100).
	unitPriceAfterTaxs := unitPriceAfterTaxsFromUnitPrice asFloat round: self subsystem decimalAccuracy]
]

{ #category : #'as yet unclassified' }
YavuPurchaseTransactionItem >> owner: aYavuPurchaseTransaction [ 
	owner := aYavuPurchaseTransaction
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> presentationUnit [

	^ presentationUnit
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> presentationUnit: aPresentationUnit [

	presentationUnit := aPresentationUnit 
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

{ #category : #accessing }
YavuPurchaseTransactionItem >> quantity [
	^ quantity
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> quantity: anInteger [ 
	quantity := anInteger
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> subsystem [
	^ self yavuSystem purchaseSubsystem
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> subtotal [
	
	^ (self quantity * self unitPrice) asFloat round: self subsystem decimalAccuracy
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> subtotalAfterTaxs [
	
	^ (self quantity * self unitPriceAfterTaxs) asFloat round: self subsystem decimalAccuracy
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> subtotalTaxs [
	
	^ self subtotalAfterTaxs - self subtotal
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> unitPrice [
	^ unitPrice
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> unitPrice: anInteger [ 
	
	anInteger > 0 ifTrue: [
		unitPrice := anInteger.
		self onUnitPriceChanged]
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> unitPriceAfterTaxs [
	^ unitPriceAfterTaxs 
]

{ #category : #accessing }
YavuPurchaseTransactionItem >> unitPriceAfterTaxs: aValue [

	aValue > 0 ifTrue: [
		unitPriceAfterTaxs := aValue.
		self onUnitPriceAfterTaxsChanged]
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> vatPercentage [

	vatPercentage ifNil: [ self initializeVatPercentage].
	^ vatPercentage 
]

{ #category : #calculated }
YavuPurchaseTransactionItem >> vatPercentageFromProduct [
	^ product
		ifNil: [ self yavuSystem purchaseSubsystem vatPercentageDefault ]
		ifNotNil: [ :selectedProduct | selectedProduct vatPercentage ]
]
