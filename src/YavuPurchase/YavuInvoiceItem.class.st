Class {
	#name : #YavuInvoiceItem,
	#superclass : #YavuObject,
	#instVars : [
		'quantity',
		'unitPrice',
		'product',
		'description'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #accessing }
YavuInvoiceItem >> description [  
	
	^ description
]

{ #category : #accessing }
YavuInvoiceItem >> description: aDescription [ 
	
	description := aDescription 
]

{ #category : #'magritte-descriptions' }
YavuInvoiceItem >> descriptionDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new
		accessor: #description;
		priority: 105;
		yourself
]

{ #category : #initialization }
YavuInvoiceItem >> initialize [ 

	quantity := 0.
	unitPrice := 0
]

{ #category : #accessing }
YavuInvoiceItem >> name [ 

	^ 'item'
]

{ #category : #accessing }
YavuInvoiceItem >> name: aName [

	^ 'item'
]

{ #category : #calculated }
YavuInvoiceItem >> netPrice [
	
	^ self quantity * self unitPrice
]

{ #category : #'magritte-descriptions' }
YavuInvoiceItem >> netPriceDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #netPrice;
			beReadonly;
        	label: 'Precio Neto';
        	priority: 130;
			beRequired;
        	yourself
]

{ #category : #accessing }
YavuInvoiceItem >> product [ 
	
	^ product
]

{ #category : #accessing }
YavuInvoiceItem >> product: aYavuProduct [ 
	
	product := aYavuProduct 
]

{ #category : #'magritte-descriptions' }
YavuInvoiceItem >> productDescription [
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

{ #category : #accessing }
YavuInvoiceItem >> quantity [
	^ quantity
]

{ #category : #accessing }
YavuInvoiceItem >> quantity: anInteger [ 
	quantity := anInteger
]

{ #category : #'magritte-descriptions' }
YavuInvoiceItem >> quantityDescription [

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

{ #category : #calculated }
YavuInvoiceItem >> total [
	
	^ self quantity * self unitPriceAfterTaxs 
]

{ #category : #'magritte-descriptions' }
YavuInvoiceItem >> totalDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #total;
			beReadonly;
        	label: 'Total';
        	priority: 140;
			beRequired;
        	yourself
]

{ #category : #accessing }
YavuInvoiceItem >> unitPrice [
	^ unitPrice
]

{ #category : #accessing }
YavuInvoiceItem >> unitPrice: anInteger [ 
	unitPrice := anInteger
]

{ #category : #calculated }
YavuInvoiceItem >> unitPriceAfterTaxs [
	^ unitPrice + (unitPrice * self vatPercentage / 100)
]

{ #category : #'magritte-descriptions' }
YavuInvoiceItem >> unitPriceDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #unitPrice;
        	label: 'Precio Unitario';
        	priority: 120;
			beRequired;
			bePositive;
        	yourself
]

{ #category : #calculated }
YavuInvoiceItem >> vatPercentage [

	product ifNil: [ ^ self yavuSystem purchaseSubsystem vatPercentageDefault ].
	^ product vatPercentage
]