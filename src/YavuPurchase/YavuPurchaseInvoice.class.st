Class {
	#name : #YavuPurchaseInvoice,
	#superclass : #YavuTransaction,
	#instVars : [
		'invoiceType',
		'invoiceItems',
		'total',
		'netPrice',
		'prefix',
		'invoiceNumber'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'sin categoria' }
YavuPurchaseInvoice class >> entityClass [
	
	^ YavuSupplier 
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice class >> instancesFrom: startDate to: endDate entities: aCollectionOfEntities [

	^ self yavuSystem purchaseSubsystem 
		purchaseInvoicesOfSuppliers: aCollectionOfEntities 
		from: startDate
		to: endDate
]

{ #category : #testing }
YavuPurchaseInvoice class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuPurchaseInvoice class >> label [ 

	^ 'Factura de Compra'
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> addInvoiceItem: anInvoiceItem [ 
	
	invoiceItems add: anInvoiceItem.
	self onInvoiceItemsChange
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> completeString: aString withZeros: anInteger [ 
	
	| formattedString |
	
	formattedString := aString.
	anInteger - aString size timesRepeat: [ 
		formattedString := '0', formattedString 
		 ].
	^ formattedString 
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> entity: aSupplier [

	super entity: aSupplier.
	self onSupplierChanged: aSupplier
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> formattedInvoiceNumber [
	
	^ self completeString: self invoiceNumber asString withZeros: 8
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> formattedPrefix [
	
	^ self completeString: self prefix asString withZeros: 4
]

{ #category : #initialization }
YavuPurchaseInvoice >> initialize [ 

	super initialize.
	invoiceItems := OrderedCollection new
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoice: aClass [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceItems [
	^invoiceItems
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceItems: aCollection [ 

	invoiceItems := aCollection
]

{ #category : #descriptions }
YavuPurchaseInvoice >> invoiceItemsDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAToManyRelationDescription new
		accessor: #invoiceItems;
		classes: (OrderedCollection with: YavuInvoiceItem);
		default: nil;
		label: 'Items';
		priority: 120;
		componentClass: TBSMagritteOneToManyComponent;
		yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceNumber [
	^ invoiceNumber
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceNumber: anInteger [ 
	
	invoiceNumber := anInteger 
]

{ #category : #descriptions }
YavuPurchaseInvoice >> invoiceNumberDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #invoiceNumber;
        	label: 'Número';
        	priority: 115;
			min: 1;
			max: 99999999;
			beRequired;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceType [
	
	^ invoiceType
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceType: aClass [ 
	invoiceType := aClass
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> netPrice [
	
	^ netPrice
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> onInvoiceItemsChange [

	netPrice  := self invoiceItems inject: 0 into: [ :accum :each | accum + each netPrice ].
	total := self invoiceItems inject: 0 into: [ :accum :each | accum + each total ]
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> onSupplierChanged: aSupplier [

	self invoiceType: aSupplier invoiceType
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> prefix [
	^ prefix
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> prefix: anInteger [ 
	
	prefix := anInteger
]

{ #category : #descriptions }
YavuPurchaseInvoice >> prefixDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #prefix;
        	label: 'Prefijo';
        	priority: 110;
			min: 1;
			max: 9999;
			beRequired;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> total [
	^ total
]

{ #category : #descriptions }
YavuPurchaseInvoice >> totalDescription [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #total;
        	label: 'Total';
        	priority: 160;
			bePositive;
			beRequired;
        	yourself
]
