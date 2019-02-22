Class {
	#name : #AfipDataReader,
	#superclass : #HTMLDataReader,
	#instVars : [
		'cuit',
		'viewState',
		'entityValidation'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
AfipDataReader >> basicDataClass [

	^AfipData
]

{ #category : #'as yet unclassified' }
AfipDataReader >> captchaImageUrl [
	^'https://servicios1.afip.gob.ar/TRAMITES_CON_CLAVE_FISCAL/MISAPORTES/app/Captcha/JpegImage.aspx'
]

{ #category : #'as yet unclassified' }
AfipDataReader >> createBasicDataFor: aPerson [

	basicData  := AfipData entity: aPerson date: Date today
]

{ #category : #'as yet unclassified' }
AfipDataReader >> cuil [

	| cuilFormated |
	
	cuilFormated := WriteStream on: String new.
	cuilFormated 
		nextPutAll: (self basicData entity cuit copyFrom: 1 to: 2);
		nextPutAll: '-';
		nextPutAll: self basicData entity dni;
		nextPutAll: '-';
		nextPutAll: (self basicData entity cuit copyFrom: 11 to: 11).
	^cuilFormated contents asString
]

{ #category : #'as yet unclassified' }
AfipDataReader >> currentBasicDataFor: aCustomer [

	^self basicDataClass instanceCurrentAt: Date today entity: aCustomer
]

{ #category : #'as yet unclassified' }
AfipDataReader >> currentBasicDataFor: aCustomer using: aYavuSystem [

	^aYavuSystem instanceCurrentAt: Date today entity: aCustomer class: self basicDataClass 
]

{ #category : #'as yet unclassified' }
AfipDataReader >> executePreviousActions [
	"Ejecuta acciones previas a obtener el captcha."
	
	| resultStream |
	self znClient
		accept: ZnMimeType textHtml;
		timeout: 5;
		url: 'https://servicios1.afip.gob.ar/tramites_con_clave_fiscal/misaportes/app/basica.aspx';
		get.
	self znClient
		accept: ZnMimeType textHtml;
		timeout: 5;
		url: 'https://servicios1.afip.gob.ar/TRAMITES_CON_CLAVE_FISCAL/MISAPORTES/app/basica/IngresoDatos.aspx';
		get.
	resultStream := ReadStream on: self znClient contents.
	viewState := resultStream upToAll: 'id="__VIEWSTATE" value="';  upToAll: '" />'.
	entityValidation :=  resultStream upToAll: 'id="__EVENTVALIDATION" value="';  upToAll: '" />'.
]

{ #category : #'as yet unclassified' }
AfipDataReader >> htmlStreamUrl [
	^'https://servicios1.afip.gov.ar/tramites_con_clave_fiscal/misAportes/basica_int.asp'
]

{ #category : #'as yet unclassified' }
AfipDataReader >> mimeType [

	^ZnMimeType applicationOctetStream
]

{ #category : #'as yet unclassified' }
AfipDataReader >> parseHtmlData [

	self
		parseHtmlFirstStep;
		parseHtmlSecondStep;
		parseHtmlThirdStep
]

{ #category : #'as yet unclassified' }
AfipDataReader >> parseHtmlFirstStep [
	
	[self znClient
		url: 'https://servicios1.afip.gob.ar/TRAMITES_CON_CLAVE_FISCAL/MISAPORTES/app/basica/IngresoDatos.aspx';
		accept: ZnMimeType textHtml ;
		formAt: '__EVENTTARGET' put: 'ctl00$ContentPlaceHolder2$BtnContinuar';
		formAt: '__VIEWSTATE' put: viewState ;
		formAt: '__EVENTVALIDATION' put: entityValidation ;
		formAt: 'ctl00$ContentPlaceHolder2$rdbTipoConsulta' put: 'rdbCuil' ;
		formAt: 'ctl00$ContentPlaceHolder2$txtCuil$txtSufijo' put: self cuil;
		formAt: 'ctl00$ContentPlaceHolder2$key' put: self captchaCaracteres;
		post]
		on: ConnectionTimedOut , NameLookupFailure , ZnHttpUnsuccessful , ZnUnexpectedContentType
		do: [ :ex |  ]
		

]

{ #category : #'as yet unclassified' }
AfipDataReader >> parseHtmlSecondStep [
	
	| htmlContents |
	htmlContents := [self znClient 
		url: 'https://servicios1.afip.gob.ar/TRAMITES_CON_CLAVE_FISCAL/MISAPORTES/app/basica/MuestraBasica.aspx';
		accept: ZnMimeType textHtml;
		get]
	on: ConnectionTimedOut , NameLookupFailure , ZnHttpUnsuccessful , ZnUnexpectedContentType
	do: [ :ex | ''  ].
	self htmlBasicStream: (self readStreamOn: htmlContents)
]

{ #category : #'as yet unclassified' }
AfipDataReader >> parseHtmlThirdStep [

	| html |
	
	html := self htmlBasicStream.
	1 to: 12 do: [ :i | | contribution |
		contribution := OrderedCollection new.
		html upToAll: '<td class="TDPeriodo" style="height: 28px">'.
		contribution add: (html upToAll: '</td>') trimBoth.
		html upToAll: '<td class=''TD'; upToAll: 'colspan="2">'.
		contribution add: (html upToAll: '</td>') trimBoth.
		html upToAll: '<td class=''TD'; upToAll: 'colspan="2">'.
		contribution add: (html upToAll: '</td>') trimBoth.
		html upToAll: '<td class=''TD'; upToAll: 'colspan="2">'.
		contribution add: (html upToAll: '</td>') trimBoth.
		html upToAll: '<td class=''TD'; upToAll: 'colspan="2">'.
		contribution add: (html upToAll: '</td>') trimBoth.
		self basicData addContribution: contribution
		 ]
		
]

{ #category : #'as yet unclassified' }
AfipDataReader >> setHtmlStreamParameters [

	self znClient
		formAt: 'Boton4' put: 'Continuar';
		formAt: 'CodeNumberTextBox' put: self captchaCaracteres;
		formAt: 'actual' put: '0';
		formAt: 'cuil1' put: self basicData dni;
		formAt: 'cuilDES' put: '2';
		formAt: 'logon' put: '1';
		formAt: 'paginaorigen' put: 'pcc1';
		formAt: 'prefijo' put: (self basicData cuit copyFrom: 1 to: 2) ;
		formAt: 'sufijo' put: (self basicData cuit copyFrom: 11 to: 11)
]

{ #category : #'as yet unclassified' }
AfipDataReader >> todayBasicDataFor: aCustomer [
	"Busca una instancia para el día de hoy para no volver a buscar un dato en la web."
	
	^nil
]
