Class {
	#name : #YavuInvoice,
	#superclass : #YavuTransaction,
	#instVars : [
		'vat210',
		'vat105',
		'prefix',
		'invoiceNumber',
		'invoiceType',
		'netPrice'
	],
	#category : #'YavuCommon-DomainObjects'
}

{ #category : #'as yet unclassified' }
YavuInvoice >> afipTipoComprobante [

	^ self invoiceType afipTipoComprobante
]

{ #category : #descriptions }
YavuInvoice >> descriptionInvoiceNumber [

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
YavuInvoice >> descriptionInvoiceType [

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
YavuInvoice >> descriptionInvoiceTypeAndNumber [

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
YavuInvoice >> descriptionNetPrice [

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
YavuInvoice >> descriptionPrefix [

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

{ #category : #descriptions }
YavuInvoice >> descriptionTotal [

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
YavuInvoice >> descriptionVat105 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vat105;
        	label: 'IVA 10.5%';
        	priority: 135;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuInvoice >> descriptionVat210 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vat210;
        	label: 'IVA 21%';
        	priority: 130;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #accessing }
YavuInvoice >> entity: aSupplier [

	super entity: aSupplier.
	self onEntityChanded
]

{ #category : #configuration }
YavuInvoice >> formattedInvoiceNumber [
	
	^ self yavuSystem completeString: self invoiceNumber asString withZeros: 8
]

{ #category : #configuration }
YavuInvoice >> formattedPrefix [
	
	^ self yavuSystem completeString: self prefix asString withZeros: 5
]

{ #category : #initialization }
YavuInvoice >> initialize [ 

	super initialize.
	netPrice := vat105 := vat210 := 0
]

{ #category : #accessing }
YavuInvoice >> invoiceNumber [
	^ invoiceNumber
]

{ #category : #accessing }
YavuInvoice >> invoiceNumber: anObject [
	invoiceNumber := anObject
]

{ #category : #accessing }
YavuInvoice >> invoiceType [
	^ invoiceType
]

{ #category : #accessing }
YavuInvoice >> invoiceType: anObject [
	invoiceType := anObject
]

{ #category : #configuration }
YavuInvoice >> invoiceTypeAndNumber [

	^ self invoiceType 
		ifNil: [ '' ]
		ifNotNil: [ self invoiceType formattedInvoiceType, ' ', self formattedPrefix, ' ', self formattedInvoiceNumber ]
]

{ #category : #accessing }
YavuInvoice >> netPrice [
	^ netPrice
]

{ #category : #accessing }
YavuInvoice >> netPrice: anObject [
	netPrice := anObject
]

{ #category : #events }
YavuInvoice >> onEntityChanded [

	self invoiceType: self entity invoiceType
]

{ #category : #accessing }
YavuInvoice >> prefix [
	^ prefix
]

{ #category : #accessing }
YavuInvoice >> prefix: anObject [
	prefix := anObject
]

{ #category : #accessing }
YavuInvoice >> vat105 [
	^ vat105 
]

{ #category : #accessing }
YavuInvoice >> vat105: aNumber [
	
	vat105 := aNumber
]

{ #category : #accessing }
YavuInvoice >> vat210 [
	^ vat210
]

{ #category : #accessing }
YavuInvoice >> vat210: aNumber [
	
	vat210 := aNumber
]
