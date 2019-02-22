Class {
	#name : #WASICLogin,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'password',
		'userName',
		'triedNumber'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WASICLogin class >> canBeRoot [
	^ true
]

{ #category : #'request processing' }
WASICLogin >> incrementarNumeroDeIntento [
	"Incrementa el numero de intento de inicio de session."
	
	triedNumber := triedNumber + 1
]

{ #category : #'initialize-release' }
WASICLogin >> initialize [

	super initialize.
	triedNumber := 0
]

{ #category : #'request processing' }
WASICLogin >> login [
	"Valida nombre de usuario y password e ingresa al sistema."

	self incrementarNumeroDeIntento.
	self session usuario: (self session company userOfName: self userName password: self password).
	self session user notNil ifTrue: [self call: WASICMain new]
]

{ #category : #accessing }
WASICLogin >> password [
	^ password
]

{ #category : #accessing }
WASICLogin >> password: anObject [
	password := anObject
]

{ #category : #rendering }
WASICLogin >> realizoIntentoDeLoginErroneo [ 

	^self triedNumber > 0
]

{ #category : #rendering }
WASICLogin >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

	html render: WASICHeader new.
	
		html div id: 'servicios'; with: [self renderLoginServicesOn: html].
		html div id: 'login'; with: [self renderInputLoginOn: html].
	html render: WASICFooter new
]

{ #category : #rendering }
WASICLogin >> renderInputLoginOn: html [
	"Renderiza el input de usuario, password y empresa."

	html div id: #loginBorder; with: [
	html heading level2 with: [html text: 'Acceda al sistema con su cuenta de Usuario'].
	html heading level5 with: [html text: 'Empresa:'].
	html form: [
	html select 
			list: Company all;
			selected: Company default;
			callback: [:company | self startSessionInCompany: company].
	html heading level5 with: [html text: 'Nombre de Usuario'].
	html textInput
		callback: [:usuario | self userName: usuario].
	html heading level5 with: [html text:  'Contraseña:'].
	html passwordInput
		callback: [:pass | self password: pass].
	html submitButton text: 'Acceder'; callback: [self login]].
	self realizoIntentoDeLoginErroneo ifTrue: [html div id: #loginErroneo; with: [html text: 'Usuario o clave incorrecta, intente nuevamente.']]]

]

{ #category : #rendering }
WASICLogin >> renderLoginServicesOn: html [
	"Renderiza el contenido de los servicios ofrecidos por el sistema."
	
	html heading level1 with: [html text: 'Sistema de Informes Comerciales on-line'].
	html heading level3 with: [html paragraph: 'Nuestro sistema utiliza información actualizada desde todos los comercios registrados para ofrecer los siguientes servicios: '].
	html div class: 'servicio'; with: [
		html image resourceUrl: 'online.png'.
		html heading level2 with: [html paragraph: 'Infomes on-line'].
		html heading level5 with: [html paragraph: 'Con nuestra agil interfaz podrá consultar los informes desde la misma pantalla.']].
	html div class: 'servicio'; with: [
		html image resourceUrl: 'pdf.png'.
		html heading level2 with: [html paragraph:  'Infomes en PDF'].
		html heading level5 with: [html paragraph: 'Podrá emitir los informes en el formato ultraportatil PDF.']].
	html div class: 'servicio'; with: [
		html image resourceUrl: 'telefono.png'.
		html heading level2 with: [html paragraph: 'Infomes Telefónicos'].
		html heading level5 with: [html paragraph: 'Nuestras operadoras le brindarán la información telefónicamente.']].
	html div class: 'servicio'; with: [
		html image resourceUrl: 'mail.png'.
		html heading level2 with: [html paragraph: 'Infomes por correo electrónico'].
		html heading level5 with: [html paragraph: 'Podrá solicitar la emisión del reporte a una o varias cuentas de e-mail.']]
			
]

{ #category : #accessing }
WASICLogin >> startSessionInCompany: unaEmpresa [

	self session company: unaEmpresa
]

{ #category : #'as yet unclassified' }
WASICLogin >> style1 [

^'#encabezado {
height: 65px;
margin-left: 20px;
margin-right: 20px;
}
#encabezado #logo img{
width: 110px ;
}
#encabezado #logo {
margin-left: 30px;
float: left;

}
#encabezado #titulo {
margin-left: 145px;
margin-right: 20px;
position: relative;
top: 13px;
padding: 4px;
background-color: lightblue ;
text-align: center;
}
h1 {
font-family: Calibri;
font-size: 16px;
font-weight: Bold;
margin: 0;
}
h2 {
font-family: Calibri;
font-size: 14px;
font-weight: Bold;
}
h3 {
font-family: Calibri;
font-size: 16px;
font-weight: normal;
}
h5 {
font-family: Calibri;
font-size: 12px;
font-weight: Normal;
padding: 0px;
margin: 0px;
}
.servicio {
height: 52px;
margin-left: 20px;}

#servicios {
float:left;
height:400px;
margin-right:-370px;
position:relative;
width:100%;
margin-left: 30px;
}
#servicios img {
width: 50px;
height: 50px;
float: left;
}
#servicios h5 {
margin-top: -15px;
margin-left: 60px;
}
#servicios h2 {
margin-left: 60px;
}
#servicios h1, h3{
margin-left: 20px;
}
#servicios p {
padding-right: 378px;
}
#login {
float:left;
height:198px;
position:relative;
width:290px;
margin-right: 50px;
margin-top: 40px;
background-color: lightblue;
text-align: right;
}
#loginBorder {
position:relative;
border-style: solid;
border-color: lightblue;
border-width: 1px;
width:298px;
height:205px;
margin-left: -5px;
margin-top: -5px;
}
#login h5 {
margin-left: 0px;
margin-top: 5px;
float: left;
width: 120px;
}
#login h2{
text-align: center;}

#login input,select {
margin-top: 2px;
position: relative;
float: left;
margin-left: 2px;
width: 150px;
margin-right: 4px;
}
#login select {
width: 155px;
}
#login input.submit {
position: relative;
clear: left;
margin-left: 121px;
width: 85px;
margin-top: 5px;
}
#pie{
background-color: lightblue;
height: 18px;
text-align: center;
clear: both;
margin-left: 50px;
margin-right: 40px;
padding-top: 4px;

}
#loginErroneo {
color: red;
height: 18px;
clear: both;
text-align: left;
font-family: Calibri;
font-size: 12px;
font-weight: Bold;
margin: 10px;
padding-top: 10px;
margin-right: 10px;
}'
]

{ #category : #accessing }
WASICLogin >> triedNumber [
	^ triedNumber
]

{ #category : #accessing }
WASICLogin >> triedNumber: anObject [
	triedNumber := anObject
]

{ #category : #'as yet unclassified' }
WASICLogin >> updateRoot: anHtmlRoot [

    super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet resourceUrl: 'sic.css'.
    anHtmlRoot title: 'Websic'
]

{ #category : #accessing }
WASICLogin >> userName [
	^ userName
]

{ #category : #accessing }
WASICLogin >> userName: anObject [
	userName := anObject
]
