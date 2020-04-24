Class {
	#name : #InvoiceItem,
	#superclass : #YavuObject,
	#instVars : [
		'quantity',
		'unitPrice',
		'product',
		'description'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'as yet unclassified' }
InvoiceItem >> description: aDescription [ 
	
	description := aDescription 
]

{ #category : #'as yet unclassified' }
InvoiceItem >> descriptionDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new
		accessor: #description;
		priority: 105;
		yourself
]

{ #category : #initialization }
InvoiceItem >> initialize [ 

	quantity := 0.
	unitPrice := 0
]

{ #category : #accessing }
InvoiceItem >> name [ 

	^ 'item'
]

{ #category : #accessing }
InvoiceItem >> name: aName [

	^ 'item'
]

{ #category : #'as yet unclassified' }
InvoiceItem >> netPrice [
	
	^ self quantity * self unitPrice
]

{ #category : #'as yet unclassified' }
InvoiceItem >> netPriceDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #netPrice;
			beReadonly;
        	label: 'Precio Neto';
        	priority: 130;
			beRequired;
        	yourself
]

{ #category : #'as yet unclassified' }
InvoiceItem >> product: aYavuProduct [ 
	
	product := aYavuProduct 
]

{ #category : #'as yet unclassified' }
InvoiceItem >> productDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #product;
		default: nil;
		options: YavuProduct all;
		label: YavuProduct label;
		priority: 100;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
InvoiceItem >> quantity [
	^ quantity
]

{ #category : #'as yet unclassified' }
InvoiceItem >> quantity: anInteger [ 
	quantity := anInteger
]

{ #category : #'as yet unclassified' }
InvoiceItem >> quantityDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #quantity;
        	label: 'Cantidad';
        	priority: 110;
			beRequired;
			bePositive;
			min: 0.1;
        	yourself
]

{ #category : #'as yet unclassified' }
InvoiceItem >> total [
	
	^ self quantity * self unitPriceAfterTaxs 
]

{ #category : #'as yet unclassified' }
InvoiceItem >> totalDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #total;
			beReadonly;
        	label: 'Total';
        	priority: 140;
			beRequired;
        	yourself
]

{ #category : #'as yet unclassified' }
InvoiceItem >> unitPrice [
	^ unitPrice
]

{ #category : #'as yet unclassified' }
InvoiceItem >> unitPrice: anInteger [ 
	unitPrice := anInteger
]

{ #category : #'as yet unclassified' }
InvoiceItem >> unitPriceAfterTaxs [
	^ unitPrice + (unitPrice * self vatPercentage / 100)
]

{ #category : #'as yet unclassified' }
InvoiceItem >> unitPriceDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #unitPrice;
        	label: 'Precio Unitario';
        	priority: 120;
			beRequired;
			bePositive;
        	yourself
]

{ #category : #'as yet unclassified' }
InvoiceItem >> vatPercentage [

	product ifNil: [ ^ self yavuSystem purchaseSubsystem vatPercentageDefault ].
	^ product vatPercentage
]
