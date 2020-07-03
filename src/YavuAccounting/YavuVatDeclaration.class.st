Class {
	#name : #YavuVatDeclaration,
	#superclass : #YavuTransaction,
	#instVars : [
		'vatTaxDebit',
		'vatTaxCredit',
		'state',
		'officialPresentationDate',
		'sales',
		'purchases'
	],
	#category : #'YavuAccounting-DomainObjects'
}

{ #category : #accessing }
YavuVatDeclaration class >> entityClass [
	^ Smalltalk at: #YavuBusinessName 
]

{ #category : #testing }
YavuVatDeclaration class >> isVoyageRoot [ 

	^ true
]

{ #category : #testing }
YavuVatDeclaration class >> label [ 

	^ 'Declaración de IVA'
]

{ #category : #accessing }
YavuVatDeclaration class >> subsystemClass [
	^ Smalltalk at: #YavuAccountingSubsystem
]

{ #category : #descriptions }
YavuVatDeclaration >> descriptionDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^ MADateDescription new
		componentClass: MAMonthYearSelectorComponent;
		accessor: #date;
		label: 'Fecha';
		priority: 20;
		beRequired;
		yourself
]

{ #category : #descriptions }
YavuVatDeclaration >> descriptionPurchasesCollection [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAToManyRelationDescription new
		accessor: #purchases;
		"classes: (OrderedCollection with: YavuPurchaseInvoice );"
		default: nil;
		label: 'Compras';
		priority: 140;
		beReadonly;
		componentClass: TBSMagritteOneToManyComponent;
		reference: self subsystem purchaseInvoiceDescriptionsForVatDeclaration;
		yourself
		
	
]

{ #category : #descriptions }
YavuVatDeclaration >> descriptionSalesCollection [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAToManyRelationDescription new
		accessor: #sales;
		"classes: (OrderedCollection with: YavuPurchaseInvoice );"
		default: nil;
		label: 'Ventas';
		priority: 150;
		beReadonly;
		componentClass: TBSMagritteOneToManyComponent;
		reference: self subsystem saleInvoiceDescriptionsForVatDeclaration;
		yourself
		
	
]

{ #category : #descriptions }
YavuVatDeclaration >> descriptionVatTax [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vatTax;
        	label: 'IVA a pagar';
        	priority: 130;
			componentClass: TBSMagritteTextInputComponent;
			beReadonly;
        	yourself
]

{ #category : #descriptions }
YavuVatDeclaration >> descriptionVatTaxCredit [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vatTaxCredit;
        	label: 'IVA Crédito';
        	priority: 120;
			componentClass: TBSMagritteTextInputComponent;
			beReadonly;
        	yourself
]

{ #category : #descriptions }
YavuVatDeclaration >> descriptionVatTaxDebit [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vatTaxDebit;
        	label: 'IVA Debito';
        	priority: 110;
			componentClass: TBSMagritteTextInputComponent;
			beReadonly;
        	yourself
]

{ #category : #initialization }
YavuVatDeclaration >> initialize [ 

	super initialize.
	self 
		initializePurchasesInvoice;
		initializeSalesInvoice
]

{ #category : #'sin categoria' }
YavuVatDeclaration >> initializeEntity: anEntity date: aDate [

	super initializeEntity: anEntity date: aDate.
	state := self yavuSystem toReviseStatus
	
	
]

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> initializePurchasesInvoice [
	purchases := self subsystem purchasesOfEntity: self entity month: self date.
	vatTaxCredit := (purchases sum: [ :each | each vat105 + each vat210 ]) round: 2
]

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> initializeSalesInvoice [
	sales := self subsystem salesOfEntity: self entity month: self date.
	vatTaxDebit := (sales sum: [ :each | each vat105 + each vat210 ]) round: 2
]

{ #category : #accessing }
YavuVatDeclaration >> officialPresentationDate [
	^ officialPresentationDate
]

{ #category : #accessing }
YavuVatDeclaration >> officialPresentationDate: anObject [
	officialPresentationDate := anObject
]

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> purchases [

	^ purchases
]

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> sales [

	^ sales
]

{ #category : #accessing }
YavuVatDeclaration >> state [
	^ state
]

{ #category : #accessing }
YavuVatDeclaration >> state: anObject [
	state := anObject
]

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> useMagritteEditor [

	^ true
]

{ #category : #accessing }
YavuVatDeclaration >> vatTax [
	^ self vatTaxDebit - self vatTaxCredit
]

{ #category : #accessing }
YavuVatDeclaration >> vatTaxCredit [
	^ vatTaxCredit
]

{ #category : #accessing }
YavuVatDeclaration >> vatTaxCredit: anObject [
	vatTaxCredit := anObject
]

{ #category : #accessing }
YavuVatDeclaration >> vatTaxDebit [
	^ vatTaxDebit
]

{ #category : #accessing }
YavuVatDeclaration >> vatTaxDebit: anObject [
	vatTaxDebit := anObject
]
