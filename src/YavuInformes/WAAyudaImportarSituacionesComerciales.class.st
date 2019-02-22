Class {
	#name : #WAAyudaImportarSituacionesComerciales,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAAyudaImportarSituacionesComerciales >> renderContentOn: html [

	html div class: 'titulo'; with: [html
		text: 'Importación de situaciones comerciales'].
	html div class: 'detalle'; with: [
		html paragraph: 'Se deberá proveer un archivo separado por comas con la información a cargar de las deudas, vigentes a la fecha actual, de todos los clientes del comercio.'].
		html div class: 'titulo'; with: [html text: 'El proceso'].
	html div class: 'detalle'; with: [
		html paragraph: 'El comercio creará el archivo con la información de sus deudores y la cargará al sistema cada vez que la tenga disponible. La frecuencia dependerá de cada comercio pero no deberá ser mayor a un mes. Cada actualización de deuda de un cliente deberá ser informada al sistema incluyendo, por supuesto, la cancelación de la misma. En ese momento el comercio informará la deuda en 0 que será lo que libere al cliente del informe de deuda.'].
		html div class: 'titulo'; with: [html text: 'El formato'].
		html div class: 'detalle'; with: [
			html paragraph: 'El archivo de texto deberá ser una archivo separado por comas que contenga la información y el formato como se explica debajo.'].
		html table: [
			html tableRow: [
				html 
					tableHeading: 'Campo';
					tableHeading: 'Valores Posibles';
					tableHeading: 'Comentario'].
			html tableRow: [
				html
					tableData: [html text: 'Documento'];
					tableData: [html text: 'DNI para Maculino o Femenino'; break; text: 'CUIT para Organización'];
					tableData: [html text: 'Es el número de documento que identifica al cliente y organización con deuda']].
			html tableRow: [
				html
					tableData: [html text: 'Nombre'];
					tableData: [html text: 'Nombre y Apellido o Denominación'];
					tableData: [html text: 'Es la denominación que identifica al cliente y organización con deuda']].	
			html tableRow: [
				html 
					tableData: [html text: 'Tipo de Cliente'];
					tableData: [CustomerType subclasses do: [:each |	html text: each code, ' = ', each name; break]];
					tableData: [html text: 'Un caracter (F, M u O) que identifica al tipo de cliente']].				
			html tableRow: [
				html
					tableData: [html text: 'Tipo de Operación'];
					tableData: [OperationType all do: [:each |	html text: each code, ' = ', each name; break]];
					tableData: [html text: 'Identifica el tipo de operación en la que el cliente contrajo la deuda.']].	
			html tableRow: [
				html
					tableData: [html text: #OperationCharacter];
					tableData: [OperationCharacter all do: [:each |	html text: each code, ' = ', each name; break]];
					tableData: [html text: 'Identifica en calidad de que el cliente contrajo la deuda.']].	
			html tableRow: [
				html
					tableData: [html text: 'Deuda'];
					tableData: [html text: 'Número que representa el monto adeudado actualmente por el cliente'];
					tableData: [html text: 'Deuda actual, cuando el cliente regularice la deuda se deberá informar cero']].	
			html tableRow: [
				html
					tableData: [html text: 'Fecha de último pago'];
					tableData: [html text: 'Fecha del último pago del cliente'];
					tableData: [html text: 'Es la fecha en que el cliente realizó el último pago en el comercio']]
				].
		html div class: 'titulo'; with: [html text: 'Ejemplo'].
		html div class: 'detalle'; with: [
			html 
				paragraph: '236xx037,JUAN PEREZ,M,PP,TIT,1750,01/01/2011';
				paragraph: '30222xx011,COMPANIA X,O,PP,TIT,1000,15/01/2011'].
		html div class: 'titulo'; with: [html text: 'Observación'].
		html div class: 'detalle'; with: [
			html 
				paragraph: 'Sí el archivo incluye encabezado deberá tildarse la opción para que el sistema no procese la primer linea.']
			
]

{ #category : #'as yet unclassified' }
WAAyudaImportarSituacionesComerciales >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
    anHtmlRoot stylesheet resourceUrl: 'ayuda.css'
]
