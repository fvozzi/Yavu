"
A FinancialSituation es el informe que presenta un comercio sobre un cliente en particular.

Instance Variables
	entity: Commerce
	amountOfDebt:		Number
	customer:		Person
	dateOfLastPayment:		Date
	operationCharacter:		OperationCharacter
	operationType:		OperationType 
	type:		FinancialSituationType

entity
	- Es el comercio que informa la situación del cliente.

amountOfDebt
	- El monto de la deuda

customer
	- Es el cliente informado.

type
	- Define cual es el método para informar la situación financiera de un cliente.

"
Class {
	#name : #FinancialSituation,
	#superclass : #YavuTransaction,
	#instVars : [
		'amountOfDebt',
		'customer',
		'dateOfLastPayment',
		'operationType',
		'operationCharacter',
		'type'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
FinancialSituation class >> comercio: unComercio fecha: unaFecha cliente: unCliente montoAdeudado: unMonto fechaUltimoPago: fechaDePago [ 
	"Crea una nueva situación comercial para unComercio y unCliente."

	^(self entity: unComercio date: unaFecha)
		initializeCliente: unCliente montoAdeudado: unMonto fechaDePago: fechaDePago
]

{ #category : #'as yet unclassified' }
FinancialSituation class >> comercio: unComercio fecha: unaFecha type: aFinancialSituationType cliente: unCliente fechaUltimoPago: fechaDePago [ 
	"Crea una nueva situación comercial para unComercio y unCliente."

	^(self entity: unComercio date: unaFecha)
		initializeCliente: unCliente type: aFinancialSituationType fechaDePago: fechaDePago
]

{ #category : #'as yet unclassified' }
FinancialSituation class >> countInstancesFor: anEntity [

	^self yavuSystem count: FinancialSituation 
		where: [:each | each entity = anEntity]
]

{ #category : #'sin categoria' }
FinancialSituation class >> entityClass [
	
	^Commerce
]

{ #category : #'sin categoria' }
FinancialSituation class >> entityLabel [

	^'Comercio'
]

{ #category : #accessing }
FinancialSituation class >> instanceCurrentAt: aDate entity: aCommerce customer: aCustomer [ 
	
	| instances |
	
	instances := self yavuSystem readManyOf: self 
		where: [:each | ((each entity = aCommerce) AND: [each date between: '01/01/1900' asDate and: aDate]) AND: [each customer = aCustomer]].
	^instances asSortedCollection ifEmpty: [] ifNotEmpty: [:each | each last ]
]

{ #category : #'as yet unclassified' }
FinancialSituation class >> instancesFrom: startDate to: endDate for: anEntity [

	^self yavuSystem readManyOf: FinancialSituation 
		where: [:each | each entity = anEntity AND: [each date between: startDate and: endDate]]
]

{ #category : #'sin categoria' }
FinancialSituation class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Deudas informadas'
]

{ #category : #'sin categoria' }
FinancialSituation class >> nula [
	"Crea una nueva situación comercial nula para que el montoAdeudado sea 0."

	^(self entity: nil date: nil)
		initializeCliente: nil montoAdeudado: 0 fechaDePago: nil
]

{ #category : #'sin categoria' }
FinancialSituation >> actualizarDesde: aSituacionComercial [
	"Actualizar el montoAdeudado del receptor con el montoAdeudado de aSituacionComercial.
	NOTA: es un mecanismo utilizado para no tener que eliminar los duplicados, entonces si alguien ingresa una situación comercial para el mismo comercio, fechaUltimoPago, cliente, tipoDeOperacion y calidad en lugar de eliminar la existente y agregar la nueva le actualizamos la situacion comercial al cliente."
	
	amountOfDebt := aSituacionComercial montoAdeudado	
]

{ #category : #'as yet unclassified' }
FinancialSituation >> amountOfDebt: anAmount [

	amountOfDebt := anAmount
]

{ #category : #'sin categoria' }
FinancialSituation >> amountOfDebtDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #montoAdeudado;
        	label: 'Deuda';
        	priority: 140;
		beRequired;
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituation >> comercio [
	
	^self entity
]

{ #category : #'sin categoria' }
FinancialSituation >> customer [
	"Devuelve el cliente para el que fue cargada la deuda o informe comercial."
	
	^customer
]

{ #category : #'sin categoria' }
FinancialSituation >> customerDescription [
	"Devuelve un objeto que describe la representación de la variable numero de documento del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #customer;
		default: nil;
		options: OrderedCollection new;
		label: 'Cliente';
		priority: 120;
		beRequired;
		yourself
]

{ #category : #'sin categoria' }
FinancialSituation >> equalTo: otraSituacionComercial [
	"Devuelve true si otraSituacionComercial es igual al receptor."
	
	^((((super equalTo: otraSituacionComercial) and: [
		self customer = otraSituacionComercial customer]) and: [
			self fechaUltimoPago = otraSituacionComercial fechaUltimoPago]) and: [
				self operationType = otraSituacionComercial operationType]) and: [
					self operationCharacter = otraSituacionComercial operationCharacter]
					
]

{ #category : #'as yet unclassified' }
FinancialSituation >> esNula [
	"Crea una nueva situación comercial nula para que el montoAdeudado sea 0."

	^self entity isNil & self date isNil & self customer isNil
]

{ #category : #'sin categoria' }
FinancialSituation >> fechaUltimoPago [
	"Devuelve la fecha de ultimo pago para la deuda o informe comercial actual."
	
	^dateOfLastPayment
]

{ #category : #'sin categoria' }
FinancialSituation >> fechaUltimoPagoDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteDescription>
	^MADateDescription new 
        	accessor: 'fechaUltimoPago' asSymbol;
        	label: 'Fecha último pago';
        	priority: 130;
		beRequired;
        	yourself
]

{ #category : #accessing }
FinancialSituation >> financialSituationDescription [
	
	^self type ifNotNil: [ :one | one financialSituationDescriptionFor: self ] 
]

{ #category : #accesing }
FinancialSituation >> financialSituationDescriptionCSSLabel [
	
	^self type ifNotNil: [ :one | one financialSituationDescriptionCSSLabelFor: self ]
]

{ #category : #'sin categoria' }
FinancialSituation >> initializeCliente: unCliente montoAdeudado: unMonto fechaDePago: fechaDePago [

	customer:= unCliente.
	amountOfDebt:= unMonto.
	dateOfLastPayment:= fechaDePago
]

{ #category : #'as yet unclassified' }
FinancialSituation >> initializeCliente: unCliente type: aFinancialSituationType fechaDePago: fechaDePago [

	customer:= unCliente.
	type:= aFinancialSituationType.
	dateOfLastPayment:= fechaDePago
]

{ #category : #'sin categoria' }
FinancialSituation >> montoAdeudado [ 
	"Devuelve el monto para la deuda o informe comercial actual."
	
	^amountOfDebt
]

{ #category : #'as yet unclassified' }
FinancialSituation >> onlyMonthlyDebt [
	"Indica que el tipo del receptor es valido solamente para el mes en cuestión.
	Es decir, la situación comercial deberá informarse todos los meses y nunca será necesaria la baja porque la misma es atomatica. Es decir, la deuda solo vale por un mes."

	^self type onlyMonthlyDebt
]

{ #category : #'sin categoria' }
FinancialSituation >> operationCharacter [
	"Devuelva la calidad del repceptor.
	NOTA: la calidad indica en concepto de que contrajo la deuda. Ej: Titular o Garante."
	
	^operationCharacter
]

{ #category : #'sin categoria' }
FinancialSituation >> operationCharacter: unaCalidad [
	"Setea la calidad del repceptor.
	NOTA: la calidad indica en concepto de que contrajo la deuda. Ej: Titular o Garante."
	
	operationCharacter:= unaCalidad 
]

{ #category : #'sin categoria' }
FinancialSituation >> operationCharacterDescription [
	"Devuelve un objeto que describe la representacipón de la variable numero de documento del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #operationCharacter;
		default: nil;
		options: OrderedCollection new;
		label: 'Tipo';
		priority: 150;
		beRequired;
		yourself

]

{ #category : #'sin categoria' }
FinancialSituation >> operationType [
	"Devuelve el tipo de operación del repceptor.
	NOTA: un tipo de operación indica el tipo de deduda contraida. Ej: Prestamo Personal."
	
	^operationType
]

{ #category : #'sin categoria' }
FinancialSituation >> operationType: unTipoDeOperacion [
	"Setea el tipo de operación del repceptor.
	NOTA: un tipo de operación indica el tipo de deduda contraida. Ej: Prestamo Personal."
	
	operationType:= unTipoDeOperacion
]

{ #category : #'sin categoria' }
FinancialSituation >> operationTypeDescription [
	"Devuelve un objeto que describe la representación de la variable numero de documento del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #operationType;
		default: nil;
		options: OrderedCollection new;
		label: 'Tipo';
		priority: 140;
		beRequired;
		yourself

]

{ #category : #'sin categoria' }
FinancialSituation >> printOn: aStream [

	aStream 
		nextPutAll: self comercio printString;
		nextPutAll: ' - ';
		nextPutAll: self fechaUltimoPago printString
]

{ #category : #'as yet unclassified' }
FinancialSituation >> type [

	^type
]

{ #category : #'as yet unclassified' }
FinancialSituation >> type: aFinancialType [

	type := aFinancialType
]
