Class {
	#name : #YavuPurchaseInvoice,
	#superclass : #YavuTransaction,
	#instVars : [
		'invoiceType',
		'netPrice',
		'prefix',
		'invoiceNumber',
		'vatPerception',
		'iibbPerception',
		'purchaseTransactions',
		'vat105',
		'vat210'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'sin categoria' }
YavuPurchaseInvoice class >> entityClass [
	
	^ YavuSupplier 
]

{ #category : #testing }
YavuPurchaseInvoice class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuPurchaseInvoice class >> label [ 

	^ 'Factura de Compra'
]

{ #category : #accessing }
YavuPurchaseInvoice class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #events }
YavuPurchaseInvoice >> addPurchaseTransaction: aYavuPurchaseTransaction [ 
	
	purchaseTransactions add: aYavuPurchaseTransaction.
	self onPurchaseTransactionsAdded
]

{ #category : #adding }
YavuPurchaseInvoice >> addToSystem [

	super addToSystem.
	self purchaseTransactions do: [ :each | 
		each invoice: self.
		self yavuSystem storedSubsystem save: each ]
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> availablePurchaseTransactions [

	^ self subsystem availablePurchaseTransactionsFor: self entity
]

{ #category : #configuration }
YavuPurchaseInvoice >> completeString: aString withZeros: anInteger [ 
	
	| formattedString |
	
	formattedString := aString.
	anInteger - aString size timesRepeat: [ 
		formattedString := '0', formattedString 
		 ].
	^ formattedString 
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionContainer [

	^ super descriptionContainer
		addCondition: [ :obj | 
			(obj readUsing: self descriptionInvoiceType) discriminateVat
				ifTrue: [ (obj readUsing: self descriptionVat105) = 0
						ifTrue: [ ((obj readUsing: self descriptionVat210) = 0) not ]
						ifFalse: [ true ] ]
				ifFalse: [ true ] ]
			labelled: 'El IVA total de la factura debe ser mayor a 0.';
		yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionIibbPerception [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #iibbPerception;
        	label: 'Percepción IIBB';
        	priority: 155;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionInvoiceNumber [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #invoiceNumber;
        	label: 'Número';
        	priority: 115;
			min: 1;
			max: 99999999;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionInvoiceType [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #invoiceType;
		default: nil;
		optionsAndLabels: (self subsystem invoiceTypes collect: [:each | each -> each formattedInvoiceType]);
		label: 'Tipo';
		priority: 100;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionInvoiceTypeAndNumber [

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #invoiceTypeAndNumber;
        	label: 'Tipo y Número';
        	priority: 120;
			beReadonly;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionNetPrice [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #netPrice;
        	label: 'Importe Neto Gravado';
        	priority: 125;
			min: 0.1;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionPrefix [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #prefix;
        	label: 'Prefijo';
        	priority: 110;
			min: 1;
			max: 9999;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> descriptionPurchaseTransactions [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #purchaseTransactions;
		default: nil;
		label: 'Remitos';
		priority: 120;
		componentClass: MAListCompositonComponent;
		options: self availablePurchaseTransactions;
		yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionTotal [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #total;
        	label: 'Total';
        	priority: 160;
			beReadonly;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionVat105 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vat105;
        	label: 'IVA 10.5%';
        	priority: 135;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionVat210 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vat210;
        	label: 'IVA 21%';
        	priority: 130;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionVatPerception [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vatPerception;
        	label: 'Percepción IVA';
        	priority: 150;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #accessing }
YavuPurchaseInvoice >> entity: aSupplier [

	super entity: aSupplier.
	self onEntityChanded
]

{ #category : #configuration }
YavuPurchaseInvoice >> formattedInvoiceNumber [
	
	^ self completeString: self invoiceNumber asString withZeros: 8
]

{ #category : #configuration }
YavuPurchaseInvoice >> formattedPrefix [
	
	^ self completeString: self prefix asString withZeros: 4
]

{ #category : #accessing }
YavuPurchaseInvoice >> iibbPerception [
	^ iibbPerception
]

{ #category : #accessing }
YavuPurchaseInvoice >> iibbPerception: anObject [
	iibbPerception := anObject
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> initialize [ 

	super initialize.
	netPrice := vatPerception := iibbPerception := vat105 := vat210 := 0.
	purchaseTransactions := OrderedCollection new
]

{ #category : #accessing }
YavuPurchaseInvoice >> invoiceNumber [
	^ invoiceNumber
]

{ #category : #accessing }
YavuPurchaseInvoice >> invoiceNumber: anObject [
	invoiceNumber := anObject
]

{ #category : #accessing }
YavuPurchaseInvoice >> invoiceType [
	^ invoiceType
]

{ #category : #accessing }
YavuPurchaseInvoice >> invoiceType: anObject [
	invoiceType := anObject
]

{ #category : #configuration }
YavuPurchaseInvoice >> invoiceTypeAndNumber [

	^ self invoiceType 
		ifNil: [ '' ]
		ifNotNil: [ self invoiceType formattedInvoiceType, ' ', self formattedPrefix, ' ', self formattedInvoiceNumber ]
]

{ #category : #descriptions }
YavuPurchaseInvoice >> mementoClass [

	^ MAStraightMemento
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice [
	^ netPrice
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice: anObject [
	netPrice := anObject
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> onEntityChanded [

	self invoiceType: self entity invoiceType
]

{ #category : #events }
YavuPurchaseInvoice >> onPurchaseTransactionsAdded [
	
	netPrice := vat105 := vat210 := 0.
	self purchaseTransactionItems do: [ :each | 
		netPrice := self subtotalPriceOf: each.
		vat105 := self vat105ValueOf: each.
		vat210 := self vat210ValueOf: each ]
]

{ #category : #accessing }
YavuPurchaseInvoice >> prefix [
	^ prefix
]

{ #category : #accessing }
YavuPurchaseInvoice >> prefix: anObject [
	prefix := anObject
]

{ #category : #accessing }
YavuPurchaseInvoice >> purchaseTransactionItems [
	
	^ self purchaseTransactions inject: OrderedCollection new into: [ :accum :each |
		accum addAll: each purchaseTransactionItems  ]
]

{ #category : #accessing }
YavuPurchaseInvoice >> purchaseTransactions [
	^ purchaseTransactions
]

{ #category : #accessing }
YavuPurchaseInvoice >> purchaseTransactions: aCollection [

	purchaseTransactions := aCollection.
	self onPurchaseTransactionsAdded
]

{ #category : #environment }
YavuPurchaseInvoice >> subsystem [
	^ self yavuSystem purchaseSubsystem
]

{ #category : #calculated }
YavuPurchaseInvoice >> subtotalPriceOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType subtotalPriceOf: aPurchaseTransactionItem
]

{ #category : #accessing }
YavuPurchaseInvoice >> total [

	^ self netPrice + self vat105 + self vat210 + self vatPerception + self iibbPerception 
]

{ #category : #calculated }
YavuPurchaseInvoice >> totalPriceOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType totalPriceOf: aPurchaseTransactionItem 
]

{ #category : #accessing }
YavuPurchaseInvoice >> vat105 [
	^ vat105 
]

{ #category : #accessing }
YavuPurchaseInvoice >> vat105: aNumber [
	
	vat105 := aNumber
]

{ #category : #calculated }
YavuPurchaseInvoice >> vat105ValueOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType vatValueOf: aPurchaseTransactionItem vatPercentaje: 10.5
]

{ #category : #accessing }
YavuPurchaseInvoice >> vat210 [
	^ vat210
]

{ #category : #accessing }
YavuPurchaseInvoice >> vat210: aNumber [
	
	vat210 := aNumber
]

{ #category : #calculated }
YavuPurchaseInvoice >> vat210ValueOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType vatValueOf: aPurchaseTransactionItem vatPercentaje: 21.0
]

{ #category : #accessing }
YavuPurchaseInvoice >> vatPerception [
	^ vatPerception
]

{ #category : #accessing }
YavuPurchaseInvoice >> vatPerception: anObject [
	vatPerception := anObject
]
