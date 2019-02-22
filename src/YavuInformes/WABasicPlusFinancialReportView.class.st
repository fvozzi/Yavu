Class {
	#name : #WABasicPlusFinancialReportView,
	#superclass : #WABasicFinancialReportView,
	#instVars : [
		'selectedTab',
		'bcraCaptcha',
		'bcraDataReader',
		'afipDataReader'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> afipDataReader [

	afipDataReader isNil ifTrue: [afipDataReader := AfipDataReader new ].
	^afipDataReader 
]

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> bcraCaptcha [

	bcraCaptcha isNil ifTrue: [bcraCaptcha := ''].
	^bcraCaptcha 
]

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> bcraDataReader [

	bcraDataReader isNil ifTrue: [bcraDataReader := BCRADataReader new ].
	^bcraDataReader 
]

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> captchasMap [

	^Dictionary new
		at: #bcraCaptcha put: self bcraCaptcha;
		yourself
]

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> generarInforme [ 

	super generarInforme.
	self padronDataReader dni isNil ifFalse: [ 
		self financialReport customer isNil ifTrue: [ ^self  ].
		self afipDataReader valueForCustomer: self financialReport customer.
		self financialReport bcraData: (self bcraDataReader valueForCustomer: self financialReport customer) basicData
		] 
]

{ #category : #rendering }
WABasicPlusFinancialReportView >> otherDataTabsMap [

	^OrderPreservingDictionary new
		at: 'Datos Páginas Blancas' put: #renderWhitePagesDataOn: ;
		at: 'Datos BCRA' put: #renderDatosSegunBCRAOn: ;	
		at: 'Cheques Personales BCRA' put: #renderChequesRechazadosBCRAOn:;
		at: 'Cheques Sociedades BCRA' put: #renderChequesRechazadosSociedadesBCRAOn:;
		at: 'Afip Comprobantes' put: #renderAFIPComprobantesOn:;
		yourself
]

{ #category : #rendering }
WABasicPlusFinancialReportView >> renderAFIPComprobantesOn: html [

	
	html div id: #afipComprobantes; with: [
		html table: [
			html tableRow: [
				html 
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Período']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Declaración Jurada']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Seguridad Social']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Obra Social']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Contribución Patronal']]
						].
			self afipDataReader basicData contributions do: [:each |
				html tableRow: [
					each do: [ :eachData |
						html tableData: [html text: eachData ] ] ]
					
				]].
		]
]

{ #category : #rendering }
WABasicPlusFinancialReportView >> renderChequesRechazadosBCRAOn: html [

	
	html div id: #chequesBCRA; with: [
		html table: [
			html tableRow: [
				html 
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Nro. Cheque']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Fecha Rechazo']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Monto']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Causal']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Fecha Pago Cheque']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Fecha Pago Multa']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Revision']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'PR. Jud.']]
						].
			self financialReport bcraData bcraPersonalChecks do: [:each |
				html tableRow: [
					html 
						tableData: [html text: each checkNumber];
						tableData: [html text: each bouncedDate ];
						tableData: [html text: each amountOfCheck];
						tableData: [html text: each cause];					
						tableData: [html text: each paymentDate];
						tableData: [html text: each finePaymentDate];
						tableData: [html text: each revision];
						tableData: [html text: each judicial]]
				]].
		]
]

{ #category : #rendering }
WABasicPlusFinancialReportView >> renderChequesRechazadosSociedadesBCRAOn: html [

	
	html div id: #chequesSociedadesBCRA; with: [
		html table: [
			html tableRow: [
				html 
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Nro. Cheque']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Fecha Rechazo']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Monto']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Causal']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Denominacion']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Fecha Pago Cheque']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Fecha Pago Multa']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Revision']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'PR. Jud.']]
						].
			self financialReport bcraData bcraSocietyChecks do: [:each |
				html tableRow: [
					html 
						tableData: [html text: each checkNumber];
						tableData: [html text: each bouncedDate ];
						tableData: [html text: each amountOfCheck];
						tableData: [html text: each cause];		
						tableData: [html text: each denomination];				
						tableData: [html text: each paymentDate];
						tableData: [html text: each finePaymentDate];
						tableData: [html text: each revision];
						tableData: [html text: each judicial]]
				]].
		]
]

{ #category : #rendering }
WABasicPlusFinancialReportView >> renderDatosSegunBCRAOn: html [

	| debts |
	debts := self financialReport bcraData bcraDebts ifNil: [ OrderedCollection new ].
	html div id: #datosBCRA; with: [
		html table: [
			html tableRow: [
				html 
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Denominación']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Entidad']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Periodo']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Situacion']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Monto']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Dias']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Observaciones']].
						].
			self financialReport bcraData bcraDebts do: [:each |
				html tableRow: [
					html 
						tableData: [html text: each denomination];
						tableData: [html text: each entity ];
						tableData: [html text: each period];
						tableData: [self renderSituacionBCRAOf: each situation on: html];					
						tableData: [html text: each amount];
						tableData: [html text: each days];
						tableData: [html text: each observation ]]
				]].
		]
]

{ #category : #rendering }
WABasicPlusFinancialReportView >> renderOtherDataTabs: html [
  
	| index |
	html div id: #datosOtherTabs; with: [
		html div class: 'tabs'; with: [
		index := 1.
		self otherDataTabsMap keysAndValuesDo: [ :label :selector | 
			html div class: 'tab'; with: [
				html radioButton name: 'tab-group-1'; id: ('tab-', index asString); selected: (index = 1).
				html label for: ('tab-', index asString); with: [html text: label].
				html div class: 'content'; with: [self perform: selector  with: html] 
				].
			index := index + 1
		]]
	]
]

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> reportKind [

	^'Basico Plus'
]

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> reportKindClass [

	^'plus'
]

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> reportTitle [

	^'Informe Básico Plus'
]

{ #category : #'as yet unclassified' }
WABasicPlusFinancialReportView >> setBCRACaptcha: aSymbols [
	"Chequea si aSymbols tiene 6 digitos y lo setea como el BCRA Captcha y ya hace la busqueda en el BCRA."
	
	self bcraDataReader captchaCaracteres: aSymbols
]

{ #category : #testing }
WABasicPlusFinancialReportView >> showBCRACaptcha [

	^true
]
