Class {
	#name : #YavuPurchaseTransaction,
	#superclass : #YavuTransaction,
	#instVars : [
		'purchaseTransactionItems',
		'total',
		'voucherNumber'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'sin categoria' }
YavuPurchaseTransaction class >> entityClass [
	
	^ YavuSupplier 
]

{ #category : #'as yet unclassified' }
YavuPurchaseTransaction class >> instancesFrom: startDate to: endDate entities: aCollectionOfEntities [

	^ self yavuSystem purchaseSubsystem 
		purchaseInvoicesOfSuppliers: aCollectionOfEntities 
		from: startDate
		to: endDate
]

{ #category : #testing }
YavuPurchaseTransaction class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuPurchaseTransaction class >> label [ 

	^ 'Factura de Compra'
]

{ #category : #configuration }
YavuPurchaseTransaction >> addPurchaseTransactionItem: anInvoiceItem [ 
	
	purchaseTransactionItems add: anInvoiceItem.
	self onInvoiceItemsChange
]

{ #category : #initialization }
YavuPurchaseTransaction >> initialize [ 

	super initialize.
	purchaseTransactionItems := OrderedCollection new 
]

{ #category : #'as yet unclassified' }
YavuPurchaseTransaction >> invoice: aClass [ 
	self shouldBeImplemented.
]

{ #category : #descriptions }
YavuPurchaseTransaction >> mementoClass [

	^ MAStraightMemento
]

{ #category : #acccessing }
YavuPurchaseTransaction >> onInvoiceItemsChange [

	total := self purchaseTransactionItems inject: 0 into: [ :accum :each | accum + each unitPriceAfterTaxs]
]

{ #category : #acccessing }
YavuPurchaseTransaction >> purchaseTransactionItems [

	^purchaseTransactionItems
]

{ #category : #acccessing }
YavuPurchaseTransaction >> purchaseTransactionItems: aCollection [ 

	purchaseTransactionItems := aCollection.
	self onInvoiceItemsChange
]

{ #category : #descriptions }
YavuPurchaseTransaction >> purchaseTransactionItemsDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAToManyRelationDescription new
		accessor: #purchaseTransactionItems;
		classes: (OrderedCollection with: YavuPurchaseTransactionItem);
		default: nil;
		label: 'Items';
		priority: 120;
		componentClass: TBSMagritteOneToManyComponent;
		yourself
]

{ #category : #environment }
YavuPurchaseTransaction >> subsystem [
	^ self yavuSystem purchaseSubsystem
]

{ #category : #acccessing }
YavuPurchaseTransaction >> total [

	^ total
]

{ #category : #descriptions }
YavuPurchaseTransaction >> totalDescription [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #total;
			beReadonly;
        	label: 'Total';
        	priority: 160;
        	yourself
]

{ #category : #acccessing }
YavuPurchaseTransaction >> voucherNumber [
	^ voucherNumber
]

{ #category : #acccessing }
YavuPurchaseTransaction >> voucherNumber: anInteger [ 
	
	voucherNumber := anInteger 
]
