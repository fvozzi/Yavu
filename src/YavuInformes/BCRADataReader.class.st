Class {
	#name : #BCRADataReader,
	#superclass : #HTMLDataReader,
	#instVars : [
		'reCaptchaChallenge'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #subclassResponsability }
BCRADataReader >> basicDataClass [

	^BCRAData
]

{ #category : #subclassResponsability }
BCRADataReader >> captchaImageUrl [
	^ 'http://www.google.com/recaptcha/api/image?c=' , self reCaptchaChallenge
]

{ #category : #subclassResponsability }
BCRADataReader >> createBasicDataFor: aPerson [

	basicData  := BCRAData entity: aPerson date: Date today
]

{ #category : #subclassResponsability }
BCRADataReader >> currentBasicDataFor: aCustomer [
	^ BCRAData instanceCurrentAt: Date today entity: aCustomer
]

{ #category : #subclassResponsability }
BCRADataReader >> currentBasicDataFor: aCustomer using: aYavuSystem [

	^aYavuSystem instanceCurrentAt: Date today entity: aCustomer class: self basicDataClass 
]

{ #category : #subclassResponsability }
BCRADataReader >> executePreviousActions [
	"Ejecuta acciones previas a obtener el captcha.
	NOTA: en el caso del bcra tenemos que setear el reCaptcha de la API de google."	

	| response |

	response := [self znClient
		timeout: 20;
		url: 'http://200.70.35.102/cenries/cr010000.asp?error=0';
		get;
		url: 'http://www.google.com/recaptcha/api/challenge?k=6LdUV-ASAAAAANpNhF1ejaMDxyiutfA2Uu-ZPV0h';
		get] on: ConnectionTimedOut do: [:ex | ''].
	reCaptchaChallenge := self parseChallengeFrom: response
]

{ #category : #subclassResponsability }
BCRADataReader >> htmlStreamUrl [
	^ 'http://200.70.35.102/cenries/cr010000.asp'
]

{ #category : #'as yet unclassified' }
BCRADataReader >> parseChallengeFrom: response [

	| result |
	
	response isEmpty ifTrue: [ ^''].
	"Obtengo el string challenge entre comillas."
	result := (ReadStream on: response)
				upToAll: 'challenge : ';
				upToAll: ','.
	"Elimino las comillas."
	^result copyFrom: 2 to: result size - 1 
]

{ #category : #parsing }
BCRADataReader >> parseHtmlBCRADebtData [

	| htmlStream position |
	
	"Camino el stream original hasta la posición de comienzo de deudas."
	position := self htmlBasicStream position.
	self htmlBasicStream upToAll: 'class="Tabla_Borde">'.
	position = self htmlBasicStream atEnd ifTrue: [ ^self htmlBasicStream position: position ].
	htmlStream := ReadStream on: (self htmlBasicStream upToAll: '</table>').
	[htmlStream atEnd] whileFalse: [ | item |
		item := BCRADebt new.
		htmlStream upToAll: '"Celda_Borde_Izquierda">'.
		item denomination: (htmlStream upToAll: '</td>').
		htmlStream upToAll: '"Celda_Borde_Izquierda">'.
		item entity: (htmlStream upToAll: '</td>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item period: (htmlStream upToAll: '</td>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'; upToAll: '">'.
		item situation: (htmlStream upToAll: '</font>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item amount: (htmlStream upToAll: '</td>') trimRight.		
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item days: (htmlStream upToAll: '</td>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item observation: (htmlStream upToAll: '</td>') trimBoth.
		self basicData addDebt: item
		]


]

{ #category : #parsing }
BCRADataReader >> parseHtmlBCRAPersonalCheckData [

	| htmlStream position |
	
	position := self htmlBasicStream position.
	"Camino el stream original hasta la posición de comienzo de deudas."
	self htmlBasicStream upToAll: '>CHEQUES RECHAZADOS EN CUENTAS PERSONALES<'.
	self htmlBasicStream atEnd ifTrue: [ ^self htmlBasicStream position: position ].
	htmlStream := ReadStream on: (self htmlBasicStream upToAll: '</table>').
	[htmlStream atEnd] whileFalse: [ | item |
		item := BCRACheckData new.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item checkNumber: (htmlStream upToAll: '</td>').
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item bouncedDate: ([(htmlStream upToAll: '</td>') trimRight asDate] on: Error do: [ :ex | ]).
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item amountOfCheck: (htmlStream upToAll: '</td>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item cause: (htmlStream upToAll: '</td>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item paymentDate: ([(htmlStream upToAll: '</td>') trimRight asDate] on: Error do: [ :ex |  ]).
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item finePaymentDate: ([(htmlStream upToAll: '</td>') trimRight asDate] on: Error do: [ :ex | ]).
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item revision: (htmlStream upToAll: '</td>') trimBoth.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item judicial: (htmlStream upToAll: '</td>') trimBoth.
		item type: 'P'.
		self basicData addPersonalCheck: item
		]


]

{ #category : #parsing }
BCRADataReader >> parseHtmlBCRASocietyCheckData [

	| htmlStream position |

	"Camino el stream original hasta la posición de comienzo de deudas."
	position := self htmlBasicStream position.
	self htmlBasicStream upToAll: '>CHEQUES RECHAZADOS EN CUENTAS DE PERSONAS JURIDICAS<'.
	self htmlBasicStream atEnd ifTrue: [ ^self htmlBasicStream position: position ].
	htmlStream := ReadStream on: (self htmlBasicStream upToAll: '</table>').
	[htmlStream atEnd] whileFalse: [ | item |
		item := BCRACheckData new.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item checkNumber: (htmlStream upToAll: '</td>').
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item bouncedDate: ([(htmlStream upToAll: '</td>') trimRight asDate] on: Error do: [ :ex | ]).
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item amountOfCheck: (htmlStream upToAll: '</td>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item cause: (htmlStream upToAll: '</td>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item denomination: (htmlStream upToAll: '</td>') trimRight.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item paymentDate: ([(htmlStream upToAll: '</td>') trimRight asDate] on: Error do: [ :ex | ]).		
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item finePaymentDate: ([(htmlStream upToAll: '</td>') trimRight asDate] on: Error do: [ :ex | ]).
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item revision: (htmlStream upToAll: '</td>') trimBoth.
		htmlStream upToAll: '"Celda_Borde_Centro">'.
		item judicial: (htmlStream upToAll: '</td>') trimBoth.
		item type: 'S'.
		self basicData addSocietyCheck: item
		]


]

{ #category : #subclassResponsability }
BCRADataReader >> parseHtmlData [

	self
		parseHtmlBCRADebtData;
		parseHtmlBCRAPersonalCheckData;
		parseHtmlBCRASocietyCheckData
]

{ #category : #accessing }
BCRADataReader >> reCaptchaChallenge [

	^reCaptchaChallenge
]

{ #category : #subclassResponsability }
BCRADataReader >> setHtmlStreamParameters [
	self znClient
		formAt: 'CUIT' put: self basicData entity cuit;
		formAt: 'B1.x' put: '19';
		formAt: 'B1.y' put: '4';
		formAt: 'primera_vez' put: '1';
		formAt: 'recaptcha_challenge_field' put: self reCaptchaChallenge;
		formAt: 'recaptcha_response_field' put: self captchaCaracteres
]

{ #category : #subclassResponsability }
BCRADataReader >> todayBasicDataFor: aCustomer [
	"Busca una instancia para el día de hoy para no volver a buscar un dato en la web."
	
	^BCRAData instanceOf: Date today entity: aCustomer
]
