Class {
	#name : #DatosPadronBCRA,
	#superclass : #ExternalDatabaseObject,
	#instVars : [
		'denom',
		'cuit'
	],
	#category : #'YavuInformes-Persistence'
}

{ #category : #'sin categoria' }
DatosPadronBCRA class >> columnsNames [

	^#('cuit' 'denom' 'marca')
]

{ #category : #'sin categoria' }
DatosPadronBCRA class >> descripcion [

	^'Padrón BCRA'
]

{ #category : #'as yet unclassified' }
DatosPadronBCRA class >> existenDatosPara: unCliente [
	"Devuelve true si existen datos en la BD del receptor para unCliente."
	
	^((self numeroDeDocumento: unCliente cuit) first = self inexistente) not
]

{ #category : #'sin categoria' }
DatosPadronBCRA class >> inexistente [

	^self new
		denom: '';
		cuit: '';
		yourself
]

{ #category : #'sin categoria' }
DatosPadronBCRA class >> nombreDeColumnaDeDocumento [

	^'CUIT'
]

{ #category : #'sin categoria' }
DatosPadronBCRA class >> nombreDeColumnaDeNombre [

	^'DENOM'
]

{ #category : #'sin categoria' }
DatosPadronBCRA class >> nombreDeTabla [
	"Devuelve el nombre de la tabla donde persisten las instancias del receptor."

	^'PadronBCRA'
]

{ #category : #accessing }
DatosPadronBCRA >> cuit [
	
	^ cuit
]

{ #category : #accessing }
DatosPadronBCRA >> cuit: anObject [
	
	cuit := anObject
]

{ #category : #accessing }
DatosPadronBCRA >> denom [
	
	^ denom
]

{ #category : #accessing }
DatosPadronBCRA >> denom: anObject [
	
	denom := anObject
]

{ #category : #'sin categoria' }
DatosPadronBCRA >> denominacion [
	
	^self denom
]

{ #category : #'sin categoria' }
DatosPadronBCRA >> descriptionCUIT [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #cuit;
        	label: 'CUIT';
        	priority: 100;
		beReadonly;
		beBDMapping;
        	yourself
]

{ #category : #'sin categoria' }
DatosPadronBCRA >> descriptionDenominacion [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #denom;
        	label: 'Denominación';
        	priority: 190;
		beReadonly;
		beBDMapping;
        	yourself
]

{ #category : #'as yet unclassified' }
DatosPadronBCRA >> documentNumber [ 

	^self cuit
]

{ #category : #'as yet unclassified' }
DatosPadronBCRA >> documento [

	^self cuit
]
