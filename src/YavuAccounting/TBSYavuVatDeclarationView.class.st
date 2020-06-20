Class {
	#name : #TBSYavuVatDeclarationView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'subsystemClass',
		'date',
		'businessName',
		'model'
	],
	#category : #'YavuAccounting-View'
}

{ #category : #'instance creation' }
TBSYavuVatDeclarationView class >> on: yavuSubsystemClass [

	 ^ self new initializeSubsystemClass: yavuSubsystemClass
]

{ #category : #accessing }
TBSYavuVatDeclarationView >> businessName [
	^ businessName
]

{ #category : #accessing }
TBSYavuVatDeclarationView >> businessName: anObject [
	businessName := anObject
]

{ #category : #accessing }
TBSYavuVatDeclarationView >> date [ 

	^ date
]

{ #category : #accessing }
TBSYavuVatDeclarationView >> date: aDate [

	date := aDate
]

{ #category : #initialization }
TBSYavuVatDeclarationView >> initialize [ 

	super initialize.
	"businessName := self possibleBusinessNames first"
]

{ #category : #initialization }
TBSYavuVatDeclarationView >> initializeSubsystemClass: yavuSubsystemClass [

	subsystemClass := yavuSubsystemClass.
	self onYavuSubsystemChanged
]

{ #category : #initialization }
TBSYavuVatDeclarationView >> onYavuSubsystemChanged [
]

{ #category : #'as yet unclassified' }
TBSYavuVatDeclarationView >> possibleBusinessNames [

	^ self subsystem businessNames 
]

{ #category : #rendering }
TBSYavuVatDeclarationView >> renderContentOn: html [

	html form with: [ 
	html tbsPanel with: [
		html tbsRow: [  
		html tbsColumn: [html text: 'Razón Social'] mediumSize: 2.	
		html tbsColumn: [
			html select
				list: self possibleBusinessNames;
				selected: self businessName ;
				callback: [ :oneObjectClass | self businessName: oneObjectClass ];
				labels: [ :each | each name]] mediumSize: 2.
		html tbsColumn: [html text: 'Declaración:'] mediumSize: 2.
		html tbsColumn: [
			html dateInput
				options: #(month year);
				value: self date;
				callback: [ :value | self date: value ]
				readonly.
			html tbsSubmitButton 
				bePrimary;
				callback: [ self search];
				with: 'Buscar'] mediumSize: 3.
		html tbsColumn: [html text: 'Estado:'] mediumSize: 1.
		html tbsColumn: [html text: 'A REVISAR'] mediumSize: 1] ] 
		html tbsPanel with: [html tbsRow: [html text: 'Vat Declaration']].
		html tbsPanel  with: [self renderSalesInvoiceOn: html  ]
		html tbsPanel with: [  ]
]
		
				 
]

{ #category : #rendering }
TBSYavuVatDeclarationView >> search [
	| vatDeclaration |
	vatDeclaration := self subsystem
		vatDeclarationOnDate: self date
		entity: self businessName
]

{ #category : #rendering }
TBSYavuVatDeclarationView >> subsystem [
	^ self session yavuSystem accountingSubsystem
]
