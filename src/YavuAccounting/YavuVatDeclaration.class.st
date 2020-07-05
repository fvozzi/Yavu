Class {
	#name : #YavuVatDeclaration,
	#superclass : #YavuTransaction,
	#instVars : [
		'vatTaxDebit',
		'vatTaxCredit',
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

{ #category : #'as yet unclassified' }
YavuVatDeclaration class >> maPossibleCommands [

	^ super maPossibleCommands
		at: #downloadFiles: put: 'Descargar CITI';
		yourself
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
		beReadonly;
		yourself
]

{ #category : #descriptions }
YavuVatDeclaration >> descriptionOfficialPresentationDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^ MADateDescription new
		componentClass: TBSMagritteDateInputComponent;
		accessor: #officialPresentationDate;
		label: 'Fecha Presentación AFIP';
		priority: 30;
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

{ #category : #'sin categoria' }
YavuVatDeclaration >> initializeEntity: anEntity date: aDate [

	super initializeEntity: anEntity date: (Date today addMonths: -1) beginOfMonth.
	self 
		initializePurchasesInvoice;
		initializeSalesInvoice
	
	
]

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> initializePurchasesInvoice [
	purchases := self subsystem purchasesOfEntity: self entity month: self date.
	vatTaxCredit := (purchases inject: 0 into: [:accum :each | accum + (each vat105 + each vat210) ]) round: 2
]

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> initializeSalesInvoice [
	sales := self subsystem salesOfEntity: self entity month: self date.
	vatTaxDebit := (sales inject: 0 into: [:accum :each | accum + (each vat105 + each vat210) ]) round: 2
]

{ #category : #descriptions }
YavuVatDeclaration >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^self descriptionEntity, 
	self descriptionDate, 
	self descriptionVatTax, 
	self descriptionVatTaxDebit,
	self descriptionVatTaxCredit 
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

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> useMagritteEditor [

	^ true
]

{ #category : #accessing }
YavuVatDeclaration >> vatTax [
	^ (self vatTaxDebit - self vatTaxCredit) round: self subsystem  decimalFiscalAccuracy 
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

{ #category : #'as yet unclassified' }
YavuVatDeclaration >> zipFileToDownload [

	^ self subsystem zipCitiFilesOf: self
]
