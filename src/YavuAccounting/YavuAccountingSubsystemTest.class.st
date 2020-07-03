Class {
	#name : #YavuAccountingSubsystemTest,
	#superclass : #TestCase,
	#instVars : [
		'system',
		'resources'
	],
	#category : #'YavuAccounting-Test'
}

{ #category : #tests }
YavuAccountingSubsystemTest >> citiAlicuotasInvoiceNumber34089Output [

	^ '001000020000000000000003408980000000000201443105790000000010122460005000000000212572'
]

{ #category : #'as yet unclassified' }
YavuAccountingSubsystemTest >> citiAlicuotasInvoiceNumber54895Output: anInteger [ 
	
	^ anInteger = 21 
		ifTrue: [ '001031930000000000000005489580000000000306630058430000000007854430005000000000164943' ]
		ifFalse: [ '001031930000000000000005489580000000000306630058430000000001354800004000000000014225' ]
]

{ #category : #running }
YavuAccountingSubsystemTest >> citiComprobantesInvoiceNumber34089Output [

	^ '202005200010000200000000000000034089                8000000000020144310579Bulacio Cesar Oscar           000000001224818000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000PES00010000001000000000021257200000000000000000000000000                              000000000000000'
]

{ #category : #running }
YavuAccountingSubsystemTest >> citiComprobantesInvoiceNumber44Output [

	^ '202005010110000300000000000000000044                8000000000020172859209Luis A Lattanzio              000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000PES00010000000000000000000000000000000000000000000000000                              000000000000000'
]

{ #category : #tests }
YavuAccountingSubsystemTest >> citiComprobantesInvoiceNumber54895Output [

	^ '202005120010319300000000000000054895                8000000000030663005843Maxiconsumo SA                000000001153315000000000000000000000000000000000000000000000000000000025595000000000027629000000000000000000000000000000PES00010000002000000000017916800000000000000000000000000                              000000000000000'
]

{ #category : #tests }
YavuAccountingSubsystemTest >> citiVentasAlicuotasFactANumber29Output [

	^ '00100003000000000000000000290000000011570250005000000000242975'
]

{ #category : #tests }
YavuAccountingSubsystemTest >> citiVentasAlicuotasZLockNumber545Output [

	^ '08200001000000000000000005450000000015248890005000000000320227'
]

{ #category : #tests }
YavuAccountingSubsystemTest >> citiVentasComprobantesFactANumber29Output [

	^ '202001170010000300000000000000000029000000000000000000298000000000030715478214LA CHISPA FIMLS SRL           000000001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000PES00010000001000000000000000000000000'
]

{ #category : #tests }
YavuAccountingSubsystemTest >> citiVentasComprobantesZLockNumber545Output [

	^ '202005010820000100000000000000000545000000000000000005459900000000000000000000                              000000001845116000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000PES00010000001000000000000000000000000'
]

{ #category : #running }
YavuAccountingSubsystemTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	resources := YavuSystemTestResource current.
	resources newQuesosDelAbastoSupplier addToSystem
]

{ #category : #running }
YavuAccountingSubsystemTest >> system [ 

	^ resources system
]

{ #category : #running }
YavuAccountingSubsystemTest >> tearDown [

	YavuSystemTestResource reset
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiComprasAlicuotasFactAOneAlicuotGeneration [

	| comprasAlicuotasRow invoice |
	
	invoice := resources quesosDelAbastoPurchaseInvoiceNumber34089.
	invoice vatAlicuots do: [ :each | 
		comprasAlicuotasRow := CitiComprasAlicuotasFileRow on: invoice alicuota: each.
		self assert: comprasAlicuotasRow output equals: self citiAlicuotasInvoiceNumber34089Output ]
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiComprasAlicuotasFactATwoAlicuotsGeneration [

	| comprasAlicuotasRow invoice vatAlicuots |
	
	invoice := resources maxiconsumoPurchaseInvoiceNumber54895.
	invoice vatAlicuots do: [ :each | 
		comprasAlicuotasRow := CitiComprasAlicuotasFileRow on: invoice alicuota: each.
		self assert: comprasAlicuotasRow output equals: (self citiAlicuotasInvoiceNumber54895Output: each)]
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiComprasComprobantesFactAGeneration [

	| comprasComprobantesRow |
	
	comprasComprobantesRow := CitiComprasComprobantesFileRow on: resources quesosDelAbastoPurchaseInvoiceNumber34089.
	self assert: comprasComprobantesRow output equals: self citiComprobantesInvoiceNumber34089Output
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiComprasComprobantesFactAMaxiconsumoGeneration [

	| comprasComprobantesRow |
	
	comprasComprobantesRow := CitiComprasComprobantesFileRow on: resources maxiconsumoPurchaseInvoiceNumber54895.
	self assert: comprasComprobantesRow output equals: self citiComprobantesInvoiceNumber54895Output
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiComprasComprobantesFactCGeneration [

	| comprasComprobantesRow |
	
	comprasComprobantesRow := CitiComprasComprobantesFileRow on: resources luisLatancioPurchaseInvoiceNumber44.
	self assert: comprasComprobantesRow output equals: self citiComprobantesInvoiceNumber44Output
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiVentasAlicuotasFactAGeneration [

	| ventasComprobantesRow |
	
	ventasComprobantesRow := CitiVentasAlicuotasFileRow on: resources laChispaFilmSaleInvoice29.
	self assert: ventasComprobantesRow output equals: self citiVentasAlicuotasFactANumber29Output
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiVentasAlicuotasGeneration [

	| ventasAlicutoasRow |
	
	ventasAlicutoasRow := CitiVentasAlicuotasFileRow on: resources zLockNumber545.
	self assert: ventasAlicutoasRow output equals: self citiVentasAlicuotasZLockNumber545Output
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiVentasComprobantesFactAGeneration [

	| ventasComprobantesRow |
	
	ventasComprobantesRow := CitiVentasComprobantesFileRow on: resources laChispaFilmSaleInvoice29.
	self assert: ventasComprobantesRow output equals: self citiVentasComprobantesFactANumber29Output
]

{ #category : #tests }
YavuAccountingSubsystemTest >> testCitiVentasComprobantesGeneration [

	| ventasComprobantesRow |
	
	ventasComprobantesRow := CitiVentasComprobantesFileRow on: resources zLockNumber545.
	self assert: ventasComprobantesRow output equals: self citiVentasComprobantesZLockNumber545Output
]
