Class {
	#name : #WABasicFinancialReportView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'reportDataSelector',
		'padronDataReader',
		'financialReport'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WABasicFinancialReportView class >> on: aFinancialReport [ 

	^self new 
		initializeFinancialReport: aFinancialReport;
		yourself
]

{ #category : #updating }
WABasicFinancialReportView >> commerce [
	^ self reportDataSelector reportDataSelected commerce
]

{ #category : #updating }
WABasicFinancialReportView >> commerce: aCommerce [
	^ self reportDataSelector reportDataSelected commerce: aCommerce
]

{ #category : #updating }
WABasicFinancialReportView >> crearEmisionDeInforme [
	"Guarda un registro de la emision del informe."

	| emision |
	emision := ReportEmission
		customer: self commerce
		date: TimeStamp current
		user: self session user
		customer: self financialReport customer.
	emision
		reportKind: self reportKind;
		store
]

{ #category : #rendering }
WABasicFinancialReportView >> descargarPDF [

	self requestContext respond: [ :response |
               response
                       document: (StandardFileStream fileNamed:  self tempPath, self tempPDFFileName) binary mimeType: 'application/pdf' fileName: self tempPDFFileName;
               doNotCache ]

]

{ #category : #updating }
WABasicFinancialReportView >> descriptonOfAmountOfDebt: anAmount [

	^anAmount = -1
		ifTrue: ['']
		ifFalse: [anAmount asString]
]

{ #category : #accessing }
WABasicFinancialReportView >> financialReport [
	^ financialReport
]

{ #category : #accessing }
WABasicFinancialReportView >> financialReport: anObject [
	financialReport := anObject
]

{ #category : #updating }
WABasicFinancialReportView >> generarInforme [
	"Genera un informe según el dni ingresado por el usuario."

	| nuevo |

	self padronDataReader dni isNil
		ifFalse: [ 
			nuevo := self reportDataSelector reportDataSelected crearNuevoInforme.
			(self financialReport notNil and: [ self financialReport customer = nuevo customer ])
				ifTrue: [ ^ self ].
			self financialReport: nuevo.
			self setElectoralRollData.
			self financialReport tieneDatos
				ifTrue: [ self crearEmisionDeInforme ].
			self resetComercio ]
]

{ #category : #accessing }
WABasicFinancialReportView >> initializeFinancialReport: anObject [
	
	financialReport := anObject
]

{ #category : #accessing }
WABasicFinancialReportView >> initializeReportDataSelector [
	
	reportDataSelector := MultipleReportDataSelector showBCRACaptcha: self showBCRACaptcha financialReportView: self
]

{ #category : #accessing }
WABasicFinancialReportView >> nombreODescripcionDeCliente [
	"Devuelve el nombre del cliente, si este no existe en la BD propia, porque aún no se le ingreso ninguna situación comercial, busca de que BD externa puede mostrar la descripción."
	
	self financialReport customer name notEmpty ifTrue: [^self financialReport customer name].
	self financialReport datosPadronElectoral ~= DatosPadronElectoral inexistente ifTrue: [^self financialReport datosPadronElectoral nombre].
]

{ #category : #'as yet unclassified' }
WABasicFinancialReportView >> padronDataReader [

	padronDataReader isNil ifTrue: [padronDataReader := ElectoralRollDataReader new ].
	^padronDataReader 
]

{ #category : #rendering }
WABasicFinancialReportView >> renderAmountOf: elemento on:  html [

	| cssClass |
	
	cssClass := elemento financialSituationDescriptionCSSLabel.
	html div class: cssClass; with: [html text: elemento financialSituationDescription]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderAnchorImprimirOn: html [

	html tbsGlyphIcon iconPrint.
	html space
	
	"html anchor
      	callback:  [ self inform: 'Imprimiendo documento' ];
		onChange: (html jQuery ajax serializeForm);		
      	script: (html jQuery this button
         	text: false;
         	primaryIcon: 'ui-icon-print');
		with: 'Imprimir informe'"
]

{ #category : #rendering }
WABasicFinancialReportView >> renderAnchorPDFOn: html [

	html tbsGlyphIcon iconExport
	"html anchor
      	callback:  [ self descargarPDF ];
		onChange: (html jQuery ajax serializeForm);		
      	script: (html jQuery this button
         	text: false;
         	primaryIcon: 'ui-icon-document');
		with: 'Exportar a PDF'"
]

{ #category : #rendering }
WABasicFinancialReportView >> renderBouncedChecks1: html [
	html tbsColumn
		class: 'hidden-xs';
		mediumSize: 4;
		class: 'itemTitulos';
		with: [ html text: 'Comercio' ].
	html tbsColumn
		extraSmallSize: 4;
		mediumSize: 4;
		class: 'itemTitulos';
		with: [ html text: 'Banco' ].
	html tbsColumn
		extraSmallSize: 4;
		mediumSize: 2;
		class: 'itemTitulos';
		with: [ html text: 'Rechazo' ].
	html tbsColumn
		class: 'hidden-xs';
		mediumSize: 2;
		class: 'itemTitulos';
		with: [ html text: 'Multa' ].
	self financialReport bouncedChecks
		do: [ :each | 
			html tbsRow
				showGrid;
				with: [ 
							html tbsColumn
								class: 'hidden-xs';
								mediumSize: 4;
								class: 'textColumn';
								with: [ html text: each entity ].
							html tbsColumn
								extraSmallSize: 4;
								mediumSize: 4;
								class: 'textColumn';
								with: [ html text: each bank ].
							html tbsColumn
								extraSmallSize: 4;
								mediumSize: 2;
								class: 'dateColumn';
								with: [ html text: each bouncedDate ddmmyyyy ].
							html tbsColumn
								class: 'hidden-xs';
								mediumSize: 2;
								class: 'dateColumn';
								with: [ html text: (each finePaymentDate ifNil: [ '' ] ifNotNil: [ :date | date ddmmyyyy ]) ].
							 ]]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderBouncedChecks2: html [
	html tbsColumn
		class: 'hidden-xs';
		mediumSize: 2;
		class: 'itemTitulos';
		with: [ html text: 'Pago' ].
	html tbsColumn
		class: 'hidden-xs';
		mediumSize: 4;
		class: 'itemTitulos';
		with: [ html text: 'Nro. Cheque' ].
	html tbsColumn
		mediumSize: 2;
		class: 'itemTitulos';
		with: [ html text: 'Monto' ].
	html tbsColumn
		class: 'hidden-xs';
		mediumSize: 4;
		class: 'itemTitulos';
		with: [ html text: 'Causa' ].
		self financialReport bouncedChecks
		do: [ :each | 
			html tbsRow showGrid;	with: [ 
			html tbsColumn
				class: 'hidden-xs';
				mediumSize: 2;
				class: 'dateColumn';
				with: [ html text: (each paymentDate ifNil: [ '' ] ifNotNil: [ :date | date ddmmyyyy ]) ] ].
			html tbsColumn
				class: 'hidden-xs';
				mediumSize: 4;
				class: 'numericColumn';
				with: [ html text: each checkNumber ].
			html tbsColumn
				extraSmallSize: 4;
				mediumSize: 4;
				class: 'numericColumn';
				with: [ html text: each amountOfCheck ].
			html tbsColumn
				class: 'hidden-xs';
				mediumSize: 4;
				class: 'textColumn';
				with: [ html text: each cause ] ]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderBouncedChecksOn: html [
	html tbsRow showGrid;	with: [ 
		html tbsColumn
			extraSmallSize: 12;
			mediumSize: 12;
			with: [ html text: 'Cheques rechazados' ] ].
	html tbsRow showGrid;	with: [ 
		html tbsColumn
			extraSmallSize: 12;
			mediumSize:  6;						
			with: [self renderBouncedChecks1: html].
		html tbsColumn
			extraSmallSize: 12;
			mediumSize:  6;					
			with: [self renderBouncedChecks2: html ]]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

	self renderInformeOn: html

]

{ #category : #rendering }
WABasicFinancialReportView >> renderDatosSegunAfipOn: html [

	html div id: #datosAFIP; with: [
			html div class: 'ui-widget-header';  	class: 'ui-corner-all'; with: [html text: 'Datos AFIP'].
			html render: self financialReport datosAFIP asComponent]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderDatosSegunPadronOn: html [

	html div id: #datosPadron; with: [
		html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Datos Padron'].
		self financialReport electoralRoll isNil
			ifTrue: [html image resourceUrl: 'noDatos.png']
			ifFalse: [html render: self financialReport electoralRoll asComponent]
		]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderFinancialReportData1: html [

	html tbsRow showGrid;
		with: [ 
	html tbsColumn
			extraSmallSize:  4;	
			mediumSize:  4;		
			class: 'itemTitulos';
			with: [ html text: 'Comercio' ].
	html tbsColumn
			extraSmallSize:  4;
			mediumSize:  2;						
			class: 'itemTitulos';
			with: [ html text: 'Fecha' ] .
	html tbsColumn
			class: 'hidden-xs';
			mediumSize:  2;						
			class: 'itemTitulos';
			with: [ html text: 'Operación' ].
	html tbsColumn
			class: 'hidden-xs';
			mediumSize:  2;						
			class: 'itemTitulos';
			with: [ html text: 'Calidad' ] .
	html tbsColumn
			extraSmallSize:  4;
			mediumSize:  2;						
			class: 'itemTitulos';
			with: [html text: 'Deuda' ] ].		
	self financialReport resumenSituacionComercial elementos do: [ :each | 
		html tbsRow showGrid;
		with: [ 
			html tbsColumn
				extraSmallSize: 4;
				mediumSize:  4;		
				class: 'textColumn';
				with: [  html text: each comercio ].
			html tbsColumn
				extraSmallSize: 4;
				mediumSize:  2;
				class: 'dateColumn';		
				with: [ html text: each fechaUltimoPago ddmmyyyy ].
			html tbsColumn
				class: 'hidden-xs';
				mediumSize:  2;		
				class: 'textColumn';
				with: [ html text: each operationType code].
			html tbsColumn
				class: 'hidden-xs';
				mediumSize:  2;		
				class: 'textColumn';
				with: [ html text: each operationCharacter code].			
			html tbsColumn
				extraSmallSize: 4;
				mediumSize:  2;		
				class: 'textColumn';
				with: [ self renderAmountOf: each on: html]
											] ].

]

{ #category : #rendering }
WABasicFinancialReportView >> renderFinancialReportData2: html [ 
	
	html tbsRow showGrid;
		with: [ 
	self financialReport resumenSituacionComercial labelMesesAnteriores do: [ :each | 
		html tbsColumn 
			extraSmallSize: 1;
			mediumSize:  1;		
			class: 'itemTitulos';
			with: [  html text: each ]]].
	self financialReport resumenSituacionComercial elementos do: [:each |
		html tbsRow showGrid;
		with: [ 
				each situacionesAnterioresOrdenadas do: [ :situacion | 
					html tbsColumn 
						extraSmallSize: 1;
						mediumSize:  1;		
						class: 'itemTitulos';
						with: [  self renderAmountOf: situacion on: html ]]]]
]

{ #category : #'report-scheeme' }
WABasicFinancialReportView >> renderFirstRowOn: html [

	html tbsRow  showGrid;
		class: 'no-gutter';
		with: [html tbsColumn
						extraSmallSize: 12;
						mediumSize: 8;						
						with: [self renderPersonalDataOn: html].
				html tbsColumn
						extraSmallSize: 12;
						mediumSize:  4;		
						with: [self renderScoringOn: html]]
]

{ #category : #'report-scheeme' }
WABasicFinancialReportView >> renderHeadingOn: html [

	html tbsRow showGrid;
		with: [ html tbsColumn
						extraSmallSize: 6;
						mediumSize:  6;						
						with: [self renderTitleOn: html].
				html tbsColumn
						extraSmallSize: 6;
						mediumSize:  6;						
						with: [self renderToolsOn: html]]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderInformeOn: html [
	"Renderiza el contenido del receptor en html."

	html tbsContainer with: [ 
	self financialReport tieneDatos ifFalse: [^html text: 'No existen datos para ese número de documento.'].
	self renderHeadingOn: html.
	html div class: #financialReport; with: [
		self
			renderFirstRowOn: html;
			renderSecondRowOn: html;	
			renderThirdRowOn: html;
			renderLostChecksOn: html;
			renderReportEmissionsOn: html;
			renderDatosSegunPadronOn: html;
			renderDatosSegunAfipOn: html;
			renderOtherDataTabs: html
		]
	 ]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderIngresoDeDatosOn: html [
	"Renderiza el ingreso de datos requeridos por el receptor."

	self financialReport isNil ifTrue: [
	self session user comerciosAsignados > 1 ifTrue: [
		html div id: 'seleccionComercio'; with: [
			html div class: 'titulo2'; with: [html text: 'Seleccione el comercio al que se le facturará el informe:'].
			html select 
				list: self session user commerces asSortedCollection ;
				selected: (self comercio ifNil: [self session user defaultCommerce]);
				callback: [:comercioSeleccionado | self comercio: comercioSeleccionado].
		]].
		html div id: 'captchas'; with: [
			self renderCaptchasOn: html	
			]
		]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderLostChecksOn: html [

	html div id: 'lostChecks';  with: [
		html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Cheques perdidos'].
		html table: [
			html tableRow: [
				html 
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Comercio']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Banco']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Fecha extravío']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Nro. Cheque']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Monto']]
						].
			self financialReport lostChecks do: [:each |
			html tableRow: [
				html 
					tableData: [html div class: 'textColumn'; with: [html text: each entity]];
					tableData: [html div class: 'textColumn'; with: [html text: each bank]];
					tableData: [html div class: 'dateColumn'; with: [html text: each lostDate ddmmyyyy]];
					tableData: [html div class: 'numericColumn'; with: [html text: each checkNumber]];
					tableData: [html div class: 'numericColumn'; with: [html text: each amountOfCheck]]
				]].
			]
		].
]

{ #category : #rendering }
WABasicFinancialReportView >> renderOtherDataTabs: html [

]

{ #category : #rendering }
WABasicFinancialReportView >> renderPersonalDataColumn1: html [

	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;	
			class:  'itemTitulos';	
			with: [html text: self financialReport customer descripcionNombre , ':' ].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;	
			class: 'textColumn';						
			with: [html text: self financialReport customer name ].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;		
			with: [html text: 'Documento:' ].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;						
			with: [html text: self financialReport customer documentNumber ].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;		
			with: [html text: 'CUIL/CUIT:'].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;						
			with: [html text: self financialReport customer cuit  ].
	self financialReport customer isNaturalPerson ifTrue: [ 
		html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;		
			with: [html text: 'Nacimiento:'].
		html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;						
			with: [html text: (self financialReport customer birthday ifNil: [ '-' ])].
		html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;		
			with: [html text: 'Localidad:'].
		html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;						
			with: [html text: (self financialReport customer city ifNil: [ '-' ])]
			]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderPersonalDataColumn2: html [

	self financialReport customer isNaturalPerson  ifFalse: [ ^self ].
	html tbsColumn
			extraSmallSize: 2;
			mediumSize:  6;		
			with: [html text: 'Dirección:'  ].
	html tbsColumn
			extraSmallSize: 2;
			mediumSize:  6;						
			with: [html text: (self financialReport customer address ifNil: [ '-' ])].
	html tbsColumn
			extraSmallSize: 2;
			mediumSize:  6;		
			with: [html text: 'Ocupación:'  ].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;						
			with: [html text: (self financialReport customer occupation ifNil: [ '-' ])].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;		
			with: [html text: 'Trabajo:'].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;						
			with: [html text: (self financialReport customer job ifNil: [ '-' ]) ].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;		
			with: [html text: 'Conyugue:'   ].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;						
			with: [html text: (self financialReport customer spouse ifNil: [ '-' ])].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;		
			with: [html text:  'DNI Conyugue:' ].
	html tbsColumn
			extraSmallSize: 6;
			mediumSize:  6;						
			with: [html text:  (self financialReport customer spouseDocumentNumber ifNil: [ '-' ]) ].
	
	
]

{ #category : #rendering }
WABasicFinancialReportView >> renderPersonalDataOn: html [
	
	
					html tbsColumn
						extraSmallSize: 12;
						mediumSize:  12;					
						with: [html text: 'Datos Personales' ].
					html tbsColumn
						extraSmallSize: 12 ;
						mediumSize:  6;						
						with: [ self renderPersonalDataColumn1: html ].
					html tbsColumn
						class: 'hidden-xs';
						mediumSize:  6;						
						with: [ self renderPersonalDataColumn2: html ] 

]

{ #category : #rendering }
WABasicFinancialReportView >> renderReportEmissionsOn: html [

	html div id: 'reportEmissions';  with: [
		html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Consultas realizadas'].
		html table: [
			html tableRow: [
				html 
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Comercio']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Consultas']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Última consulta']]
						].
			self financialReport reportEmissions keysAndValuesDo:  [:comerce :emissions |
			html tableRow: [
				html 
					tableData: [html div class: 'textColumn'; with: [html text: emissions first entity]];
					tableData: [html div class: 'numericColumn'; with: [html text: (emissions size)]];
					tableData: [html div class: 'dateColumn'; with: [html text: emissions last date yyyymmddhhmmss]]
				]].
			]
		].
]

{ #category : #'as yet unclassified' }
WABasicFinancialReportView >> renderScoringOn: html [

	"html div id: #scoring; with: ["
		
		html tbsColumn
						extraSmallSize: 12;
						mediumSize:  12;						
						with: [html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Scoring']].
		html tbsColumn
						extraSmallSize: 12;
						mediumSize:  12;						
						with: [html text: 'Solicite informe Premium para conocer el scoring.'].

		"
		 ]"
]

{ #category : #'report-scheeme' }
WABasicFinancialReportView >> renderSecondRowOn: html [


	html tbsRow showGrid; with: [
		html tbsColumn
				mediumSize:  12;					
				with: [html text: 'Datos Informes propios' ]].
	html tbsRow showGrid; with: [
		html tbsColumn
				extraSmallSize: 12;
				mediumSize:  6;						
				with: [self renderFinancialReportData1: html].
		html tbsColumn
				class: 'hidden-xs';
				mediumSize:  6;					
				with: [self renderFinancialReportData2: html]
			]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderSituacionBCRAOf: elemento on:  html [

	| cssClass |
	
	cssClass := (#(3 4 5) includes: ([elemento asNumber] on: Error do: [:ex | ''])) ifTrue: ['debe'] ifFalse:  ['deuda'].
	html div class: cssClass; with: [html text: elemento]
]

{ #category : #'report-scheeme' }
WABasicFinancialReportView >> renderThirdRowOn: html [

	self renderBouncedChecksOn: html
]

{ #category : #rendering }
WABasicFinancialReportView >> renderTitleOn: html [

	html div
      	class: 'ui-widget-header';
      	class: 'ui-corner-all';
		class: self reportKindClass;
		with: [html text: self reportTitle ]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderToolsOn: html [
	"Renderiza las tools para imprimir o enviar a pdf."
	
	html div
      	class: 'ui-widget-header';
      	class: 'ui-corner-all';
      	with: [
         		self
				renderAnchorImprimirOn: html;
				renderAnchorPDFOn: html]
			
]

{ #category : #rendering }
WABasicFinancialReportView >> renderTotalDebtOn: html [

	| total |
	
	total := self financialReport resumenSituacionComercial montoTotal.
	total = -1 ifFalse: [  
		html
			tableRow: [ 
				html
					tableData: [  ];
					tableData: [  ];
					tableData: [  ];
					tableData: [ html text: 'Total adeudado ->' ];
					tableData: [ 
							html div
								class: 'deuda';
								class: 'totalDeuda';
								with: [ html text: (self descriptonOfAmountOfDebt: total) ] ] ]
	]
]

{ #category : #rendering }
WABasicFinancialReportView >> renderWhitePagesDataOn: html [

	html div id: #whitePagesData; with: [
		"html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Datos Páginas Blancas']."
		html table: [
			html tableRow: [
				html 
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Nombre']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Teléfono']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Dirección']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Ciudad']];
					tableData: [html div class: 'itemTitulos'; with: [html text: 'Provincia']].
						].
	(self financialReport whitePagesData inject: Dictionary new into: [:accum :each | accum at: each phone put: each; yourself]) values do: [:each |
				html tableRow: [
					html 
						tableData: [html text: each name];
						tableData: [html text: each phone];
						tableData: [html text: each address];
						tableData: [html text: each city];					
						tableData: [html text: each state]]
			
				]].
		
		]
]

{ #category : #accessing }
WABasicFinancialReportView >> reportDataSelector [
	
	reportDataSelector ifNil: [self initializeReportDataSelector].
	^reportDataSelector
]

{ #category : #accessing }
WABasicFinancialReportView >> reportDataSelector: anObject [
	
	reportDataSelector := anObject
]

{ #category : #'as yet unclassified' }
WABasicFinancialReportView >> reportKind [

	^'Basico'
]

{ #category : #rendering }
WABasicFinancialReportView >> reportKindClass [

	^'basico'
]

{ #category : #'as yet unclassified' }
WABasicFinancialReportView >> reportTitle [

	^'Informe Básico'
]

{ #category : #updating }
WABasicFinancialReportView >> resetComercio [

	self commerce: nil
]

{ #category : #rendering }
WABasicFinancialReportView >> resetTempPDFFileName [

	self tempPDFFileName: nil
]

{ #category : #updating }
WABasicFinancialReportView >> setElectoralRollData [

	| newCustomer |
	self financialReport electoralRoll: (self padronDataReader valueForCustomer: self financialReport customer) basicData.
	((self financialReport customer isNil or: [ self financialReport customer name isEmpty ]) and: [self financialReport electoralRoll name notEmpty]) ifTrue: [ 
		newCustomer := YavuNaturalPerson newFromElectoralRollData: self financialReport electoralRoll.
		newCustomer store.
		self financialReport customer: newCustomer
		 ]
]

{ #category : #testing }
WABasicFinancialReportView >> showBCRACaptcha [

	^false
]

{ #category : #accessing }
WABasicFinancialReportView >> tempPath [

	^'C:\TEMP\'
]

{ #category : #rendering }
WABasicFinancialReportView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
	anHtmlRoot stylesheet resourceUrl: 'css/financialReport.css'.
	anHtmlRoot stylesheet resourceUrl: 'css/reportDataSelector.css'
]
