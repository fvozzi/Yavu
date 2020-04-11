Class {
	#name : #WAImportarSituacionesComercialesView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'archivoProcesado',
		'comercio',
		'importador',
		'incluyeEncabezado'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView class >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^WAAyudaImportarSituacionesComerciales
]

{ #category : #accessing }
WAImportarSituacionesComercialesView class >> textoDeAyuda [
	"Devuelve un texto de ayuda."

	^'Deberá ingresar un archivo de texto con la información asociada a las personas que desee actualizar.'
]

{ #category : #accessing }
WAImportarSituacionesComercialesView >> archivoProcesado [
	^ archivoProcesado
]

{ #category : #accessing }
WAImportarSituacionesComercialesView >> archivoProcesado: anObject [
	archivoProcesado := anObject
]

{ #category : #creation }
WAImportarSituacionesComercialesView >> comercio [
	"Devuelve el comercio seleccionado en el receptor."
	
	comercio ifNil: [self initializeComercio].
	^comercio
]

{ #category : #creation }
WAImportarSituacionesComercialesView >> comercio: unComercio [
	"Selecciona el comercio en el receptor."
	
	comercio:= unComercio 
]

{ #category : #accessing }
WAImportarSituacionesComercialesView >> date [
	"Devuelve la fecha actual del sistema."
	
	^Date today
]

{ #category : #nil }
WAImportarSituacionesComercialesView >> deleteRenglon: aSituacionComercial [
	"Elimina aSituacionComercial de la lista de situaciones del receptor."
	
	self importador informes remove: aSituacionComercial.
	(self importador clientes includes: aSituacionComercial customer) ifTrue: [
		self importador clientes remove: aSituacionComercial customer]
]

{ #category : #delegation }
WAImportarSituacionesComercialesView >> guardarInformes [
	"Persiste los informes del receptor."
	
	self importador errores size > 0 ifTrue: [^self inform: 'No se puede grabar porque existen errores. Por favor, revise el archivo de importación y vuelva a intentar la operación.'].
	self importador clientes do: [:each | each store].
	self importador informes do: [:each | each store].
	self archivoProcesado: false
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> importador [
	"Devuelve el modelo del receptor."
	
	^importador
]

{ #category : #accessing }
WAImportarSituacionesComercialesView >> incluyeEncabezado [
	
	^incluyeEncabezado
]

{ #category : #accessing }
WAImportarSituacionesComercialesView >> incluyeEncabezado: aBoolean [
	
	incluyeEncabezado:= aBoolean
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> initialize [

	super initialize.
	archivoProcesado := false.
	incluyeEncabezado := false
]

{ #category : #creation }
WAImportarSituacionesComercialesView >> initializeComercio [

	comercio:= self session user defaultCommerce
]

{ #category : #creation }
WAImportarSituacionesComercialesView >> nuevoImportadorPara: aCSVFile [ 
	"Crea el modelo del receptor."

	| readStreamOnCSVFile importerClass |
	readStreamOnCSVFile := ReadStream on: aCSVFile contents.
	importerClass := self session company importerClass. 
	importador := importerClass comercio: self comercio fecha: self date file: readStreamOnCSVFile
]

{ #category : #delegation }
WAImportarSituacionesComercialesView >> procesar [
	"Delega el procesamiento en el modelo."

	self importador 
		incluyeEncabezado: self incluyeEncabezado;
		procesar
]

{ #category : #delegation }
WAImportarSituacionesComercialesView >> procesarArchivo: aCSVFile [
	"Crea y procesa un nuevo importador para el comercio, fecha y archivo del receptor."

	self 
		nuevoImportadorPara: aCSVFile;
		procesar;
		archivoProcesado: true
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

	html form multipart; with: [
		self renderMenuAyudaOn: html.  
		html div id: #paso1; with: [self renderPrimerPasoOn: html].
		html div id: #paso2; with: [self renderSegundoPasoOn: html].
		self archivoProcesado ifTrue: [
			html div id: #paso3; with: [self renderTercerPasoOn: html].
			]
	]
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> renderMenuAyudaOn: html [
	"Renderiza el anchor de menu ayuda para el receptor.
	NOTA: cada clase que implemente la ayuda deberá definir la clase de ayuda."
	
	html div class: #ayuda; with: [html popupAnchor
		scrollbars: true;
		resizable: false;
		extent: 850 @ 600;
		position: 20 @ 20;
		 resourceUrl: 'help/FinancialSituationsImport.htm' ;
		location: false;
		menubar: false;
		with: 'Ayuda'
		]
]

{ #category : #rendering }
WAImportarSituacionesComercialesView >> renderPrimerPasoOn: html [
	"Renderiza el primer paso de la imortación"

	html heading level4 with: [html text: '1'].
	html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Seleccione el comercio'].
	html select 
		list: self session user commerces;
		selected: self comercio;
		callback: [:comercioSeleccionado | self comercio: comercioSeleccionado]
]

{ #category : #rendering }
WAImportarSituacionesComercialesView >> renderSegundoPasoOn: html [
	"Renderiza el segundo paso de la importación"

	html heading level4 with: [html text: '2'].
	html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Seleccione el archivo a importar'].
	html div id: #buscarArchivo; with: [
		html div id: #incluyeEncabezado; with: [
        	html checkbox
            	value: self incluyeEncabezado;
            	callback: [ :value | self incluyeEncabezado: value ].
		html div class: 'labelCheckBox'; with: [html text: 'Incluye encabezado: ']].
		html fileUpload callback: [ :value | self procesarArchivo: value ].
        	html submitButton: 'Procesar archivo' ]
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> renderTablaDeClientesOn: html [

	| person |

	person := self importador clientes ifEmpty: [YavuPerson new] ifNotEmpty: [self importador clientes first].
	html render: (MAReport rows: self importador clientes description: person maDescriptionForReport)
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> renderTablaDeErroresOn: html [

	html table: [
		html tableRow: [
			html tableData: [html div class: 'itemTitulos'; with: [html text: 'Descripción error']]
				].
		self importador errores do: [:each |
		html tableRow: [
			html tableData: [html text: each]
				]
			]
		]
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> renderTablaDeInformesOn: html [
	"Renderiza la tabla de situaciones comerciales procesadas en el receptor.
	NOTA: quita la columna entidad por referirce al comercio que estamos cargando todas las situaciones."

	| columns financialSituation |

	financialSituation := self importador informes ifEmpty: [FinancialSituation new] ifNotEmpty: [self importador informes first].
	columns := financialSituation maDescriptionForReport reject: [:each | each label = 'Entidad'].
	html render: ((MAReport rows: self importador informes description: columns)
					addColumn: (MACommandColumn new
									addCommandOn: self selector: #deleteRenglon: text: 'quitar';
									yourself);
					yourself)

]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> renderTercerPasoOn: html [
	"Renderiza el primer paso de la importación"
	
	html heading level4 with: [html text: '3'].
	html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Confimar y guardar'].
	html heading level1; with: [html text: 'Resumen de la información a procesar'].
	html heading level3; with: [html text: 'Se procesarán ', self importador numberOfReports printString, ' informes nuevos.'].
	html heading level3; with: [html text: 'Se crearán ', self importador cantidadDeNuevosClientes printString, ' clientes nuevos.'].
	html heading level3; with: [html text: 'Se encontraron ', self importador cantidadDeErrores printString, ' al procesar el archivo..'].
	html submitButton text: 'Guardar Informes'; callback: [self guardarInformes].
	html heading level1; with: [html text: 'Detalle de la información a procesar'].
	html heading level3; with: [html text: 'Listado de informes a procesar:'].
	html div id: #vistaPrevia; with: [self renderTablaDeInformesOn: html].
	html heading level3; with: [html text: 'Listado de clientes nuevos:'].
	html div id: #vistaPreviaClientes; with: [self renderTablaDeClientesOn: html].
	html heading level3; with: [html text: 'Listado de errores encontrados::'].
	html div id: #vistaPreviaErrores; with: [self renderTablaDeErroresOn: html]
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> textoDeAyuda [

	^self class textoDeAyuda
]

{ #category : #'as yet unclassified' }
WAImportarSituacionesComercialesView >> updateRoot: anHtmlRoot [

			super updateRoot: anHtmlRoot.  

    anHtmlRoot stylesheet resourceUrl: 'importarInformes.css'
]
