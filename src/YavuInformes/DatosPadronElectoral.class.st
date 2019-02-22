Class {
	#name : #DatosPadronElectoral,
	#superclass : #ExternalDatabaseObject,
	#instVars : [
		'direccion',
		'numdoc',
		'nombre',
		'localidad',
		'profesion',
		'provincia',
		'sexo'
	],
	#category : #'YavuInformes-Persistence'
}

{ #category : #'sin categoria' }
DatosPadronElectoral class >> descripcion [

	^'Padrón Electoral'
]

{ #category : #'as yet unclassified' }
DatosPadronElectoral class >> existenDatosPara: unCliente [
	"Devuelve true si existen datos en la BD del receptor para unCliente."
	
	unCliente isNaturalPerson ifFalse: [ ^false ].
	^((self numeroDeDocumento: unCliente dni sexo: unCliente sex) = self inexistente) not
]

{ #category : #'sin categoria' }
DatosPadronElectoral class >> mapFields [
	"Answer the mappings between the recevier atributes and the database field."

    ^super mapFields
		at: 'NOMDOC' put: 'setNumeroDeDocumento:';
		at: 'SEXO' put: 'setSexo:';
		at: 'CLASE' put: 'setClase:';		
		at: 'NOMBRE' put: 'setNombre:';
		at: 'DIRECCION' put: 'setDireccion:';
		at: 'LOCALIDAD' put: 'setLocalidad:';
		at: 'PROVINCIA' put: 'setProvincia:';		
		at: 'PROFESION' put: 'setProfesion:';
		yourself			
]

{ #category : #'sin categoria' }
DatosPadronElectoral class >> nombreDeColumnaDeDocumento [

	^'NUMDOC'
]

{ #category : #'sin categoria' }
DatosPadronElectoral class >> nombreDeTabla [
	"Privado - Devuelve el nombre de la tabla donde se persisten las instancias del repector."

	^'PADRON2009'
]

{ #category : #'as yet unclassified' }
DatosPadronElectoral class >> numeroDeDocumento: unNumero [

	|  result dni dniSize|
	dniSize := unNumero size + 7.
	dni := '0000000', unNumero copyFrom: dniSize - 7 to: dniSize.
	result := self yavuSystem readManyOf: self where: [:each | each numdoc  = dni].
	^result notEmpty ifTrue: [result] ifFalse: [result asOrderedCollection add: self inexistente; yourself]
	

	
]

{ #category : #'as yet unclassified' }
DatosPadronElectoral class >> numeroDeDocumento: unNumero sexo: sexo [

	| result dni dniSize|
	dniSize := unNumero size + 7.
	dni := '0000000', unNumero copyFrom: dniSize - 7 to: dniSize.
	result := self yavuSystem readManyOf: self where: [:each | each numdoc  = dni AND: [each sexo = sexo]].
	^result notEmpty ifTrue: [result] ifFalse: [result asOrderedCollection add: self inexistente; yourself]
]

{ #category : #'as yet unclassified' }
DatosPadronElectoral >> bornYear [

	| clase |
	
	clase := self atributos at: #clase.
	clase size = 4 ifTrue: [^clase asNumber].
	clase size = 3 ifTrue: [^( '1', clase) asNumber].
	clase size = 2 ifTrue: [^( '19', clase) asNumber].
	^0	
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> claseDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #clase;
        	label: 'Clase';
        	priority: 120;
		beReadonly;
		beBDMapping;
        	yourself
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> cuit [

	^(CustomerType atCodigo: self sexo) cuitNumberOf: self numdoc  
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> denominacion [
	
	^self nombre
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>
	^ MAPriorityContainer new
		label: self class label;
		yourself
]

{ #category : #accessing }
DatosPadronElectoral >> direccion [
	
	^ direccion
]

{ #category : #accessing }
DatosPadronElectoral >> direccion: anObject [
	
	direccion := anObject
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> direccionDescription [
	"Devuelve un objeto que describe la representación de la variable direccion del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #direccion;
        	label: 'Dirección';
        	priority: 130;
		beReadonly;
		beBDMapping;		
        	yourself
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> dniDescription [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #numdoc;
        	label: 'DNI';
        	priority: 100;
		beReadonly;
		beBDMapping;
        	yourself
]

{ #category : #'as yet unclassified' }
DatosPadronElectoral >> documento [

	^self numdoc
]

{ #category : #accessing }
DatosPadronElectoral >> localidad [
	
	^ localidad
]

{ #category : #accessing }
DatosPadronElectoral >> localidad: anObject [
	
	localidad := anObject
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> localidadDescription [
	"Devuelve un objeto que describe la representación de la variable direccion del receptor."
	
	<magritteDescription>
	^MAStringDescription new 
        	accessor: #localidad;
        	label: 'Localidad';
        	priority: 140;
		beReadonly;
		beBDMapping;		
        	yourself
]

{ #category : #accessing }
DatosPadronElectoral >> nombre [
	
	^ nombre
]

{ #category : #accessing }
DatosPadronElectoral >> nombre: anObject [
	
	nombre := anObject
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> nombreDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."
	
	<magritteDescription>
	^MAStringDescription new 
        	accessor: #nombre;
        	label: 'Nombre';
        	priority: 100;
		beReadonly;
		beBDMapping;				
        	yourself
]

{ #category : #accessing }
DatosPadronElectoral >> numdoc [
	
	^ numdoc
]

{ #category : #accessing }
DatosPadronElectoral >> numdoc: anObject [
	
	numdoc := anObject
]

{ #category : #'as yet unclassified' }
DatosPadronElectoral >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

 	aStream 
		nextPutAll: self class descripcion;
		nextPutAll: ' - ';
		nextPutAll: self nombre;
		nextPutAll: ' - ';
		nextPutAll: self numdoc
]

{ #category : #accessing }
DatosPadronElectoral >> profesion [
	
	^ profesion
]

{ #category : #accessing }
DatosPadronElectoral >> profesion: anObject [
	
	profesion := anObject
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> profesionDescription [
	"Devuelve un objeto que describe la representación de la variable profesión del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #profesion;
        	label: 'Profesión';
        	priority: 160;
		beReadonly;
		beBDMapping;		
        	yourself
]

{ #category : #accessing }
DatosPadronElectoral >> provincia [
	
	^ provincia
]

{ #category : #accessing }
DatosPadronElectoral >> provincia: anObject [
	
	provincia := anObject
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> provinciaDescription [
	"Devuelve un objeto que describe la representación de la variable provincia del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #provincia;
        	label: 'Provincia';
        	priority: 150;
		beReadonly;
		beBDMapping;		
        	yourself
]

{ #category : #accessing }
DatosPadronElectoral >> sexo [
	
	^ sexo
]

{ #category : #accessing }
DatosPadronElectoral >> sexo: anObject [
	
	sexo := anObject
]

{ #category : #'sin categoria' }
DatosPadronElectoral >> sexoDescription [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #sexo;
        	label: 'Sexo';
        	priority: 120;
		beReadonly;
		beBDMapping;
        	yourself
]
