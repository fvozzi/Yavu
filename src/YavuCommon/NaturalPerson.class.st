Class {
	#name : #NaturalPerson,
	#superclass : #Person,
	#instVars : [
		'dni',
		'customerType',
		'address',
		'birthday',
		'occupation',
		'job',
		'spouse',
		'spouseDocumentNumber',
		'city'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'as yet unclassified' }
NaturalPerson class >> defaultSearchLabel [

	^'DNI'
]

{ #category : #'sin categoria' }
NaturalPerson class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Persona Física'
]

{ #category : #'as yet unclassified' }
NaturalPerson class >> newFromElectoralRollData: anElectoralRoll [

	^(self named: anElectoralRoll name)
		dni: anElectoralRoll dni;
		customerType: anElectoralRoll sexInNaturalPersonFormat;
		cuit: anElectoralRoll cuit;
		yourself
]

{ #category : #'sin categoria' }
NaturalPerson class >> nombre: unNombre dni: unNumeroDeDNI sexo: unSexo [
	"Devuelve una nueva instancia del receptor."
	
	^(self named: unNombre) inicializarDNI: unNumeroDeDNI sexo: unSexo
]

{ #category : #'as yet unclassified' }
NaturalPerson class >> possibleSearchSelectors [

	^super possibleSearchSelectors 
		at: 'DNI' put: #dni;
		yourself
]

{ #category : #'as yet unclassified' }
NaturalPerson class >> searchCustomerByDNI: aDNILiteral [
	"Devuelve una instancia del receptor desde la BD cuyo cuit es igual a aCUITLiteral."

	^self yavuSystem readOneOf: self where: [:each | each dni = aDNILiteral]
]

{ #category : #accessing }
NaturalPerson >> address [
	
	^ address
]

{ #category : #accessing }
NaturalPerson >> address: anObject [
	
	address := anObject
]

{ #category : #'as yet unclassified' }
NaturalPerson >> addressDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #address;
		label: 'Dirección';
		priority: 200;
		yourself
		

]

{ #category : #accessing }
NaturalPerson >> birthday [
	
	^ birthday
]

{ #category : #accessing }
NaturalPerson >> birthday: anObject [
	
	birthday := anObject
]

{ #category : #'as yet unclassified' }
NaturalPerson >> birthdayDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MADateDescription new
		componentClass: MADateSelectorComponent;
		accessor: #birthday;
		label: 'Fecha Nacimiento';
		priority: 210;
		yourself
]

{ #category : #accessing }
NaturalPerson >> city [
	
	^ city
]

{ #category : #accessing }
NaturalPerson >> city: anObject [
	
	city := anObject
]

{ #category : #'as yet unclassified' }
NaturalPerson >> cityDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #city;
		label: 'Localidad';
		priority: 200;
		yourself
		

]

{ #category : #'as yet unclassified' }
NaturalPerson >> cuitDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #cuit;
		label: 'N° CUIL';
		priority: 120;
		beReadonly;
		yourself
]

{ #category : #'sin categoria' }
NaturalPerson >> customerType [
	^ customerType
]

{ #category : #'sin categoria' }
NaturalPerson >> customerType: aCustomerType [
	
	customerType:= aCustomerType
]

{ #category : #'sin categoria' }
NaturalPerson >> dni [
	^ dni
]

{ #category : #'as yet unclassified' }
NaturalPerson >> dni: aDNINumber [

	dni := aDNINumber
]

{ #category : #'sin categoria' }
NaturalPerson >> dniDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #dni;
		label: 'N° Documento';
		priority: 120;
		required: true;
		yourself
]

{ #category : #'sin categoria' }
NaturalPerson >> documentNumber [
	"Devuelve el numero de documento del receptor."
	
	^self dni
]

{ #category : #'as yet unclassified' }
NaturalPerson >> inicializarCUIT [

	| customerTypeClass |
	
	customerTypeClass  := (CustomerType atCodigo: self sex) ifNil: [^nil].
	self cuit: (customerTypeClass cuitNumberOf: self dni)
]

{ #category : #'sin categoria' }
NaturalPerson >> inicializarDNI: unNumeroDeDNI sexo: unSexo [

	dni:= unNumeroDeDNI.
	customerType:= unSexo
]

{ #category : #'as yet unclassified' }
NaturalPerson >> isNaturalPerson [

	^true
]

{ #category : #accessing }
NaturalPerson >> job [
	
	^ job
]

{ #category : #accessing }
NaturalPerson >> job: anObject [
	
	job := anObject
]

{ #category : #'as yet unclassified' }
NaturalPerson >> jobDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #job;
		label: 'Trabajo';
		priority: 240;
		yourself
]

{ #category : #accessing }
NaturalPerson >> occupation [
	
	^ occupation
]

{ #category : #accessing }
NaturalPerson >> occupation: anObject [
	
	occupation := anObject
]

{ #category : #'as yet unclassified' }
NaturalPerson >> occupationDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #occupation;
		label: 'Ocupación';
		priority: 220;
		yourself
]

{ #category : #'as yet unclassified' }
NaturalPerson >> setCustomerType: aCustomerTypeClass [
	"Setea el customer type class desde afuera y fuerza el recalculo del numero de CUIT."

	self
		customerType: aCustomerTypeClass code;
		cuit: (aCustomerTypeClass cuitNumberOf: self dni);
		yourself
]

{ #category : #'sin categoria' }
NaturalPerson >> sex [
	^self  customerType
]

{ #category : #'as yet unclassified' }
NaturalPerson >> sex: aSexDescription [ 

	self  customerType: aSexDescription 
]

{ #category : #'sin categoria' }
NaturalPerson >> sexoDescription [
	"Devuelve un objeto que describe la representación de la variable sexo del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #sex;
		label: 'Sexo' ; 
		priority: 200;
		options: #('M' 'F');
		beSorted;
		beRequired; 
		yourself
]

{ #category : #accessing }
NaturalPerson >> spouse [
	
	^ spouse
]

{ #category : #accessing }
NaturalPerson >> spouse: anObject [
	
	spouse := anObject
]

{ #category : #'as yet unclassified' }
NaturalPerson >> spouseDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #spouse;
		label: 'Conyugue';
		priority: 250;
		yourself
]

{ #category : #accessing }
NaturalPerson >> spouseDocumentNumber [
	
	^ spouseDocumentNumber
]

{ #category : #accessing }
NaturalPerson >> spouseDocumentNumber: anObject [
	
	spouseDocumentNumber := anObject
]

{ #category : #'as yet unclassified' }
NaturalPerson >> spouseDocumentNumberDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #spouseDocumentNumber;
		label: 'DNI Conyugue';
		priority: 260;
		yourself
]

{ #category : #'sin categoria' }
NaturalPerson >> tipoDocumento [

	^'DNI'
]
