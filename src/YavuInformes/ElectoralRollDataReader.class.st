Class {
	#name : #ElectoralRollDataReader,
	#superclass : #HTMLDataReader,
	#instVars : [
		'nameLiteral',
		'cuitLiteral',
		'htmlCompleteStream',
		'dni'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #subclassResponsability }
ElectoralRollDataReader >> basicDataClass [

	^ElectoralRoll
]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> captchaImageUrl [
	^'http://buscardatos.com/Personas/DNI/easycaptcha.php'
]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> createBasicDataFor: aPerson [

	basicData  := self basicDataClass new
]

{ #category : #accessing }
ElectoralRollDataReader >> cuitLiteral [
	
	^ cuitLiteral
]

{ #category : #accessing }
ElectoralRollDataReader >> cuitLiteral: anObject [
	
	cuitLiteral := anObject
]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> currentBasicDataFor: aCustomer [
	"Busca una instancia para el día de hoy para no volver a buscar un dato en la web.
	NOTA: en este caso es una entidad entonces es igual la del día o al vigente, solamente nos interesa si existe o no el dato en la BD local."
	
	^self todayBasicDataFor: aCustomer
]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> currentBasicDataFor: aCustomer using: aYavuSystem [
	"Busca una instancia para el día de hoy para no volver a buscar un dato en la web.
	NOTA: en este caso es una entidad entonces es igual la del día o al vigente, solamente nos interesa si existe o no el dato en la BD local."
	
	^self todayBasicDataFor: aCustomer using: aYavuSystem
]

{ #category : #accessing }
ElectoralRollDataReader >> dni [
	
	^ dni
]

{ #category : #accessing }
ElectoralRollDataReader >> dni: anObject [
	
	dni := anObject
]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> executePreviousActions [
	"Ejecuta acciones previas a obtener el captcha.
	NOTA: en el caso del buscadatos.com tenemos que enviar el dni a buscar antes."	

	self znClient
			url: 'http://buscardatos.com/Personas/DNI/gocap_dni.php';
			accept: ZnMimeType textHtml; 
			enforceHttpSuccess: true;
			enforceAcceptContentType: true;
			setAcceptEncodingGzip;
			formAt: 'DNI' put: self dni;
			post
]

{ #category : #htmlQueries }
ElectoralRollDataReader >> getHtmlCompleteStream [

	^ReadStream on: ([self znClient
			url: 'http://buscardatos.com/personas.php?nombre=', self nameLiteral encodeForHTTP, '&cuit=', self cuitLiteral;
			accept: ZnMimeType textHtml; 
			enforceHttpSuccess: true;
			enforceAcceptContentType: true;
			setAcceptEncodingGzip;
			logToTranscript;		
			get] on: ConnectionTimedOut , NameLookupFailure , ZnHttpUnsuccessful , ZnUnexpectedContentType
		do: [ :ex | ''])
]

{ #category : #accessing }
ElectoralRollDataReader >> htmlCompleteStream [

	htmlCompleteStream isNil ifTrue: [htmlCompleteStream := self getHtmlCompleteStream].
	^htmlCompleteStream 
]

{ #category : #accessing }
ElectoralRollDataReader >> htmlCompleteStream: aReadStream [ 
	
	htmlCompleteStream := aReadStream
]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> htmlStreamUrl [

	^'http://buscardatos.com/Personas/DNI/dni2.php'
]

{ #category : #accessing }
ElectoralRollDataReader >> nameLiteral [
	
	^ nameLiteral
]

{ #category : #accessing }
ElectoralRollDataReader >> nameLiteral: anObject [
	
	nameLiteral := anObject
]

{ #category : #parsing }
ElectoralRollDataReader >> parseHtmlCompleteData [
	"Ya tenemos el html que tiene los datos del padrón completos."
	
	#(sex: name: birthday: setAgeFromString: address: city: state: zipCode: occupation:) do: [ :selector |
		self htmlCompleteStream upToAll: '<p class=''parte2''>'.
		self basicData perform: selector with: (self htmlCompleteStream upToAll: '</p>')		
		 ]
	

]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> parseHtmlData [

	self
		parseHtmlURLData;
		parseHtmlCompleteData
]

{ #category : #parsing }
ElectoralRollDataReader >> parseHtmlURLData [
	"Busca en el basicStream la url completa para poder consultar los demás datos.
	NOTA: tenemos que hacerlo así porque además del numero de CUIT (que podemos calcularlo), tenemos que pasarle el nombre como argumento."
	
	self htmlBasicStream upToAll: 'nombre='.
	self nameLiteral: (self htmlBasicStream upToAll: '&cuit=').
	self cuitLiteral: ((self htmlBasicStream upToAll: '>') trimRight: [ :c | c = $' ]).
	self cuitLiteral size = 13 ifTrue: [
	self basicData 
		cuit: (self cuitLiteral copyFrom: 1 to: 2), (self cuitLiteral copyFrom: 4 to: 11), (self cuitLiteral copyFrom: 13 to: 13);
		dni: self dni]
]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> setHtmlStreamParameters [ 

	^self znClient
		formAt: 'confirm_code' put: self captchaCaracteres;
		yourself

]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> todayBasicDataFor: aCustomer [
	"Busca una instancia para el día de hoy para no volver a buscar un dato en la web.
	NOTA: en este caso es una entidad entonces es igual la del día o al vigente, solamente nos interesa si existe o no el dato en la BD local."
	
	^ElectoralRoll searchForDNI: self dni
]

{ #category : #subclassResponsability }
ElectoralRollDataReader >> todayBasicDataFor: aCustomer using: aYavuSystem [
	"Busca una instancia para el día de hoy para no volver a buscar un dato en la web.
	NOTA: en este caso es una entidad entonces es igual la del día o al vigente, solamente nos interesa si existe o no el dato en la BD local."
	
	^aYavuSystem electoralRollOf: aCustomer
]
