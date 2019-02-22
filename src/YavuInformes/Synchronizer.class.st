Class {
	#name : #Synchronizer,
	#superclass : #YavuObject,
	#instVars : [
		'claseASincronizar',
		'fechaDesde',
		'fechaHasta'
	],
	#category : #'YavuInformes-Persistence'
}

{ #category : #'sin categoria' }
Synchronizer class >> claseASincronizar: aExternalDatabaseSubclass desde: unaFecha hasta: otraFecha [

	^self new 
		inicializarClaseASincronizar: aExternalDatabaseSubclass
		desde: unaFecha
		hasta: otraFecha
]

{ #category : #'sin categoria' }
Synchronizer >> claseASincronizar [

	^claseASincronizar
]

{ #category : #'sin categoria' }
Synchronizer >> descargarActualizacionDeFecha: unaFecha [
	"Descarga el archivo de actualizacion, si existe, para la fecha unaFecha."

	| httpString zipFile directory mimeType httpDocument |
	
	httpString := 'http://www.bcra.gov.ar/zips/cheques/', (self fileNameFor: unaFecha).
	mimeType := 'application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5'.
	httpDocument := (HTTPSocket httpGetDocument: httpString accept: mimeType).
	httpDocument isString ifTrue: [^self].
	zipFile := ZipArchive new readFrom: httpDocument contentStream.
	directory := FileDirectory on: self claseASincronizar actualizacionesPath.
	zipFile extractAllTo: directory informing: nil overwrite: true
]

{ #category : #'sin categoria' }
Synchronizer >> descargarActualizacionesYSincronizar [
	"Descarga todos los archivos disponibles en http://www.bcra.gov.ar/zips/cheques/ entre las fechas del receptor."
	
	| desde |
	
	desde := self fechaDesde.
	[desde <= self fechaHasta] whileTrue: [
		self descargarActualizacionDeFecha: desde.
		self sincronizarDatosDeFecha: desde.
		desde := desde addDays: 1
		]
]

{ #category : #'sin categoria' }
Synchronizer >> fechaDesde [

	^fechaDesde
]

{ #category : #'sin categoria' }
Synchronizer >> fechaHasta [

	^fechaHasta
]

{ #category : #'sin categoria' }
Synchronizer >> fileNameFor: unaFecha [

	| monthIndexString dayString |
	
	monthIndexString := '0', unaFecha monthIndex printString.
	monthIndexString := monthIndexString copyFrom: monthIndexString size - 1 to: monthIndexString size.
	dayString := '0', unaFecha dayOfMonth printString.
	dayString := dayString copyFrom: dayString size - 1 to: dayString size.
	^unaFecha year printString, monthIndexString, dayString, '.zip'
]

{ #category : #'sin categoria' }
Synchronizer >> inicializarClaseASincronizar: aExternalDatabaseSubclass desde: unaFecha hasta: otraFecha [

	claseASincronizar:= aExternalDatabaseSubclass.
	fechaDesde := unaFecha.
	fechaHasta := otraFecha
]

{ #category : #'sin categoria' }
Synchronizer >> mapaDeSincronizaciones [
	"Devuelve un mapa para asocior el prefijo del archivo con el método que se usa para sincronizar."

	^self claseASincronizar mapaDeSincronizaciones
]

{ #category : #'sin categoria' }
Synchronizer >> registrarSincronizacionDeFecha: unaFecha [

	| sincronizacion |
	
	sincronizacion := SynchronizationDatabase entity: self claseASincronizar date: TimeStamp now synchronizationDate: unaFecha.
	sincronizacion store
]

{ #category : #'sin categoria' }
Synchronizer >> sincronizarDatosDeFecha: unaFecha [
	"Sincroniza los datos según los archivos previamente descargados y registra la sincronizacion para unaFecha."
	
	| fileNames |
	
	fileNames := (FileDirectory on: self claseASincronizar fullPath) fileNames.
	fileNames asSortedCollection asOrderedCollection reverse do: [:fileName | | prefijo |
		prefijo := self claseASincronizar prefijo: fileName.
		self claseASincronizar perform: (self mapaDeSincronizaciones at: prefijo) with: fileName].
	(FileDirectory on: self claseASincronizar fullPath) deleteLocalFiles.
	self registrarSincronizacionDeFecha: unaFecha
			

]
