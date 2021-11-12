Class {
	#name : #YavuAccountingSubsystem,
	#superclass : #YavuSubsystem,
	#category : #'YavuAccounting-Environment'
}

{ #category : #'as yet unclassified' }
YavuAccountingSubsystem class >> fontAwesomeClass [

	^ 'fa-th-list'
]

{ #category : #accessing }
YavuAccountingSubsystem class >> label [ 

	^ 'Contabilidad'
]

{ #category : #configuration }
YavuAccountingSubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		add: ((YavuSimpleMenuElement label: 'Declaraciones y cierres' presenterClass: TBSTransactionsBrowserView subsystem: self) id: 2);
		yourself
]

{ #category : #configuration }
YavuAccountingSubsystem class >> subsystemName [

	^ 'Contabilidad'
]

{ #category : #configuration }
YavuAccountingSubsystem class >> subsystemTag [

	 ^ 'accountingSubsystem'
]

{ #category : #'as yet unclassified' }
YavuAccountingSubsystem >> accountingAccounts [

	^ YavuAccountingAccount all
]

{ #category : #'api/queries' }
YavuAccountingSubsystem >> decimalFiscalAccuracy [

	^ 2
]

{ #category : #afip }
YavuAccountingSubsystem >> generateComprasAlicuotasFileOn: aYavuVatDeclaration [
	
	| file |

	file := FileSystem memory root / 'ComprasAlicuotas', aYavuVatDeclaration date yyyymmdd, 'txt'.
	file writeStreamDo: [ :stream | 
		aYavuVatDeclaration purchases do: [ :purchaseInvoice |
			purchaseInvoice vatAlicuots do: [ :each | 
				stream 
					nextPutAll: (CitiComprasAlicuotasFileRow on: purchaseInvoice alicuota: each) output;
					crlf ]
				]
		 ].
	^ file
]

{ #category : #afip }
YavuAccountingSubsystem >> generateComprasComprobantesFileOn: aYavuVatDeclaration [
	
	| file |

	file := FileSystem memory root / 'ComprasComprobantes', aYavuVatDeclaration date yyyymmdd, '.txt'.
	file writeStreamDo: [ :stream | 
		aYavuVatDeclaration purchases do: [ :purchaseInvoice |
			stream 
				nextPutAll: (CitiComprasComprobantesFileRow on: purchaseInvoice) output;
				crlf ]
		 ].
	^ file
]

{ #category : #afip }
YavuAccountingSubsystem >> generateVentasAlicuotasFileOn: aYavuVatDeclaration [
	
	| file |

	file := FileSystem memory root / 'VentasAlicuotas', aYavuVatDeclaration date yyyymmdd, '.txt'.
	file writeStreamDo: [ :stream | 
		aYavuVatDeclaration sales do: [ :saleInvoice |
				stream 
					nextPutAll: (CitiVentasAlicuotasFileRow on: saleInvoice ) output;
					crlf
				]
		 ].
	^ file
]

{ #category : #afip }
YavuAccountingSubsystem >> generateVentasComprobantesFileOn: aYavuVatDeclaration [
	
	| file |

	file := FileSystem memory root / 'VentasComprobantes', aYavuVatDeclaration date yyyymmdd, '.txt'.
	file writeStreamDo: [ :stream | 
		aYavuVatDeclaration sales do: [ :saleInvoice |
			stream 
				nextPutAll: (CitiVentasComprobantesFileRow on: saleInvoice) output;
				crlf ]
		 ].
	^ file
]

{ #category : #accessing }
YavuAccountingSubsystem >> name [ 

	 ^ 'Contabilidad'
]

{ #category : #'as yet unclassified' }
YavuAccountingSubsystem >> priceLists [
	^ self system priceLists
]

{ #category : #afip }
YavuAccountingSubsystem >> purchaseInvoiceDescriptionsForVatDeclaration [
	
	| yavuPurchaseInvoice |
	
	yavuPurchaseInvoice := YavuPurchaseInvoice new.
	^ yavuPurchaseInvoice descriptionEntity,
	  yavuPurchaseInvoice descriptionDate,
	  yavuPurchaseInvoice descriptionCUITNumber,
	  yavuPurchaseInvoice descriptionAccountingAccount,
	  yavuPurchaseInvoice descriptionInvoiceTypeAndNumber,
	  yavuPurchaseInvoice descriptionIibbPerception,
	  yavuPurchaseInvoice descriptionVatPerception,
	  yavuPurchaseInvoice descriptionVat105,
	  yavuPurchaseInvoice descriptionVat210,
	  yavuPurchaseInvoice descriptionNetPrice105,
	  yavuPurchaseInvoice descriptionNetPrice210,
	  yavuPurchaseInvoice descriptionNetPrice,
	  yavuPurchaseInvoice descriptionTotal
]

{ #category : #afip }
YavuAccountingSubsystem >> purchasesOfEntity: aYavuBusinessName month: aDate [

	^ self system purchaseSubsystem purchaseInvoicesOfBusinessName: aYavuBusinessName vatDeclarationMonth: aDate
]

{ #category : #afip }
YavuAccountingSubsystem >> saleInvoiceDescriptionsForVatDeclaration [
	
	| yavuSaleInvoice |
	
	yavuSaleInvoice := YavuSaleInvoice new.
	^ yavuSaleInvoice descriptionEntity,
	  yavuSaleInvoice descriptionDate,
	  yavuSaleInvoice descriptionInvoiceTypeAndNumber,
	  yavuSaleInvoice descriptionVat210,
	  yavuSaleInvoice descriptionNetPrice,
	  yavuSaleInvoice descriptionTotal
]

{ #category : #afip }
YavuAccountingSubsystem >> salesOfEntity: aYavuBusinessName month: aDate [

	^ self system saleSubsystem salesOfEntity: aYavuBusinessName vatDeclarationMonth: aDate
]

{ #category : #afip }
YavuAccountingSubsystem >> zipCitiFilesOf: aYavuVatDeclaration [ 
	
	| comprasComprobantesFile comprasAlicuotasFile ventasComprobantesFile ventasAlicuotasFile zipFile zip |

	comprasComprobantesFile := self generateComprasComprobantesFileOn: aYavuVatDeclaration.
	comprasAlicuotasFile := self generateComprasAlicuotasFileOn: aYavuVatDeclaration.
	ventasComprobantesFile := self generateVentasComprobantesFileOn: aYavuVatDeclaration.
	ventasAlicuotasFile := self generateVentasAlicuotasFileOn: aYavuVatDeclaration.
	zipFile := FileSystem memory root / 'Citi', aYavuVatDeclaration date yyyymmdd, 'zip'.
	zip := ZipArchive new.
	zip addFile: comprasComprobantesFile as: comprasComprobantesFile basename.
	zip addFile: comprasAlicuotasFile  as: comprasAlicuotasFile basename.
	zip addFile: ventasComprobantesFile  as: ventasComprobantesFile basename.
	zip addFile: ventasAlicuotasFile  as: ventasAlicuotasFile basename.
	zip writeToFile: zipFile.
	^ zipFile
	
]
