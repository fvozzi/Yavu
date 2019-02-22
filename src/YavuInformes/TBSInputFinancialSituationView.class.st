Class {
	#name : #TBSInputFinancialSituationView,
	#superclass : #TBSTransactionView,
	#instVars : [
		'monto',
		'fechaUltimoPago',
		'tipoDeOperacion',
		'calidad'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #'as yet unclassified' }
TBSInputFinancialSituationView class >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^WAAyudaIngresarSituacionesComerciales
]

{ #category : #accessing }
TBSInputFinancialSituationView class >> textoDeAyuda [
	"Devuelve un texto de ayuda."

	^'Con este método el sistema le permitirá ingresa las actualizaciones de cada persona manualmente. Use este método si no dispone de la información a actualizar en formato digital o si los registros a cargar son pocos. Puede usar este método para actualizar la información en tiempo real.'
]

{ #category : #testing }
TBSInputFinancialSituationView >> addToListButtonLabel [

	^self financialSituationType labelForButton
]

{ #category : #accessing }
TBSInputFinancialSituationView >> convertirFechaUltimoPago [
	"Crea un nuevo Date a partir del string ingresado por el usuario."
	
	^Date readFrom: self fechaUltimoPago readStream pattern: 'dd/mm/yyyy'
]

{ #category : #accessing }
TBSInputFinancialSituationView >> currentFinancialSituation [

	^self commerce financialSituationCurrentAt: self date customer: self customer
]

{ #category : #accessing }
TBSInputFinancialSituationView >> fechaUltimoPago [
	^ fechaUltimoPago
]

{ #category : #accessing }
TBSInputFinancialSituationView >> fechaUltimoPago: anObject [
	fechaUltimoPago := anObject
]

{ #category : #testing }
TBSInputFinancialSituationView >> financialSituationType [

	^self commerce inputStrategy typeFor: self currentFinancialSituation
	
]

{ #category : #initialization }
TBSInputFinancialSituationView >> initialize [

	super initialize.
	fechaUltimoPago := Date today ddmmyyyy
]

{ #category : #initialization }
TBSInputFinancialSituationView >> initializeTransactionData [
	"Resetea los datos ingresdos por el usuario para ingresar una nueva situación."

	super initializeTransactionData.
	monto:= ''
]

{ #category : #accessing }
TBSInputFinancialSituationView >> monto [
	^ monto
]

{ #category : #accessing }
TBSInputFinancialSituationView >> monto: anObject [
	monto := anObject
]

{ #category : #creation }
TBSInputFinancialSituationView >> montoAsNumberOrNil [

	^self commerce inputAmountOfDebt ifTrue: [ self monto asNumber] ifFalse: []
]

{ #category : #creation }
TBSInputFinancialSituationView >> newTransaction [
	"Devuelve una nueva situacion comercial según los datos ingresados por el usuario."

	^ (FinancialSituation
		comercio: self commerce
		fecha: self date
		cliente: self clienteActualONuevo
		montoAdeudado: self montoAsNumberOrNil
		fechaUltimoPago: (self convertirFecha: self fechaUltimoPago))
		operationType: self operationType;
		operationCharacter: self operationCharacter;
		type: self financialSituationType;
		yourself
]

{ #category : #accessing }
TBSInputFinancialSituationView >> operationCharacter [
	^ calidad
]

{ #category : #accessing }
TBSInputFinancialSituationView >> operationCharacter: anObject [
	calidad := anObject
]

{ #category : #accessing }
TBSInputFinancialSituationView >> operationType [
	^ tipoDeOperacion
]

{ #category : #accessing }
TBSInputFinancialSituationView >> operationType: anObject [
	tipoDeOperacion := anObject
]

{ #category : #rendering }
TBSInputFinancialSituationView >> renderAddToListButtonOn: html [
	^ html div
		class: 'columna';
		with: [ 
					html submitButton
						text: self addToListButtonLabel;
						callback: [ self agregar ] ]
]

{ #category : #rendering }
TBSInputFinancialSituationView >> renderInputAmountOfDebt: html [

	self commerce inputAmountOfDebt ifTrue: [  
		html div
			class: 'columna';
			with: [ 
					html div
						class: 'label';
						with: [ html text: 'Monto adeudado' ].
					html textInput on: #monto of: self ]
				]
]

{ #category : #rendering }
TBSInputFinancialSituationView >> renderRowOneOn: html [
	html div
		id: 'fila1';
		with: [ 
					html div
						class: 'columna';
						with: [ 
									html div
										class: 'label';
										with: [ html text: 'N° Documento' ].
									html textInput on: #documentNumber of: self ].
					html div
						class: 'columna';
						with: [ 
									html div
										class: 'label';
										with: [ html text: 'Tipo' ].
									html select
										list: CustomerType all;
										labels: [ :each | each label ];
										selected: self customerType;
										callback: [ :descripcionSexo | self customerType: descripcionSexo ] ].
					html div
						class: 'columna';
						with: [ 
									html submitButton
										text: 'Buscar';
										callback: [ self searchCustomer ] ].
					html div
						class: 'columna';
						with: [ 
									html div
										id: 'nombre';
										with: [ self renderNombreDeClienteOn: html ] ] ]
]

{ #category : #rendering }
TBSInputFinancialSituationView >> renderRowTwoOn: html [
	html div
		id: 'fila2';
		with: [ 
					html div
						class: 'columna';
						with: [ 
									html div
										class: 'label';
										with: [ html text: 'Fecha de pago' ].
									html textInput
										value: self fechaUltimoPago;
										callback: [ :value | self fechaUltimoPago: value ];
										script: (html jQuery new spanishDatepicker onSelect: html jQuery ajax serializeThis) ].
					self renderInputAmountOfDebt: html.
					html div
						class: 'columna';
						with: [ 
									html div
										class: 'label';
										with: [ html text: 'TipoDeOperacion' ].
									html select
										list: OperationType all;
										selected: OperationType default;
										callback: [ :value | self operationType: value ] ].
					html div
						class: 'columna';
						with: [ 
									html div
										class: 'label';
										with: [ html text: 'Calidad' ].
									html select
										list: OperationCharacter all;
										selected: OperationCharacter default;
										callback: [ :value | self operationCharacter: value ] ].
					self renderAddToListButtonOn: html ]
]

{ #category : #rendering }
TBSInputFinancialSituationView >> renderSegundoPasoOn: html [
	"Renderiza el segundo paso del ingreso manual de la información."

	html heading level4 with: [ html text: '2' ].
	html div
		class: 'ui-widget-header';
		class: 'ui-corner-all';
		with: [ html text: 'Ingrese todas las situaciones comerciales del comercio' ].
	self renderRowOneOn: html.
	self renderRowTwoOn: html.
	self renderDescripcionErrorOn: html.
	html heading
		level3;
		with: [ html text: 'Listado de situaciones a procesar:' ].
	html div
		id: #vistaPrevia;
		with: [ self renderTransactionListOn: html ]
]

{ #category : #accessing }
TBSInputFinancialSituationView >> transactionClass [

	^FinancialSituation
]

{ #category : #printing }
TBSInputFinancialSituationView >> transactionDescription [

	^'situación comercial.'
]

{ #category : #rendering }
TBSInputFinancialSituationView >> updateRoot: anHtmlRoot [

			super updateRoot: anHtmlRoot.  

    anHtmlRoot stylesheet resourceUrl: 'importarInformes.css'
]

{ #category : #testing }
TBSInputFinancialSituationView >> verifyAmountOfdebt [
	[ self monto asNumber ]
		on: Error
		do: [ :ex | 
			self descriptionError: 'El monto debe ser un número.'.
			^ false ].
	(self monto notNil and: [ self monto notEmpty ])
		ifTrue: [ ^ true ].
	self descriptionError: 'Debe ingresar un monto.'.
	^ false
]

{ #category : #testing }
TBSInputFinancialSituationView >> verifyTransactionData [
	"Devuelve true si el monto no es nil."

	self commerce inputAmountOfDebt not ifTrue: [^true].
	^self verifyAmountOfdebt 
]
