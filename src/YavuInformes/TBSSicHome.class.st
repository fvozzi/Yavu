Class {
	#name : #TBSSicHome,
	#superclass : #WAYavuBootstrap,
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #rendering }
TBSSicHome >> callInputDebt [
	
	self parent content: TBSFactoryView new
]

{ #category : #rendering }
TBSSicHome >> openBasicFinancialReport [

	self parent content: (TBSReportDataSelector on: FinancialReportTypeBasic)
]

{ #category : #'as yet unclassified' }
TBSSicHome >> renderChecksInputOn: html [

	html tbsPanel beDefault with: [ 
		html tbsPanelHeading: [ html tbsPanelTitle level: 3; with: 'Base de Cheques' ].
			html tbsPanelBody: [
				html form: [ 
					html tbsButton 	
						bePrimary;		 
						beBlock;
						with: 'Ingresar Cheques Perdidos'.
					html tbsButton 	
						bePrimary;		 
						beBlock;
						with: 'Ingresar Cheques Rechazados'.
					html tbsButton 	
						bePrimary;		 
						beBlock;
						with: 'Actualizar Cheques Rechazados' ]
				]
			]
]

{ #category : #'as yet unclassified' }
TBSSicHome >> renderContentOn: html [
	self renderFirstRowOn: html.
	self renderSecondRowOn: html
]

{ #category : #'as yet unclassified' }
TBSSicHome >> renderFinancialSituationsInputOn: html [

	html tbsPanel beDefault 
		with: [ html tbsPanelHeading: [ html tbsPanelTitle level: 3; with: 'Base de Deudores' ].
			    html tbsPanelBody: [
				html form: [ 
					html tbsButton 	
						bePrimary;		 
						beBlock;
						callback: [ self callInputDebt ];
						with: 'Ingresar Deuda'.
					html tbsButton 	
						bePrimary;		 
						beBlock;
						callback: [ self callUpdateDebt ];
						with: 'Actualizar Deuda'.
					html tbsButton 	
						bePrimary;		 
						beBlock;
						callback: [ self callImportDebt ];
						with: 'Importar Situaciones' ]
				]
			]
]

{ #category : #'as yet unclassified' }
TBSSicHome >> renderFirstRowOn: html [
	html tbsRow
		with: [ 
			html tbsColumn
				extraSmallSize: 12;
				mediumSize: 1;
				with: [  ].
			html tbsColumn
				extraSmallSize: 12;
				mediumSize: 10;
				with: [ self renderReportsMenuOn: html ].
			html tbsColumn
				extraSmallSize: 12;
				mediumSize: 1;
				with: [  ] ]
]

{ #category : #'as yet unclassified' }
TBSSicHome >> renderReportsMenuOn: html [

	html tbsContainer class: 'theme-showcase'; with: [ 
	html tbsJumbotron: [ 		
		html heading: 'WebSic - Informes'.
		"html image resourceUrl: 'img/logoWebsic.png'."
		"html break; break."
		html paragraph: [
			html text: 'Nuestro sistema ofrece diferentes tipos de informes '.
			html text: ' para cubrir todo el abanico informatico que su comercio '.
			html text: ' necesita para realizar transacciones de manera segura.'].
		html paragraph: [
			html form: [  
			html tbsRow: [ 		
			html tbsColumn: [ 
				html anchor
						callback: [ self openBasicFinancialReport ];
						with: [ html image resourceUrl: 'img/tbsBasico.png' ] .
				] mediumSize: 4.
			html tbsColumn: [ 
				html anchor
						callback: [ self openBasicFinancialReport ];
						with: [ html image resourceUrl: 'img/tbsPlus.png' ] .
				] mediumSize: 4.
			html tbsColumn: [ 
				html anchor
						callback: [ self openBasicFinancialReport ];
						with: [ html image resourceUrl: 'img/tbsPremium.png' ] .
				] mediumSize: 4.
		]
	 ]
	]
			]]
]

{ #category : #'as yet unclassified' }
TBSSicHome >> renderSecondRowOn: html [
	html tbsRow
		with: [ 
			html tbsColumn
				extraSmallSize: 12;
				mediumSize: 1;
				with: [  ].
			html tbsColumn
				extraSmallSize: 12;
				mediumSize: 10;
				with: [ 
							html tbsColumn
								extraSmallSize: 12;
								mediumSize: 6;
								with: [ self renderFinancialSituationsInputOn: html ].
							html tbsColumn
								extraSmallSize: 12;
								mediumSize: 6;
								with: [ self renderChecksInputOn: html ] ].
			html tbsColumn
				extraSmallSize: 12;
				mediumSize: 1;
				with: [  ] ]
]
