Class {
	#name : #FixedWidthFileImporter,
	#superclass : #ImportadorDeInformes,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
FixedWidthFileImporter >> completeCustomer: customer from: anStream [

	^customer 
		address: (anStream next: 35) trimBoth;
		city: (anStream next: 15) trimBoth;
		birthday: (Date readFrom: (ReadStream on: (anStream next: 8)) pattern: 'ddmmyyyy');
		occupation: (anStream next: 63) trimBoth;
		spouse: (anStream next: 30) trimBoth;
		spouseDocumentNumber: (anStream skip: 3; next: 8) trimBoth;
		yourself
	

]

{ #category : #'as yet unclassified' }
FixedWidthFileImporter >> crearClienteDesde: anStream [
	"Crea un nuevo informe desde los datos de unArray. Si el cliente no existe también lo crea."
	
	| customer documentNumber |

	
		anStream skip: 3. "Salteo el tipo de DNI." 
		documentNumber := self removeLeftZerosFrom: (anStream next: 8).
		customer := NaturalPerson 	searchCustomerByNumber: documentNumber customerType: CustomerTypeNotDeclared.
		"NOTA: Debido a que en Junín, cuando se importo la historia, se hizo un trabajo para incluir el sexo cada vez que busquemos una persona por dni que ya tiene el cuil calculado no la vamos a encontrar. Entonces, nos fijamos si dió nil y buscamos directamente por dni."
		customer isNil ifTrue: [ customer := NaturalPerson searchCustomerByDNI: documentNumber].
	customer isNil ifTrue: [
		customer := NaturalPerson nombre: (anStream next: 35) trimBoth dni: documentNumber sexo: CustomerTypeNotDeclared code.
		self completeCustomer: customer from: anStream.
		clientes add: customer].
	^customer
]

{ #category : #'as yet unclassified' }
FixedWidthFileImporter >> crearInformeDesde: unArray [
	"Crea un nuevo informe desde los datos de unArray. Si el cliente no existe tambiÃ©n lo crea."
	
	| informe |
	unArray size < 214 ifTrue: [^self].
	[informe := FinancialSituation 
		comercio: self comercio
		fecha:  self date
		type: (self financialSituationTypeFrom: unArray)
		cliente: (self crearClienteDesde: unArray)
		fechaUltimoPago: self date beginOfMonth] on: Error do: [:ex | self errores add: ex messageText, ' en la linea ', unArray asString].
	informe notNil ifTrue: [
		informes add: (informe 
						operationType: self creditoConsumo ;
						operationCharacter: self titular;
						yourself)
		]
]

{ #category : #'as yet unclassified' }
FixedWidthFileImporter >> creditoConsumo [

	"En junín no se informa el tipo de la operación asi que asumimos siempre Credito Consumo."
	^OperationType atID: 2

	
]

{ #category : #'as yet unclassified' }
FixedWidthFileImporter >> financialSituationTypeFrom: anStream [

	anStream skip: 5. "Salteo el codigo del comercio."
	^(anStream next: 1) = 'A' ifTrue: [ Affectation ] ifFalse: [ Disaffectation ]
]

{ #category : #'as yet unclassified' }
FixedWidthFileImporter >> nextLineAsArrayOrStream [

	^ReadStream on: self file nextLine 
]

{ #category : #'as yet unclassified' }
FixedWidthFileImporter >> removeLeftZerosFrom: anString [
	
	^anString trimLeft: [ :character | character = $0 ]
]

{ #category : #'as yet unclassified' }
FixedWidthFileImporter >> titular [

	"En junín no se informa el caracter de la operación asi que asumimos siempre Titular."
	^OperationCharacter atID: 1

	
]
