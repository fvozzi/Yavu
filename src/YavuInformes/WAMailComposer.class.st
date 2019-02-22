Class {
	#name : #WAMailComposer,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAMailComposer class >> advertisingHTMLContents [
		
	^'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WebSic -Notificación</title>
</head>

<body>
<div id="encabezado" style="height: 85px;margin-left: 20px;margin-right: 20px;" >
			<div id="logo" style="float: left;width: 25%;">
				<img alt="" src="http://yavusoft.com.ar/resources/logo-ext.png" style="width: 100%;">
			</div>
			<div id="titulo" style="width: 70%;position: relative;top: 20px;padding: 4px;border-width: 1px;border-bottom: solid;text-align: right;float: left;">
				<h1 style="font-family: Calibri;font-size: 16px;font-weight: Bold;margin: 0;">Boletín de novedades</h1>
			</div>
		</div>
<div id="bodyleft"style="height: 340px;margin-left: 20px; margin-top: 3px; float: left;width: 30%; border-style: groove; border-width: 1px;">
  <div style="background-color: lightblue;text-align: center;font-family: Calibri;font-size: 16px;font-weight: Bold;">Informes disponibles</div>
  <div style="text-align: center; float: left;width: 100%;"><img alt="" src="http://yavusoft.com.ar/resources/basico.png" style="width: 100%;"></div>
 <div style="text-align: center; float: left;width: 100%;"><img alt="" src="http://yavusoft.com.ar/resources/basicoPlus.png" style="width: 100%;"></div>
  <div style="text-align: center; float: left;width: 100%;"><img alt="" src="http://yavusoft.com.ar/resources/premium.png" style="width: 100%;"></div>
</div>
<div id="bodymiddle"style="margin: 3px;height: 340px; float: left;width: 30%;background-color: lightblue; border-style: groove; border-width: 1px;">
	<div style="background-color: white;text-align: center;font-family: Calibri;font-size: 16px;font-weight: Bold;">Recordatorio</div>
    <div style="float: left; width: 20%;margin: auto;">
			<img alt="" src="http://yavusoft.com.ar/resources/atencion.png"/ style="margin: 10px;"></div>
  	<div style="float: left;width: 75%;font-family: Calibri;font-size: 14px;padding: 5px;">Recuerde actualizar la base de datos de sus morosos con la mayor frecuencia posible. Esto es muy importante Ud., para los demás comercios y, por supuesto, para sus clientes.
Puede hacer esto directamente desde el sistema (http://websic.com.ar) o enviando un correo electronico a morosos@websic.com.ar.</div>	
</div>
<div id="bodyright"style="margin: 3px; height: 340px;float: left;width: 30%; border-style: groove; border-width: 1px;">
<div style="background-color: white;text-align: center; background-color: lightblue;font-family: Calibri;font-size: 16px;font-weight: Bold;">Base de Datos</div>
<ul style="font-family: Calibri;font-size: 16px;">
<li>Comerios</li>
<li>Deudores</li>
<li>Cheques denunciados</li>
<li>Afectaciones sistema financiero</li>
<li>Cheques rechazados</li>
<li>Padrón Electoral</li>
</ul>
</div>
</div>
<div id="pie" style= "width: 91%;margin-left: 20px; margin-top: 10px; clear: both; border-style: groove; border-width: 1px;text-align: right;">
<div id="logoRegistroNacional" style="width:250px;">
			<img alt="" src="http://yavusoft.com.ar/resources/isologotipo-registro-2011.png" style="width:250px;"></div>
</div>
</body>
</html>

'
]

{ #category : #'as yet unclassified' }
WAMailComposer class >> advertisingMailFor: anUser [
	
	| email interface |
	
	anUser email isNil ifTrue: [^self].
	email := PMEmail new
 		from: 'info@websic.com.ar';
		to: anUser email;
		subject: 'WebSic - Noticias';
		htmlBody: self advertisingHTMLContents;
		attachFile: anUser financialSituationsOfCommerceFileReference;
		yourself.

	interface := PMInterface new.
	interface apiKey: '571c75a0-e38e-4127-b27d-424847952565'.
	interface send: email

		

		
	
]

{ #category : #'as yet unclassified' }
WAMailComposer class >> setMailSender [ 

"	WACurrentRequestContext value application 
		preferenceAt: #smtpUsername put: 'facundo.vozzi@websic.com.ar';
		preferenceAt: #smtpPassword put: 'sarmiento09'"
	MailSender setSmtpServer: 'smtp.fibertel.com.ar'
]

{ #category : #'as yet unclassified' }
WAMailComposer class >> style [

	^'#encabezado {
height: 85px;
margin-left: 20px;
margin-right: 20px;
}

#encabezado #logo img{
width: 100%;
}

#encabezado #logo {
margin-left: 30px;
float: left;
width: 12%;
}

#encabezado #titulo {
width: 68%;
position: relative;
top: 20px;
padding: 4px;
background-color: lightblue ;
text-align: center;
float: left;
}

#encabezado #logoRegistroNacional img{
width: 96% ;
}

#encabezado #logoRegistroNacional {
width: 15%;
float: left;
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
margin: 0px;
}

h4 {
font-family: Calibri;
font-size: 50px;
font-weight: bold;
margin: 0px;
color: lightblue;
}

h5 {
font-family: Calibri;
font-size: 12px;
font-weight: Normal;
padding: 0px;
margin: 0px;
}


.titulo1 {
font-family: Calibri;
font-size: 16px;
font-weight: bold;
background: #A4A4A4;
color: white;
}

.titulo2 {
font-family: Calibri;
font-size: 16px;
font-weight: bold;
}


.label {
font-family: Calibri;
font-size: 16px;
}


.labelCheckBox {
font-family: Calibri;
font-size: 16px;
font-weight: normal;
margin: 0px;}

#pie{
background-color: lightblue;
height: 18px;
text-align: center;
clear: both;
margin-left: 40px;
margin-right: 40px;
padding-top: 4px;
margin-bottom: 0px;

}
'
]
