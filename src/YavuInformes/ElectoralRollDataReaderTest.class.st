Class {
	#name : #ElectoralRollDataReaderTest,
	#superclass : #TestCase,
	#category : #'YavuInformes-Test'
}

{ #category : #'as yet unclassified' }
ElectoralRollDataReaderTest >> fvElectoralRollBasicDataStream [

	^ReadStream on:  '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" lang="es">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Buscar personas por DNI - BuscarDatos.com</title>
	<link href="/twitter-bootstrap-v2/docs/assets/css/bootstrap.css" rel="stylesheet"> 
	<link href="/twitter-bootstrap-v2/docs/assets/css/bootstrap-responsive.css" rel="stylesheet"> 
	<link rel="stylesheet" type="text/css" href="/twitter-bootstrap-v2/docs/assets/css/estilo.css" />
	<link rel="stylesheet" type="text/css" href="/twitter-bootstrap-v2/css/estilo_paging.css" />
	
	<style type="text/css">
	
		.style1 {
			text-align: center;
			font-style: italic;
			font-size: medium;
			color: #0000FF;
		}
	.style2 {
		font-size: x-large;
		color: #0000FF;
		font-style: italic;
	}
	.style3 {
		font-family: "Courier New", Courier, monospace;
		font-size: x-large;
		color: #000000;
		font-style: normal;
	}
	body{font-family:arial,sans-serif}
	body{color:#333;margin:3px 8px 2em}#gbar{float:left;height:22px}
	#gbar{font-size:13px;padding-top:1px !important}
	.style19 {
		font-size: 12pt;
	}
	.style18 {
	body,td,a,p,.h{font-family:arial,sans-serif}
	body{color:#333;margin:3px 8px 2em}img,table{border:0}#sf{width:100%}#frame{width:564px;margin:auto 12px}#gbar{float:left;height:22px}.gbh,.gbd{border-top:1px solid #c9d7f1;font-size:1px}.gbh{height:0;position:absolute;top:24px;width:100%}#gbs,.gbm{background:#fff;left:0;position:absolute;text-align:left;visibility:hidden;z-index:1000}.gbm{border:1px solid;border-color:#c9d7f1 #36c #36c #a2bae7;z-index:1001}#guser{padding-bottom:7px !important;text-align:right}#gbar,#guser{font-size:13px;padding-top:1px !important}.gb1,.gb3,.gb3i,.gb3f{zoom:1;margin-right:.5em}.gb2,.gb2i,.gb2f{display:block;padding:.2em 
	}
	.style19 {
		font-family: "Times New Roman", Times, serif;
	}
	
	}.gbh{border-top:1px solid #c9d7f1;font-size:1px}
	.gbh{height:0;position:absolute;top:24px;width:100%}
	
		.centrado {
			text-align: center;
		}

.btn-custom22 { background-color: hsl(110, 56%, 16%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#398f28", endColorstr="#193f11"); background-image: -khtml-gradient(linear, left top, left bottom, from(#398f28), to(#193f11)); background-image: -moz-linear-gradient(top, #398f28, #193f11); background-image: -ms-linear-gradient(top, #398f28, #193f11); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #398f28), color-stop(100%, #193f11)); background-image: -webkit-linear-gradient(top, #398f28, #193f11); background-image: -o-linear-gradient(top, #398f28, #193f11); background-image: linear-gradient(#398f28, #193f11); border-color: #193f11 #193f11 hsl(110, 56%, 11%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.33); -webkit-font-smoothing: antialiased; }
.btn-custom23 { background-color: hsl(0, 69%, 22%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#b42121", endColorstr="#5e1111"); background-image: -khtml-gradient(linear, left top, left bottom, from(#b42121), to(#5e1111)); background-image: -moz-linear-gradient(top, #b42121, #5e1111); background-image: -ms-linear-gradient(top, #b42121, #5e1111); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #b42121), color-stop(100%, #5e1111)); background-image: -webkit-linear-gradient(top, #b42121, #5e1111); background-image: -o-linear-gradient(top, #b42121, #5e1111); background-image: linear-gradient(#b42121, #5e1111); border-color: #5e1111 #5e1111 hsl(0, 69%, 17%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.33); -webkit-font-smoothing: antialiased; }
.btn-custom24 { background-color: hsl(0, 71%, 46%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#c82222", endColorstr="#c82222"); background-image: -khtml-gradient(linear, left top, left bottom, from(#c82222), to(#c82222)); background-image: -moz-linear-gradient(top, #c82222, #c82222); background-image: -ms-linear-gradient(top, #c82222, #c82222); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #c82222), color-stop(100%, #c82222)); background-image: -webkit-linear-gradient(top, #c82222, #c82222); background-image: -o-linear-gradient(top, #c82222, #c82222); background-image: linear-gradient(#c82222, #c82222); border-color: #c82222 #c82222 hsl(0, 71%, 46%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.00); -webkit-font-smoothing: antialiased; }

.well-red {
    background-color: #d6d6d6;
    width:50%;
}

.well-blue {
    background-color: #d6d6d6;
    width:80%;
}
	
	</style>

</head>

<body onLoad="OnLoad()">

<br />
<br />

	

<!-- NO ME BORRES NUNCA! -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(["_setAccount", "UA-32701349-1"]);
  _gaq.push(["_trackPageview"]);

  (function() {
    var ga = document.createElement("script"); ga.type = "text/javascript"; ga.async = true;
    ga.src = ("https:" == document.location.protocol ? "https://ssl" : "http://www") + ".google-analytics.com/ga.js";
    var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- FIN DE NO ME BORRES NUNCA! -->

	

     <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="/ar">Ar.BuscarDatos.com</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="divider-vertical"></li>
<li><a href="/m/"><i><strong>M&oacute;vil</strong></i></a></li><li><a href="http://buscardatos.com/Personas/">Personas</a></li><li><a href="http://buscardatos.com/Empresas/">Empresas</a></li><li><a href="http://buscardatos.com/Vehiculos/">Veh&iacute;culos</a></li><!--              <li><a href="empresas.html">Empresas</a></li> -->
<!--              <li><a href="dominios.html">Dominios</a></li> -->
<!--              <li><a href="contacto.html">Contacto</a></li> -->

<li><a href="http://buscardatos.com/Entrada/">Ingresar</a></li>  
              
            </ul>
<!--            <ul class="nav pull-right">
              <li><a href="inscripcion.html">Inscripci&oacute;n</a></li>
            </ul>    -->
            
          </div><!--/.nav-collapse -->
        </div>
      </div>
  </div>
		












<br />
	<div class="span12 center"> 
		<div class="row"> 
			<div class="span3 offset4"> 
				<p><a class="btn btn-primary" href="/cl">Chile</a></p> 
			</div>
			<div class="span3"> 
				<p><a class="btn btn-custom24" href="/py">Paraguay</a></p> 
			</div> 
		</div>
	</div> 

<br /><br />

<div class="well-ads" align="center">
	<script type="text/javascript"><!--
		google_ad_client = "ca-pub-0453490875541234";
		google_ad_slot = "4595526219";
		google_ad_width = 728;
		google_ad_height = 90;
		//-->
		</script>
		<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
	</script>
</div>
  <center><div class="container">
	<center>
	<br />
	<div class="well well-red">
		<h2><i>Resultado de la b&uacute;squeda</i></h2>
		<h4>Padr&oacute;n de Argentina</h4>
		<br />
		<p style="font-size:larger">Haga clic en el nombre para obtener datos complementarios.
		El s&iacute;mbolo (f) despu&eacute;s del nombre significa "fallecido/a"
		El campo cuit/cuil/dni es el n&uacute;mero de cuit o cuil. El DNI son los n&uacute;meros entre guiones del cuit/cuil.
		<i>La direcci&oacute;n y/o la localidad en letra inclinada (it&aacute;lica o bastardilla) es la direcci&oacute;n fiscal.</i>
	</div>
</div>

	<table id="hor-minimalist-b" summary="JJ">
	    <thead>
	    	<tr>
	        	<th scope="col"></th>
	          <th scope="col">sexo</th>
	        	<th scope="col" nowrap="nowrap">cuit / cuil</th>
	          <th scope="col">edad</th>
	          <th scope="col">apellido y nombre</th>
	          <th scope="col">direcci&oacute;n</th>
	          <th scope="col">localidad</th>
	        </tr>
	    </thead>
	<td ALIGN="left"><a class="label label-info" href="../../personas.php?nombre=Vozzi Facundo&cuit=23-27634975-9''>ver m&aacute;s</a></td><td><center>M</center></td><td>23-27634975-9</td><td >34</td><td>Vozzi Facundo</td><td ALIGN="left">Espa</center></td><td ALIGN="left">Jun&iacute;n, Buenos Aires</center></td></tr></table></pre>
<div class="container">
	<center>
	<div class="well well-blue">
La Clave de Identificaci&oacute;n Tributaria de las personas f&iacute;sicas es un dato personal, 
en la medida que vincula a una persona con su identificaci&oacute;n tributaria. 
No obstante, conforme la legislaci&oacute;n argentina en materia de datos personales, 
en particular el art&iacute;culo 5 de la Ley 25.326 de Protecci&oacute;n de Datos Personales, 
la CUIT es unos de los datos de car&aacute;cter personal que no requieren el consentimiento de su titular para su tratamiento.
Al mismo tiempo, la CUIT de los contribuyentes es un dato de acceso p&uacute;blico, que de hecho es 
publicada por la Administraci&oacute;n Federal de Ingresos P&uacute;blicos a trav&eacute;s del Padr&oacute;n de Personas F&iacute;sicas y Jur&iacute;dicas.
El CUIT es un c&oacute;digo num&eacute;rico con que la Administraci&oacute;n Federal de Ingresos P&uacute;blicos (AFIP), identifica a empresas, comercios y trabajadores aut&oacute;nomos.
Es imprescindible para emitir comprobantes de pago y para realizar tr&aacute;mites ante los organismos impositivos, de seguridad social y otros estatales.
Tambi&eacute;n es necesario para que los trabajadores aut&oacute;nomos puedan hacer sus aportes previsionales para la jubilaci&oacute;n o pensi&oacute;n. Las personas que trabajan
en relaci&oacute;n de dependencia tienen un c&oacute;digo identificatorio similar, llamado Clave &Uacute;nica de Identificaci&oacute;n Laboral (CUIL).
Las dos primeras cifras del CUIT/CUIL
indican si es un hombre, una mujer o una empresa. Las ocho cifras siguientes (entre guiones) son el DNI (personas f&iacute;sicas). La &uacute;ltima cifra es un d&iacute;gito control.
	</div>
</div>


<br>
		<div class="well-ads" align="center">
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-0453490875541234";
			google_ad_slot = "6735842946";
			google_ad_width = 728;
			google_ad_height = 90;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
		</div>

		<footer class="footer" style="border-top:1px solid #EEE;padding-top:20px;"> 
			<p>
				<div class="span12 center">
				<center>
					<a class="a2a_dd" href="http://www.addtoany.com/share_save">Compartir&nbsp;|&nbsp;</a>
					<span class="a2a_divider"></span>
					<a class="a2a_button_facebook"></a>
					<a class="a2a_button_twitter"></a>
					<a class="a2a_button_email"></a>
					<span class="a2a_divider"></span>
					<a href="/index.php">BuscarDatos.com</a>
					<a href="mailto:buscardatos.com@gmail.com">&nbsp;|&nbsp;Contacto</a>&nbsp;|&nbsp;<a href="/Includes/politicas.php">Pol&iacute;ticas de privacidad</a>
				</div>
			</p> 
		</footer> 
   
</body>
</html>'
]

{ #category : #'as yet unclassified' }
ElectoralRollDataReaderTest >> fvElectoralRollCompleteDataStream [

	^ReadStream on: '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es-es" lang="es-es" xmlns:fb="http://www.facebook.com/2008/fbml">	
<head>
<!-- <title>Fixed 3-column over 4-column layout (basic)</title> -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta property="fb:admins" content="100000385974271"/>
<meta property="fb:app_id" content="395631557157703"/>
<link href="/twitter-bootstrap-v2/docs/assets/css/bootstrap.css" rel="stylesheet"> 
<link href="/twitter-bootstrap-v2/docs/assets/css/bootstrap-responsive.css" rel="stylesheet"> 

<link rel="stylesheet" type="text/css" href="mainn.css" />
<link rel="stylesheet" type="text/css" href="/css/layout72.css" media="screen" />

<!-- http://charliepark.org/bootstrap_buttons/ -->

<style type="text/css">

.btn-custom21 { background-color: hsl(214, 38%, 31%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#83a1c7", endColorstr="#314b6d"); background-image: -khtml-gradient(linear, left top, left bottom, from(#83a1c7), to(#314b6d)); background-image: -moz-linear-gradient(top, #83a1c7, #314b6d); background-image: -ms-linear-gradient(top, #83a1c7, #314b6d); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #83a1c7), color-stop(100%, #314b6d)); background-image: -webkit-linear-gradient(top, #83a1c7, #314b6d); background-image: -o-linear-gradient(top, #83a1c7, #314b6d); background-image: linear-gradient(#83a1c7, #314b6d); border-color: #314b6d #314b6d hsl(214, 38%, 22.5%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.56); -webkit-font-smoothing: antialiased; }
.btn-custom22 { background-color: hsl(214, 38%, 21%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#6086b7", endColorstr="#213249"); background-image: -khtml-gradient(linear, left top, left bottom, from(#6086b7), to(#213249)); background-image: -moz-linear-gradient(top, #6086b7, #213249); background-image: -ms-linear-gradient(top, #6086b7, #213249); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #6086b7), color-stop(100%, #213249)); background-image: -webkit-linear-gradient(top, #6086b7, #213249); background-image: -o-linear-gradient(top, #6086b7, #213249); background-image: linear-gradient(#6086b7, #213249); border-color: #213249 #213249 hsl(214, 38%, 12.5%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.56); -webkit-font-smoothing: antialiased; }
.btn-custom23 { background-color: hsl(214, 38%, 13%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#4a71a5", endColorstr="#141f2d"); background-image: -khtml-gradient(linear, left top, left bottom, from(#4a71a5), to(#141f2d)); background-image: -moz-linear-gradient(top, #4a71a5, #141f2d); background-image: -ms-linear-gradient(top, #4a71a5, #141f2d); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #4a71a5), color-stop(100%, #141f2d)); background-image: -webkit-linear-gradient(top, #4a71a5, #141f2d); background-image: -o-linear-gradient(top, #4a71a5, #141f2d); background-image: linear-gradient(#4a71a5, #141f2d); border-color: #141f2d #141f2d hsl(214, 38%, 4.5%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.56); -webkit-font-smoothing: antialiased; }
.btn-custom24 { background-color: hsl(214, 38%, 3%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#3a5982", endColorstr="#04070a"); background-image: -khtml-gradient(linear, left top, left bottom, from(#3a5982), to(#04070a)); background-image: -moz-linear-gradient(top, #3a5982, #04070a); background-image: -ms-linear-gradient(top, #3a5982, #04070a); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #3a5982), color-stop(100%, #04070a)); background-image: -webkit-linear-gradient(top, #3a5982, #04070a); background-image: -o-linear-gradient(top, #3a5982, #04070a); background-image: linear-gradient(#3a5982, #04070a); border-color: #04070a #04070a hsl(214, 38%, -5.5%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.56); -webkit-font-smoothing: antialiased; }
.btn-custom25 { background-color: hsl(312, 100%, 59%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#ffeffb", endColorstr="#fe2dd5"); background-image: -khtml-gradient(linear, left top, left bottom, from(#ffeffb), to(#fe2dd5)); background-image: -moz-linear-gradient(top, #ffeffb, #fe2dd5); background-image: -ms-linear-gradient(top, #ffeffb, #fe2dd5); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #ffeffb), color-stop(100%, #fe2dd5)); background-image: -webkit-linear-gradient(top, #ffeffb, #fe2dd5); background-image: -o-linear-gradient(top, #ffeffb, #fe2dd5); background-image: linear-gradient(#ffeffb, #fe2dd5); border-color: #fe2dd5 #fe2dd5 hsl(312, 100%, 49.5%); color: #333 !important; text-shadow: 0 1px 1px rgba(255, 255, 255, 0.62); -webkit-font-smoothing: antialiased; }
.btn-custom122 { background-color: hsl(110, 56%, 16%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#398f28", endColorstr="#193f11"); background-image: -khtml-gradient(linear, left top, left bottom, from(#398f28), to(#193f11)); background-image: -moz-linear-gradient(top, #398f28, #193f11); background-image: -ms-linear-gradient(top, #398f28, #193f11); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #398f28), color-stop(100%, #193f11)); background-image: -webkit-linear-gradient(top, #398f28, #193f11); background-image: -o-linear-gradient(top, #398f28, #193f11); background-image: linear-gradient(#398f28, #193f11); border-color: #193f11 #193f11 hsl(110, 56%, 11%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.33); -webkit-font-smoothing: antialiased; }
.btn-custom124 { background-color: hsl(0, 71%, 46%) !important; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#c82222", endColorstr="#c82222"); background-image: -khtml-gradient(linear, left top, left bottom, from(#c82222), to(#c82222)); background-image: -moz-linear-gradient(top, #c82222, #c82222); background-image: -ms-linear-gradient(top, #c82222, #c82222); background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #c82222), color-stop(100%, #c82222)); background-image: -webkit-linear-gradient(top, #c82222, #c82222); background-image: -o-linear-gradient(top, #c82222, #c82222); background-image: linear-gradient(#c82222, #c82222); border-color: #c82222 #c82222 hsl(0, 71%, 46%); color: #fff !important; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.00); -webkit-font-smoothing: antialiased; }


		.centrado {
			text-align: center;
			font-style:italic;
		}
		
		.normal {
			font-style:normal;
		}
		
		body {font-family:arial,sans-serif}
		
		body{color:#333;margin:3px 8px 2em}#gbar{float:left;height:22px}
		#gbar{font-size:13px;padding-top:1px !important}
		.gbh{border-top:1px solid #c9d7f1;font-size:1px}
		.gbh{height:0;position:absolute;top:24px;width:100%}
		.style21 {
			font-size: medium;
		}
		.style23 {
			border-width: 0px;
		}
		.style24 {
			margin-bottom: 13px;
		}

		p.parte1{
			display:inline;
			font-weight:bold;
			font-variant:small-caps;
			font-style:normal;
			line-height:110%;
		}
		p.parte2{
			display:inline;
			font-style:italic;
			font-weight:normal;
			line-height:110%;
		}

		p.parte3{
			display:inline;
			font-style:normal;
			line-height:100%;
		}

		p.peq {font-size:x-small;}

	p.head
	{
		font-family:Georgia,serif;
		color:#4E443C;
		font-variant: small-caps; text-transform: none; font-weight: 100; margin-bottom: 0;
		text-align:left;
		line-height:75%;
	}

	p.para1
	{
		font-family: "Helvetica Neue", "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
		font-size: 14px;
		margin-top: .5em; color: #666;
		text-align:left;
		margin-left:15px;
		line-height:75%;
	}
	
	p.para2
	{
		font-family:Georgia,serif;
		font-size: .8em;
		font-weight: bold;
		text-transform:uppercase;
		letter-spacing:2px; 	
	}

	p.small {line-height:30%;}

	a:link {COLOR: blue}
	
	.well-red {
	    background-color: #d6d6d6;
	    width:50%;
	}

	.well-blue {
	    background-color: #F5EFB3;
	    width:80%;
	}

	.well-green {
	    background-color: #d6d6d6;
	    width:80%;
	}
</style>

<title>Vozzi Facundo, DNI 27.634.975, CUIT 23-27634975-9, BuscarDatos.com</title>
<script type="text/javascript" src="http://www.buscardatos.com/Includes/tips/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="http://www.buscardatos.com/Includes/tips/jquery.google_menu.js"></script>
<link rel="stylesheet" type="text/css" href="http://www.buscardatos.com/Includes/tips/google_menu.css"/>
<script type="text/javascript">
        $("document").ready(function(){
            $(".menu").fixedMenu();
        });
        </script>
</head>	

<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&appId=395631557157703";
  fjs.parentNode.insertBefore(js, fjs);
}(document, "script", "facebook-jssdk"));</script>

<br />
<br />
 	

<!-- NO ME BORRES NUNCA! -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(["_setAccount", "UA-32701349-1"]);
  _gaq.push(["_trackPageview"]);

  (function() {
    var ga = document.createElement("script"); ga.type = "text/javascript"; ga.async = true;
    ga.src = ("https:" == document.location.protocol ? "https://ssl" : "http://www") + ".google-analytics.com/ga.js";
    var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- FIN DE NO ME BORRES NUNCA! -->

	

     <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="/ar">Ar.BuscarDatos.com</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="divider-vertical"></li>
<li><a href="/m/"><i><strong>M&oacute;vil</strong></i></a></li><li><a href="http://buscardatos.com/Personas/">Personas</a></li><li><a href="http://buscardatos.com/Empresas/">Empresas</a></li><li><a href="http://buscardatos.com/Vehiculos/">Veh&iacute;culos</a></li><!--              <li><a href="empresas.html">Empresas</a></li> -->
<!--              <li><a href="dominios.html">Dominios</a></li> -->
<!--              <li><a href="contacto.html">Contacto</a></li> -->

<li><a href="http://buscardatos.com/Entrada/">Ingresar</a></li>  
              
            </ul>
<!--            <ul class="nav pull-right">
              <li><a href="inscripcion.html">Inscripci&oacute;n</a></li>
            </ul>    -->
            
          </div><!--/.nav-collapse -->
        </div>
      </div>
  </div>
		












<br />
	<div class="span12 center"> 
		<div class="row"> 
			<div class="span3 offset5">
				<p><a class="btn btn-custom22" href="http://cl.buscardatos.com">Chile</a></p> 
			</div> 
			<div class="span3"> 
				<p><a class="btn btn-custom124" href="http://py.buscardatos.com">Paraguay</a></p> 
			</div> 
		</div>
	</div> 



<div class="well-ads" align="center">
	<script type="text/javascript"><!--
		google_ad_client = "ca-pub-0453490875541234";
		google_ad_slot = "4595526219";
		google_ad_width = 728;
		google_ad_height = 90;
		//-->
		</script>
		<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
	</script>
</div>
	
	<br />
	<div id="centerColumn" />
		  <center>	
		<div class="well well-red">
			    <h1>Vozzi Facundo</h1>
			    <h2>CUIT: 23-27634975-9</h2>
		</div>
	  </div>
	
	
<br />
<div class="container">
	<div class="row">
		<!-- columna derecha -->
		<div id="centerColumn" />
			<div class="span2"> 
			&nbsp;
			</div>
			<div class="span10"> 
				<div class="well well-blue">
					<h3>DATOS DEL PADR&Oacute;N</h3>
<br /><p class="parte1">Sexo: </p><p class=''parte2''>Masculino</p><br /><p class="parte1">Apellido y nombre: </p><p class=''parte2''>Vozzi Facundo</p><br /><p class="parte1">Fecha de nacimiento: </p><p class=''parte2''>8 de octubre de 1979</p><br /><p class="parte1">Edad: </p><p class=''parte2''>34 años</p><br /><p class="parte1">Direcci&oacute;n: </p><p class=''parte2''>Espa</p><br /><p class="parte1">Localidad: </p><p class=''parte2''>Junin</p><br /><p class="parte1">Provincia: </p><p class=''parte2''>Buenos Aires</p><br /><p class="parte1">C&oacute;digo Postal: </p><p class=''parte2''>B6000GKJ</p><br /><p class="parte1">Ocupaci&oacute;n: </p><p class=''parte2''>Estud.</p></div></div></div></div></div><p class="btn-toolbar" align="center"><span class="btn-group"><a class="btn btn-custom21 btn-large" href="./Personas/dateas_personas.php" style="text-decoration:none;color:white;">M&aacute;s informaci&oacute;n en el<br />Informe Comercial Dateas</a></span></p><p class="btn-toolbar" align="center"><span class="btn-group"><a class="btn btn-custom23 btn-large" href="./Personas/dateas_localiza.php" style="text-decoration:none;color:white;">Solicitar Localizaci&oacute;n Comprobada<br />de Paradero de Vozzi Facundo</a></span></p><div class="container">
	<center>
	<div class="well well-green">
		La Clave de Identificaci&oacute;n Tributaria de las personas f&iacute;sicas es un dato personal, 

		en la medida que vincula a una persona con su identificaci&oacute;n tributaria. 
		No obstante, conforme la legislaci&oacute;n argentina en materia de datos personales, 
		en particular el art&iacute;culo 5 de la Ley 25.326 de Protecci&oacute;n de Datos Personales, 
		la CUIT, junto con nombre, documento nacional de identidad, identificaci&oacute;n tributaria o previsional, ocupaci&oacute;n,
		fecha de nacimiento y domicilio
		son datos de car&aacute;cter personal que no requieren el consentimiento de su titular para su tratamiento.
		Al mismo tiempo, estos datos de los contribuyentes son datos de acceso p&uacute;blico, que de hecho son
		publicados por la Administraci&oacute;n Federal de Ingresos P&uacute;blicos a trav&eacute;s del Padr&oacute;n de Personas F&iacute;sicas y Jur&iacute;dicas,
		y/o por el Banco Central de la Rep&uacute;blica Argentina y/o las empresas telef&oacute;nicas.
	</div>
</div>
		<div class="well-ads" align="center">
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-0453490875541234";
			google_ad_slot = "6735842946";
			google_ad_width = 728;
			google_ad_height = 90;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
		</div>

		<footer class="footer" style="border-top:1px solid #EEE;padding-top:20px;"> 
			<p>
				<div class="span12 center">
				<center>
					<a class="a2a_dd" href="http://www.addtoany.com/share_save">Compartir&nbsp;|&nbsp;</a>
					<span class="a2a_divider"></span>
					<a class="a2a_button_facebook"></a>
					<a class="a2a_button_twitter"></a>
					<a class="a2a_button_email"></a>
					<span class="a2a_divider"></span>
					<a href="/index.php">BuscarDatos.com</a>
					<a href="mailto:buscardatos.com@gmail.com">&nbsp;|&nbsp;Contacto</a>&nbsp;|&nbsp;<a href="/Includes/politicas.php">Pol&iacute;ticas de privacidad</a>
				</div>
			</p> 
		</footer> 
		

	</body>
</html>

'
]

{ #category : #'as yet unclassified' }
ElectoralRollDataReaderTest >> fvPerson [
	
	^NaturalPerson nombre: 'Facundo Vozzi' dni: '27634975' sexo: 'M'
]

{ #category : #'as yet unclassified' }
ElectoralRollDataReaderTest >> test1 [

	| electoralRollDataReader |
	
	electoralRollDataReader := (ElectoralRollDataReader on: self fvPerson) htmlBasicStream: self fvElectoralRollBasicDataStream.
	electoralRollDataReader htmlCompleteStream: self fvElectoralRollCompleteDataStream.
	electoralRollDataReader parseHtmlData.
	self assert: electoralRollDataReader nameLiteral = 'Vozzi Facundo'.
	self assert: electoralRollDataReader cuitLiteral = '23-27634975-9'.
	self assert: electoralRollDataReader basicData sex = 'Masculino'.
	self assert: electoralRollDataReader basicData name = 'Vozzi Facundo'.
	self assert: electoralRollDataReader basicData birthday = '8 de octubre de 1979'.
	self assert: electoralRollDataReader basicData age = '34'.
	self assert: electoralRollDataReader basicData address = 'Espa'.
	self assert: electoralRollDataReader basicData city = 'Junin'.
	self assert: electoralRollDataReader basicData state = 'Buenos Aires'.
	self assert: electoralRollDataReader basicData zipCode = 'B6000GKJ'.
	self assert: electoralRollDataReader basicData occupation = 'Estud.'
	
	
]
