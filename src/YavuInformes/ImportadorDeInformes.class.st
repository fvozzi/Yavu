Class {
	#name : #ImportadorDeInformes,
	#superclass : #Transaction,
	#instVars : [
		'informes',
		'clientes',
		'file',
		'errores',
		'incluyeEncabezado',
		'tiposDeOperacion',
		'calidades',
		'sistemaActual',
		'currentCustomers'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
ImportadorDeInformes class >> comercio: unComercio fecha: unaFecha file: aFileStream [
	
	^(self entity: unComercio date: unaFecha) initializeFile: aFileStream
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> calidades [

	calidades isNil ifTrue: [self inicializarCalidades].
	^calidades
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> cantidadDeErrores [
	"Devuelve la cantidad de errores procesados."
	
	^self errores size
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> cantidadDeNuevosClientes [
	"Devuelve la cantidad de clientes que no existían en la BD y que se crearán automaticamente al procesar los informes del receptor."
	
	^self clientes size
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> clientes [
	^ clientes
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> comercio [
	"Devuelve el comercio del receptor."
	
	^self entity
]

{ #category : #'as yet unclassified' }
ImportadorDeInformes >> crearClienteDesde: unArray [
	"Crea un nuevo informe desde los datos de unArray. Si el cliente no existe también lo crea."
	
	| cliente customerType documentNumber cuit |

	(unArray at: 1) size = 11 
		ifTrue: [
			customerType := CustomerType tipoSegunCUIT: (unArray at: 1).
			documentNumber := customerType documentoSegunCUIT: (unArray at: 1).
			cuit := (unArray at: 1)]
		ifFalse: [
			customerType := CustomerType atCodigo: (unArray at: 3).
			documentNumber := (unArray at: 1).
			cuit := customerType cuitNumberOf: (unArray at: 1)].
	cliente := Person searchCustomerByCUIT: cuit.
	cliente isNil ifTrue: [
		cliente := customerType newCustomerOfNumber: documentNumber name: (unArray at: 2).
		clientes add: cliente].
	^cliente
]

{ #category : #'as yet unclassified' }
ImportadorDeInformes >> crearInformeDesde: unArray [
	"Crea un nuevo informe desde los datos de unArray. Si el cliente no existe tambiÃ©n lo crea."
	
	| informe |
	unArray size < 7 ifTrue: [^self].
	[informe := (FinancialSituation 
		comercio: self comercio
		fecha:  self date
		cliente: (self crearClienteDesde: unArray)
		montoAdeudado: (unArray at: 6) trimBoth asNumber
		fechaUltimoPago: (self fechaDesde: (unArray at: 7) trimBoth)).
	informe notNil ifTrue: [
		informes add: (informe
						type: (self financialSituationTypeFrom: informe);
						operationType: (self tiposDeOperacion at: (unArray at: 4) trimBoth) ;
						operationCharacter: (self calidades at: (unArray at: 5) trimBoth);
						yourself)
		]] on: Error do: [:ex | self errores add: ex messageText, ' en la linea ', unArray asString]
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> currentCustomers [

	currentCustomers isNil  ifTrue: [self initializeCurrentCustomers].
	^currentCustomers
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> currentCustomers: aDictionaryOfPersons [

	currentCustomers:= aDictionaryOfPersons 
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> errores [ 

	^errores
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> fechaDesde: unString [

	^Date readFrom: (ReadStream on: unString) pattern: 'dd/mm/yyyy'
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> file [
	^ file
]

{ #category : #'as yet unclassified' }
ImportadorDeInformes >> financialSituationTypeFrom: aFinantialSituation [

	^aFinantialSituation montoAdeudado = -1 ifTrue: [ MonthlyDebt ] ifFalse: [ AmountOfDebt ]
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> incluyeEncabezado [
	"Devuelve un boleano indicando si el archivo del receptor incluye encabezado."
	
	^incluyeEncabezado
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> incluyeEncabezado: aBoolean [
	"Setea un boleano indicando si el archivo del receptor incluye encabezado."
	
	incluyeEncabezado:= aBoolean
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> informes [
	^ informes
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> inicializarCalidades [

	calidades := OperationCharacter all classifiedBy: [:each | each code]
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> inicializarSistemaActual [
	"Asigna el sistema (root) desde la sesión actual."
	
	sistemaActual:= self sistema
	
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> inicializarTiposDeOperacion [

	tiposDeOperacion := OperationType all classifiedBy: [:each | each code]
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> initialize [
	"Initialize the receiver instance."
	
	super initialize.
	clientes:= OrderedCollection new.
	informes:= OrderedCollection new.
	errores:= OrderedCollection new.
	incluyeEncabezado:= false.
	"self subscribirAnuncioEntidadAgregada"
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> initializeCurrentCustomers [

	currentCustomers:= Person all classifiedBy: [:each | each cuit]
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> initializeFile: aFile [
	"Inicializa la clase del receptor con aFile."

	file:= aFile
]

{ #category : #'as yet unclassified' }
ImportadorDeInformes >> nextLineAsArrayOrStream [
	^ self file nextLine subStrings: ','
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> numberOfReports [
	"Devuelve la cantidad de informes procesados."
	
	^self informes size
]

{ #category : #'as yet unclassified' }
ImportadorDeInformes >> procesar [
	"Create the receiver instances class."

	file reset.
	self incluyeEncabezado
		ifTrue: [ self file nextLine ].
	[ self file atEnd not ] whileTrue: [ self crearInformeDesde: self nextLineAsArrayOrStream ]
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> sistemaActual [
	"Cacheamos el sistema porque vamos a importar masivamente."
	
	sistemaActual isNil ifTrue: [self inicializarSistemaActual].
	^sistemaActual
]

{ #category : #nil }
ImportadorDeInformes >> subscribirAnuncioEntidadAgregada [
	"Privado - Subscribe al announcer para ser notificado cuando se crea un cliente nuevo."

	YavuPersistentSubsystem singleton announcer 
		when: EntidadAdded 
		do: [:anuncio | self clientes add: anuncio entity]
]

{ #category : #'sin categoria' }
ImportadorDeInformes >> tiposDeOperacion [

	tiposDeOperacion isNil ifTrue: [self inicializarTiposDeOperacion].
	^tiposDeOperacion
]
