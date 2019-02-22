Class {
	#name : #FinancialReport,
	#superclass : #Transaction,
	#instVars : [
		'datosPadronElectoral',
		'datosAFIP',
		'resumenSituacionComercial',
		'whitePagesData',
		'bcraData',
		'bouncedChecks',
		'lostChecks',
		'reportEmissions',
		'scoring',
		'electoralRoll',
		'electoralRollDataReader'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'instance-creation' }
FinancialReport class >> basicFor: aCustomer using: aYavuSystem [
	"Crea una nueva instancia del receptor inicializada con unClienteOrNil."

	^super new basicFor: aCustomer using: aYavuSystem
]

{ #category : #'instance-creation' }
FinancialReport class >> crearInformePorDocumento: unNumeroDeDocumento [
	"Crea un nuevo informe para un cliente cuyo documento es igual a unNumeroDeDocumento y sexo es igual a unSexo."

	| clienteBuscado numeroDocumento |
	numeroDocumento := unNumeroDeDocumento copyWithoutAll: ','.
	numeroDocumento := numeroDocumento copyWithoutAll: '.'.
	[ numeroDocumento := numeroDocumento asNumber asString ]
		on: Error
		do: [ :ex | numeroDocumento := '00000000' ].
	clienteBuscado := self searchCustomerByNumber: numeroDocumento.
	clienteBuscado isNil
		ifTrue: [ clienteBuscado := self newCustomerIfExistsDataForNumber: unNumeroDeDocumento ].
	^ self on: clienteBuscado
]

{ #category : #queries }
FinancialReport class >> existenDatosEnAlgunaBDPara: unCliente [
	"Devuelve true si existe un dato en, al menos, alguna BD externa."
	
	^ExternalDatabaseObject existenDatosEnAlgunaBDPara: unCliente
]

{ #category : #accessing }
FinancialReport class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Reporte financiero'
]

{ #category : #'instance-creation' }
FinancialReport class >> newCustomerIfExistsDataForNumber: unNumeroDeDocumento [
	"Si llegamos acá es porque no existe el cliente en la tabla de personas. Entonces lo creamos y chequeamos si tenemos datos en alguna otra BD. Si tenemos se ingresa y sino, no."
	
	unNumeroDeDocumento size = 11 
		ifTrue: [ ^self newOrganizationIfExistsDataForNumber: unNumeroDeDocumento ].
	(unNumeroDeDocumento size between: 6 and: 9)
		ifTrue: [ ^self newNaturalPersonIfExistsDataForNumber: unNumeroDeDocumento ] .
	^nil
]

{ #category : #'instance-creation' }
FinancialReport class >> newNaturalPersonIfExistsDataForNumber: unNumeroDeDocumento [
	| newCustomer |
	"Si llegamos acá es porque no existe el cliente en la tabla de personas. Entonces lo creamos y chequeamos si tenemos datos en alguna otra BD. Si tenemos se ingresa y sino, no."

	newCustomer := CustomerTypeNotDeclared newCustomerOfNumber: unNumeroDeDocumento.
	self updateCuitTo: newCustomer.
	^ newCustomer customerTypeClass isNotDeclared
		ifTrue: [  ]
		ifFalse: [ newCustomer ]
]

{ #category : #'instance-creation' }
FinancialReport class >> newOrganizationIfExistsDataForNumber: unNumeroDeDocumento [
	"Si llegamos acá es porque no existe el cliente en la tabla de personas. Entonces lo creamos y chequeamos si tenemos datos en alguna otra BD. Si tenemos se ingresa y sino, no."

	| newCustomer |
	
	newCustomer := Organization newCustomerOfNumber: unNumeroDeDocumento.
	^(self  existenDatosEnAlgunaBDPara: newCustomer)
		ifTrue: [newCustomer ]
		ifFalse: [  ]
]

{ #category : #'instance-creation' }
FinancialReport class >> on: unClienteOrNil [
	"Crea una nueva instancia del receptor inicializada con unClienteOrNil."

	^super new initializeCliente: unClienteOrNil
]

{ #category : #queries }
FinancialReport class >> searchCustomerByNumber: numeroDocumento [

	numeroDocumento size = 11 
		ifTrue: [ ^self searchOrganizationByNumber: numeroDocumento ].
	(numeroDocumento size between: 6 and: 9)
		ifTrue: [ ^self searchNaturalPersonbyNumber: numeroDocumento ] .
	^nil
]

{ #category : #queries }
FinancialReport class >> searchNaturalPersonbyNumber: numeroDocumento [
	| clienteBuscado |
	
	clienteBuscado := nil.
	CustomerType allNaturalPersonsTypes
		do: [ :each | 
			clienteBuscado isNil
				ifTrue: [ 
					clienteBuscado := Person searchCustomerByNumber: numeroDocumento customerType: each.
					"Si no tiene tipo, tratamos de buscar el numero de cuit."
					(clienteBuscado notNil and: [clienteBuscado customerTypeClass isNotDeclared]) ifTrue: [ 
						self updateCuitTo: clienteBuscado.
						 ] ]
				].
	^clienteBuscado
]

{ #category : #queries }
FinancialReport class >> searchOrganizationByNumber: numeroDocumento [
	
	^Person searchCustomerByNumber: numeroDocumento customerType: Organization
]

{ #category : #'instance-creation' }
FinancialReport class >> updateCuitTo: aCustomer [

	^ExternalDatabaseObject updateCuitFromAnyDatabaseTo: aCustomer
]

{ #category : #'as yet unclassified' }
FinancialReport >> ageScoring [
	"Suma un máximo de 20 puntos sobre 93."
	
	| age |
	age := self customerAge.	
	self ageScoringMap associationsDo: [ :one | (one key includes: age) ifTrue:  [ ^one value  ]].
	^0
]

{ #category : #'as yet unclassified' }
FinancialReport >> ageScoringMap [
	"DE 18 A 33 - 10 PUNTOS
	DE 24 A 64 - 20 PUNTOS
	DE 65 A 75 - 10 PUNTOS
	DE 76 A 100 - 5 PUNTOS"
	
	^Dictionary  new
		at: (Interval from: 18 to: 23) put: 10;
		at: (Interval from: 24 to: 64) put: 20;
		at: (Interval from: 65 to: 75) put: 10;		
		at: (Interval from: 76 to: 110) put: 5;
		yourself
	

]

{ #category : #'as yet unclassified' }
FinancialReport >> agregarCliente [
	"Privado - Agrega un cliente a la lista de clientes del sistema.
	NOTA: le setea el nombre de alguna de las BD donde encontró datos."
	
	self customer isNaturalPerson ifFalse: [
	self customer name: self nombreODescripcionDeCliente.
	self customer store]
]

{ #category : #accessing }
FinancialReport >> basicFor: aPerson using: aYavuSystem [ 
 
	#needRefactoring.
	self initializeCliente: aPerson.
	self date: Date today.
	electoralRollDataReader := ElectoralRollDataReader new.
	resumenSituacionComercial:= (ResumenSituacionComercial on: self using: aYavuSystem).
	bouncedChecks := aYavuSystem bouncedChecksOf: aPerson.
	lostChecks := aYavuSystem lostChecksOf: aPerson.
	reportEmissions := aYavuSystem reportEmissionsOf: aPerson.
	datosAFIP := aYavuSystem afipDataOf: aPerson.
	electoralRoll := (self electoralRollDataReader valueForCustomer: self customer using: aYavuSystem) basicData.
	self validateAndCreateNewUserUsing: aYavuSystem 
	
	
]

{ #category : #'sin categoria' }
FinancialReport >> bcraCaptcha [

	^self captchasMap at: #bcraCaptcha
]

{ #category : #'as yet unclassified' }
FinancialReport >> bcraChecksScoring [
	"Suma un máximo de 10 puntos sobre 40."

	self bcraData hasChecksBounced ifFalse: [ ^10 ].
	^0
]

{ #category : #'sin categoria' }
FinancialReport >> bcraData [

	^bcraData 
]

{ #category : #'as yet unclassified' }
FinancialReport >> bcraData: aBCRAData [

	bcraData := aBCRAData
]

{ #category : #'as yet unclassified' }
FinancialReport >> bcraScoring [
	"Suma un máximo de 10 puntos sobre 40."

	self bcraData hasCategoryOneOrTwo ifTrue: [ ^10 ].
	self bcraData hasNotInformation ifTrue: [ ^5 ].
	self bcraData hasCategoryGreaterThanTwo ifTrue: [ ^-20 ].
	^0
]

{ #category : #'as yet unclassified' }
FinancialReport >> bouncedCheckScoring [
	"Suma un máximo de 10 puntos sobre 40."
	
	^self bouncedChecks isEmpty ifTrue: [ 10 ] ifFalse: [ 0 ]
]

{ #category : #accessing }
FinancialReport >> bouncedChecks [
	
	bouncedChecks ifNil: [ self initializeBouncedChecks ].
	^bouncedChecks
]

{ #category : #accessing }
FinancialReport >> bouncedChecks: anObject [
	
	bouncedChecks := anObject
]

{ #category : #'sin categoria' }
FinancialReport >> customer [

	^self entity
]

{ #category : #'as yet unclassified' }
FinancialReport >> customer: aCustomer [

	self entity: aCustomer
]

{ #category : #'as yet unclassified' }
FinancialReport >> customerAge [
	
	| age |
	
	
	age := 0.
	self electoralRoll notNil ifTrue: [ age := [self electoralRoll age asNumber] on: Error do: [ :ex | 0 ] ].
	age > 0 ifTrue: [ ^age ].
	(self datosPadronElectoral = DatosPadronElectoral inexistente or: [self datosPadronElectoral clase isNil]) ifTrue: [ ^self estimatedAge ].
 	^Date today year - self datosPadronElectoral bornYear
]

{ #category : #'sin categoria' }
FinancialReport >> datosAFIP [
	"Devuelve los datos del receptor relacionados con la BD de inscripción de AFIP."
	
	datosAFIP isNil ifTrue: [self initializeDatosAFIP].
	^datosAFIP
]

{ #category : #'sin categoria' }
FinancialReport >> datosPadronElectoral [
	"Busca los datos del cliente del receptor en la BD del padrón electoral."
	
	datosPadronElectoral isNil ifTrue: [self initializeDatosPadronElectoral].
	^datosPadronElectoral
]

{ #category : #'as yet unclassified' }
FinancialReport >> defaultScoring [
	"Suma un máximo de 40 puntos sobre 93.
		No existe en base propia 10 puntos
		No tiene cheques rechazados 10 puntos
		Si existe BCRA con cate. 1 a 2 10 puntos
		Si no existe en BCRA (No informado) 5 puntos
		No existe en BCRA cheques 10 puntos."
	
	^self financialSituationsScoring + self bouncedCheckScoring + self bcraScoring + self bcraChecksScoring
]

{ #category : #accessing }
FinancialReport >> electoralRoll [
	
	^ electoralRoll
]

{ #category : #accessing }
FinancialReport >> electoralRoll: anObject [
	
	electoralRoll := anObject
]

{ #category : #accessing }
FinancialReport >> electoralRollDataReader [

	^electoralRollDataReader 
	
]

{ #category : #'as yet unclassified' }
FinancialReport >> estimatedAge [

	| beginDigit number |
	
	self customer isNaturalPerson ifFalse: [ ^30 ].
	beginDigit := self customer dni size = 7 ifTrue:  [ self customer dni copyFrom: 1 to: 2].
	beginDigit := self customer dni size = 6 ifTrue:  [ self customer dni copyFrom: 1 to: 1].
	beginDigit := self customer dni size <= 5 ifTrue:  [ '0'].
	number := [beginDigit asNumber] on: Error do: [ :ex | 0 ].
	number > 32 ifTrue: [ ^23 ].
	number > 6 & (number < 32) ifTrue: [ ^30 ].
	number < 6 ifTrue: [ ^77 ]
]

{ #category : #'as yet unclassified' }
FinancialReport >> financialSituationsScoring [
	"Suma un máximo de 10 puntos sobre 40."
	
	^self resumenSituacionComercial hasAnyDefault ifTrue: [ 0 ] ifFalse: [ 10 ]
]

{ #category : #accessing }
FinancialReport >> initializeBouncedChecks [

	bouncedChecks := self customer bouncedChecks
]

{ #category : #'as yet unclassified' }
FinancialReport >> initializeCliente: unCliente [
	"Inicialize la variable cliente del recepto con unCliente."
	
	"este metodo se puede eliminar y dejar solo el self customer: donde se llama al mismo."
	self customer: unCliente.
	(self customer notNil and: [self customer  name isEmpty]) ifTrue: [self agregarCliente]
]

{ #category : #'as yet unclassified' }
FinancialReport >> initializeDatosAFIP [
	
	datosAFIP := InscripcionAFIP numeroDeDocumento: self customer cuit
]

{ #category : #'as yet unclassified' }
FinancialReport >> initializeDatosPadronElectoral [

	(CustomerType atCodigo: self customer sex) isNotDeclared 
		ifTrue: [
			datosPadronElectoral :=  DatosPadronElectoral numeroDeDocumento: self customer documentNumber.
			datosPadronElectoral ~= 'No existen datos.' ifTrue: [
				self customer 
					customerType: datosPadronElectoral sexo;
					cuit: ((CustomerType atCodigo: datosPadronElectoral sexo) cuitNumberOf: self customer dni) ]]
		ifFalse: [
			datosPadronElectoral := DatosPadronElectoral numeroDeDocumento: self customer documentNumber sexo: self customer sex  ]
	
]

{ #category : #accessing }
FinancialReport >> initializeLostChecks [

	lostChecks := self customer lostChecks
]

{ #category : #accessing }
FinancialReport >> initializeReportEmissions [

	| emissions |
	
	emissions := self customer reportEmissions groupedBy: [ :each | each entity ].
	reportEmissions := Dictionary new.
	emissions keysAndValuesDo: [ :key :values |
		reportEmissions at: key put: values asSortedCollection.	
		 ]
]

{ #category : #'sin categoria' }
FinancialReport >> initializeResumenSituacionComercial [

	resumenSituacionComercial:= ResumenSituacionComercial entity: self customer date: Date today
]

{ #category : #'as yet unclassified' }
FinancialReport >> initializeScoring [

	scoring  := self ageScoring + self defaultScoring + self workScoring + self whitePagesScoring
]

{ #category : #nil }
FinancialReport >> initializeWhitePagesData [ 

	"self datosPadronElectoral = DatosPadronElectoral  inexistente  ifTrue: [^whitePagesData := (Array with: WhitePagesData new)]."
	whitePagesData := WhitePagesData forPerson: self customer padron: self datosPadronElectoral
	
]

{ #category : #accessing }
FinancialReport >> lostChecks [
	
	lostChecks ifNil: [ self initializeLostChecks ].
	^lostChecks
]

{ #category : #accessing }
FinancialReport >> lostChecks: anObject [
	
	lostChecks := anObject
]

{ #category : #'as yet unclassified' }
FinancialReport >> nombreODescripcionDeCliente [
	"Devuelve el nombre del cliente, si este no existe en la BD propia, porque aún no se le ingreso ninguna situación comercial, busca de que BD externa puede mostrar la descripción."
	
	self datosPadronElectoral ~= DatosPadronElectoral inexistente ifTrue: [^self datosPadronElectoral nombre].
	self datosAFIP ~= InscripcionAFIP inexistente ifTrue: [^self datosAFIP denominacion].
	^'Sin Nombre'
]

{ #category : #accessing }
FinancialReport >> reportEmissions [
	
	reportEmissions ifNil: [ self initializeReportEmissions  ].
	^reportEmissions 
]

{ #category : #accessing }
FinancialReport >> reportEmissions: anObject [
	
	reportEmissions := anObject
]

{ #category : #'sin categoria' }
FinancialReport >> resumenSituacionComercial [
	"Busca los datos del cliente del receptor en las situaciones comerciales."
	
	resumenSituacionComercial isNil ifTrue: [self initializeResumenSituacionComercial].
	^resumenSituacionComercial
]

{ #category : #accessing }
FinancialReport >> scoring [
	
	scoring ifNil: [self initializeScoring].
	^scoring
]

{ #category : #accessing }
FinancialReport >> scoring: anObject [
	
	scoring := anObject
]

{ #category : #'sin categoria' }
FinancialReport >> tieneDatos [
	"Devuelve true si el informe se pudo generar para un cliente."
	
	^self customer notNil
]

{ #category : #accessing }
FinancialReport >> validateAndCreateNewUserUsing: aYavuSystem [

	| newCustomer |
	((self customer isNil or: [ self customer name isEmpty ]) and: [self electoralRoll name notEmpty]) ifTrue: [ 
		newCustomer := NaturalPerson newFromElectoralRollData: self electoralRoll.
		aYavuSystem store: newCustomer.
		self customer: newCustomer
		 ]
	
	
]

{ #category : #'sin categoria' }
FinancialReport >> whitePagesData [

	whitePagesData isNil ifTrue: [self initializeWhitePagesData].
	^whitePagesData
]

{ #category : #'as yet unclassified' }
FinancialReport >> whitePagesScoring [
	"Suma un máximo de 3 puntos sobre 93."

	^(self whitePagesData detect: [ :one | one hasData ] ifNone: [ ]) notNil 
		ifTrue: [ 3 ]
		ifFalse: [ 0 ]
]

{ #category : #'as yet unclassified' }
FinancialReport >> workScoring [
	"Suma un máximo 30 puntos sobre 93.	
		SI TIENE TRABAJO ACTIVO 	15 PUNTOS	
		MAS ANTIGÜEDAD	DE 1 A 5 AÑOS	MAS 5 PUNTOS
			DE 5 A 10 AÑOS	MAS 10 PUNTOS
			DE 10 A 80 AÑOS	MAS 15 PUNTOS
		SI ES PASIVO	15 PUNTOS	
		MAS ANTIGÜEDAD	0 PUNTOS."

	^0
]
