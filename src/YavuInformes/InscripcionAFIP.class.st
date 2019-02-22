Class {
	#name : #InscripcionAFIP,
	#superclass : #ExternalDatabaseObject,
	#instVars : [
		'cuit',
		'denominacion',
		'referencia'
	],
	#category : #'YavuInformes-Persistence'
}

{ #category : #'sin categoria' }
InscripcionAFIP class >> columnsNames [

	^#('cuit' 'denominacion' 'referencia')
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> columnsValuesOf: aStream [

	| cuit denominacion referencia |
	
	cuit := aStream next: 11.
	denominacion := aStream next: 30.
	referencia := aStream next: 10.
	^cuit printString, ', ', denominacion printString, ', ', referencia printString
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> descripcion [

	^'Padrón AFIP'
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> descripcionNoInformado [

	^'No Informado'
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> existenDatosPara: unCliente [
	"Devuelve true si existen datos en la BD del receptor para unCliente."
	
	^((self numeroDeDocumento: unCliente cuit) = self inexistente) not
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> fullPath [
	"Devuelve le path donde se vana guardar las sincronizaciones descargadas de la web."

	^self actualizacionesPath, '\afip'
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> inexistente [

	^self new
		referencia: '0000000000';
		denominacion: '';
		cuit: '';
		yourself
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> mapaDeSincronizaciones [
	"Devuelve un mapa para asocior el prefijo del archivo con el método que se usa para sincronizar."

	^super mapaDeSincronizaciones
		at: 'archivo' put: #sincronizarDatosFromFileName:;
		yourself
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> nombreDeColumnaDeDocumento [

	^'CUIT'
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> nombreDeColumnaDeNombre [

	^'DENOMINACION'
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> nombreDeTabla [
	"Devuelve el nombre de la tabla donde persisten las instancias del receptor."

	^'InscripcionAFIP'
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> numeroDeDocumento: unNumero [

	| result |
	
	^(result := super numeroDeDocumento: unNumero) notEmpty ifTrue: [result first] ifFalse: [self inexistente]
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> referencias [
	"Devuelve un mapa entre el codigo y la descripcion de la referencia.
	Estas referencias fueron obtenidas de http://www.afip.gob.ar/genericos/cInscripcion/archivoCompleto.asp."
	
	^Dictionary new
		at: 'NI' put: 'No Inscripto';
		at: 'N' put: 'No Inscripto';		
		at: 'AC' put: 'Activo';
		at: 'S' put: 'Activo';	
		at: 'EX' put: 'Exento';				
		at: 'NA' put: 'No alcanzado';							
		at: 'XN' put: 'Exento no alcanzado';	
		at: 'AN' put: 'Activo no alcanzado';
		at: 'NC' put: 'No corresponde';
		at: '00' put: 'No informado';
		yourself
]

{ #category : #'as yet unclassified' }
InscripcionAFIP class >> sincronizarDatosFromFileName: aFileName [

	| file i |
	
	[file := MultiByteFileStream fileNamed: self fullPath, '\', aFileName.
	file open.
	file ascii.
	file converter: Latin1TextConverter new.
	BaseDeDatos current open.
	i:= 1.
	[file atEnd not] whileTrue: [
		BaseDeDatos current connection startTransaction.
		BaseDeDatos current execute: 'INSERT INTO inscripcionafip (', self columnsHeader, ') VALUES (', (self columnsValuesOf: file), ')'.
		file nextLine.
		i := i + 1.
		i = 100000 ifTrue: [ 
			BaseDeDatos current connection commit.
			BaseDeDatos current connection startTransaction.
			i:= 1 ]
	]] ensure: [file close.
				BaseDeDatos current connection commit]
]

{ #category : #'sin categoria' }
InscripcionAFIP class >> url [

^'http://www.afip.gob.ar/genericos/cInscripcion/archivoCompleto.asp'
]

{ #category : #'sin categoria' }
InscripcionAFIP >> = anExternalDatabaseObject [
	"Answer true if the receiver is equal to anExternalDatabaseObject."
	
	^super = anExternalDatabaseObject and: [
		self referencia = anExternalDatabaseObject referencia]

]

{ #category : #'sin categoria' }
InscripcionAFIP >> actividadMonotributo [
	"Devuelve la descripcion de referencia respecto de la actividad de monotributo."
	
	^self referencias at: self siglaActividadMonotributo ifAbsent: [self descripcionNoInformado]
]

{ #category : #accessing }
InscripcionAFIP >> cuit [
	
	^ cuit
]

{ #category : #accessing }
InscripcionAFIP >> cuit: anObject [
	
	cuit := anObject
]

{ #category : #accessing }
InscripcionAFIP >> denominacion [
	
	^ denominacion
]

{ #category : #accessing }
InscripcionAFIP >> denominacion: anObject [
	
	denominacion := anObject
]

{ #category : #'sin categoria' }
InscripcionAFIP >> descripcionNoInformado [

	^self class descripcionNoInformado
]

{ #category : #'sin categoria' }
InscripcionAFIP >> descriptionActividadMonotributo [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #actividadMonotributo;
        	label: 'Actividad Monotributo';
        	priority: 150;
		beReadonly;
        	yourself
]

{ #category : #'sin categoria' }
InscripcionAFIP >> descriptionCUIT [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #cuit;
        	label: 'CUIT';
        	priority: 100;
		beReadonly;
		beHidden;
		beBDMapping;
        	yourself
]

{ #category : #'sin categoria' }
InscripcionAFIP >> descriptionDenominacion [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #denominacion;
        	label: 'Denominación';
        	priority: 190;
		beReadonly;
		beHidden;
		beBDMapping;
        	yourself
]

{ #category : #'sin categoria' }
InscripcionAFIP >> descriptionEmpleador [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #empleador;
        	label: 'Empleador';
        	priority: 140;
		beReadonly;
        	yourself
]

{ #category : #'sin categoria' }
InscripcionAFIP >> descriptionGanancias [
	"Devuelve un objeto que describe la representación de la variable referencia del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #ganancias;
        	label: 'Impuesto Ganancias';
        	priority: 100;
		beReadonly;
        	yourself
]

{ #category : #'sin categoria' }
InscripcionAFIP >> descriptionIntegranteSociedad [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de monotributo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #integranteSociedad;
        	label: 'Integrante Sociedad';
        	priority: 130;
		beReadonly;
        	yourself
]

{ #category : #'sin categoria' }
InscripcionAFIP >> descriptionIva [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de IVA del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #iva;
        	label: 'Impuesto al IVA';
        	priority: 110;
		beReadonly;
        	yourself
]

{ #category : #magritte }
InscripcionAFIP >> descriptionMonotributo [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de monotributo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #monotributo;
        	label: 'Monotributo';
        	priority: 120;
		beReadonly;
        	yourself
]

{ #category : #magritte }
InscripcionAFIP >> descriptionReferencia [
	"Devuelve un objeto que describe la representación de la variable referencia del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #referencia;
        	label: 'Referencia AFIP';
        	priority: 100;
		beReadonly;
		beHidden;
		beBDMapping;
        	yourself
]

{ #category : #'as yet unclassified' }
InscripcionAFIP >> documento [

	^self cuit
]

{ #category : #'sin categoria' }
InscripcionAFIP >> empleador [
	"Devuelve la descripcion de referencia respecto de la sigla de empleador."
	
	^self referencias at: self siglaEmpleador ifAbsent: [self descripcionNoInformado]
]

{ #category : #'sin categoria' }
InscripcionAFIP >> ganancias [
	"Devuelve la descripcion de referencia respecto del impuesto a las ganancias."
	
	^self referencias at: self siglaGanancias ifAbsent: [self descripcionNoInformado]
]

{ #category : #'sin categoria' }
InscripcionAFIP >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity."
	
	^super hash bitXor: self referencia hash
]

{ #category : #'sin categoria' }
InscripcionAFIP >> integranteSociedad [
	"Devuelve la descripcion de referencia respecto del integrante sociedad."
	
	^self referencias at: self siglaIntegranteSociedad ifAbsent: [self descripcionNoInformado]
]

{ #category : #'sin categoria' }
InscripcionAFIP >> iva [
	"Devuelve la descripcion de referencia respecto del impuesto al IVA."
	
	^self referencias at: self siglaIVA ifAbsent: [self descripcionNoInformado]
]

{ #category : #'sin categoria' }
InscripcionAFIP >> monotributo [
	"Devuelve la descripcion de referencia respecto de la sigla monotributo."
	
	^self referencias at: self siglaMonotributo ifAbsent: ['Monotributo ', self siglaMonotributo] 
]

{ #category : #accessing }
InscripcionAFIP >> referencia [
	
	^ referencia
]

{ #category : #accessing }
InscripcionAFIP >> referencia: anObject [
	
	referencia := anObject
]

{ #category : #'sin categoria' }
InscripcionAFIP >> referencias [
	"Devuelve un mapa entre el codigo y la descripcion de la referencia."
	
	^self class referencias
]

{ #category : #'sin categoria' }
InscripcionAFIP >> siglaActividadMonotributo [
	"Devuelve la sigla de referencia correspondiente al código de empleador."
	
	^self referencia copyFrom: 9 to: 10
]

{ #category : #'sin categoria' }
InscripcionAFIP >> siglaEmpleador [
	"Devuelve la sigla de referencia correspondiente al código de empleador."
	
	^self referencia copyFrom: 8 to: 8
]

{ #category : #'sin categoria' }
InscripcionAFIP >> siglaGanancias [
	"Devuelve la sigla de referencia correspondiente al código de ganancias."
	
	^self referencia copyFrom: 1 to: 2
]

{ #category : #'sin categoria' }
InscripcionAFIP >> siglaIVA [
	"Devuelve la sigla de referencia correspondiente al código de iva."
	
	^self referencia copyFrom: 3 to: 4
]

{ #category : #'sin categoria' }
InscripcionAFIP >> siglaIntegranteSociedad [
	"Devuelve la sigla de referencia correspondiente al código de monotributo."
	
	^self referencia copyFrom: 7 to: 7
]

{ #category : #'sin categoria' }
InscripcionAFIP >> siglaMonotributo [
	"Devuelve la sigla de referencia correspondiente al código de monotributo."
	
	^self referencia copyFrom: 5 to: 6
]

{ #category : #'sin categoria' }
InscripcionAFIP >> workspaceParaInportar [

	| file newFile |

[file := MultiByteFileStream fileNamed: 'C:\FV\Desarrollo\Sistemas YavuSoft\YavuInformes\External Resources\afipReducido.txt'.
newFile := MultiByteFileStream newFileNamed: 'C:\FV\Desarrollo\Sistemas YavuSoft\YavuInformes\External Resources\insertsAfip.sql'.
file open.
newFile open.
[file atEnd not] whileTrue: [ | line |
	line := file nextLine.
	newFile 
		nextPutAll: 'INSERT INTO INSCRIPCIONAFIP (CUIT, DENOMINACION, REFERENCIA) VALUES (';
		nextPutAll: (line contents copyFrom: 1 to: 11) printString, ',', (line contents copyFrom: 12 to: 41) trimBoth printString, ',', (line contents copyFrom: 42 to: line contents size) printString, ');';
		cr.
	]] ensure: [
		file close.
		newFile close]
	

]
