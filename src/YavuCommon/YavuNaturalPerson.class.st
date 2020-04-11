Class {
	#name : #YavuNaturalPerson,
	#superclass : #YavuPerson,
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
YavuNaturalPerson class >> defaultSearchLabel [

	^'DNI'
]

{ #category : #'sin categoria' }
YavuNaturalPerson class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Persona Física'
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson class >> newFromElectoralRollData: anElectoralRoll [

	^(self named: anElectoralRoll name)
		dni: anElectoralRoll dni;
		customerType: anElectoralRoll sexInNaturalPersonFormat;
		cuit: anElectoralRoll cuit;
		yourself
]

{ #category : #'sin categoria' }
YavuNaturalPerson class >> nombre: unNombre dni: unNumeroDeDNI sexo: unSexo [
	"Devuelve una nueva instancia del receptor."
	
	^(self named: unNombre) inicializarDNI: unNumeroDeDNI sexo: unSexo
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson class >> possibleSearchSelectors [

	^super possibleSearchSelectors 
		at: 'DNI' put: #dni;
		yourself
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson class >> searchCustomerByDNI: aDNILiteral [
	"Devuelve una instancia del receptor desde la BD cuyo cuit es igual a aCUITLiteral."

	^self yavuSystem readOneOf: self where: [:each | each dni = aDNILiteral]
]

{ #category : #accessing }
YavuNaturalPerson >> address [
	
	^ address
]

{ #category : #accessing }
YavuNaturalPerson >> address: anObject [
	
	address := anObject
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> addressDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #address;
		label: 'Dirección';
		priority: 200;
		yourself
		

]

{ #category : #accessing }
YavuNaturalPerson >> birthday [
	
	^ birthday
]

{ #category : #accessing }
YavuNaturalPerson >> birthday: anObject [
	
	birthday := anObject
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> birthdayDescription [
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
YavuNaturalPerson >> city [
	
	^ city
]

{ #category : #accessing }
YavuNaturalPerson >> city: anObject [
	
	city := anObject
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> cityDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #city;
		label: 'Localidad';
		priority: 200;
		yourself
		

]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> cuitDescription [
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
YavuNaturalPerson >> customerType [
	^ customerType
]

{ #category : #'sin categoria' }
YavuNaturalPerson >> customerType: aCustomerType [
	
	customerType:= aCustomerType
]

{ #category : #'sin categoria' }
YavuNaturalPerson >> dni [
	^ dni
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> dni: aDNINumber [

	dni := aDNINumber
]

{ #category : #'sin categoria' }
YavuNaturalPerson >> dniDescription [
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
YavuNaturalPerson >> documentNumber [
	"Devuelve el numero de documento del receptor."
	
	^self dni
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> inicializarCUIT [

	| customerTypeClass |
	
	customerTypeClass  := (CustomerType atCodigo: self sex) ifNil: [^nil].
	self cuit: (customerTypeClass cuitNumberOf: self dni)
]

{ #category : #'sin categoria' }
YavuNaturalPerson >> inicializarDNI: unNumeroDeDNI sexo: unSexo [

	dni:= unNumeroDeDNI.
	customerType:= unSexo
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> isNaturalPerson [

	^true
]

{ #category : #accessing }
YavuNaturalPerson >> job [
	
	^ job
]

{ #category : #accessing }
YavuNaturalPerson >> job: anObject [
	
	job := anObject
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> jobDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #job;
		label: 'Trabajo';
		priority: 240;
		yourself
]

{ #category : #accessing }
YavuNaturalPerson >> occupation [
	
	^ occupation
]

{ #category : #accessing }
YavuNaturalPerson >> occupation: anObject [
	
	occupation := anObject
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> occupationDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #occupation;
		label: 'Ocupación';
		priority: 220;
		yourself
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> setCustomerType: aCustomerTypeClass [
	"Setea el customer type class desde afuera y fuerza el recalculo del numero de CUIT."

	self
		customerType: aCustomerTypeClass code;
		cuit: (aCustomerTypeClass cuitNumberOf: self dni);
		yourself
]

{ #category : #'sin categoria' }
YavuNaturalPerson >> sex [
	^self  customerType
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> sex: aSexDescription [ 

	self  customerType: aSexDescription 
]

{ #category : #'sin categoria' }
YavuNaturalPerson >> sexoDescription [
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
YavuNaturalPerson >> spouse [
	
	^ spouse
]

{ #category : #accessing }
YavuNaturalPerson >> spouse: anObject [
	
	spouse := anObject
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> spouseDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #spouse;
		label: 'Conyugue';
		priority: 250;
		yourself
]

{ #category : #accessing }
YavuNaturalPerson >> spouseDocumentNumber [
	
	^ spouseDocumentNumber
]

{ #category : #accessing }
YavuNaturalPerson >> spouseDocumentNumber: anObject [
	
	spouseDocumentNumber := anObject
]

{ #category : #'as yet unclassified' }
YavuNaturalPerson >> spouseDocumentNumberDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #spouseDocumentNumber;
		label: 'DNI Conyugue';
		priority: 260;
		yourself
]

{ #category : #'sin categoria' }
YavuNaturalPerson >> tipoDocumento [

	^'DNI'
]
