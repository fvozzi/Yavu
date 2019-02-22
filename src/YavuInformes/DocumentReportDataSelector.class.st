Class {
	#name : #DocumentReportDataSelector,
	#superclass : #ReportDataSelector,
	#instVars : [
		'documentNumber',
		'customerType'
	],
	#category : #'YavuInformes-View'
}

{ #category : #updating }
DocumentReportDataSelector >> crearNuevoInforme [
	"Privado - Crea un nuevo informe en función a los parametros ingresado por el usuario."
	
	^FinancialReport crearInformePorDocumento: self documentNumber
]

{ #category : #accessing }
DocumentReportDataSelector >> customerType [
	
	^ customerType
]

{ #category : #accessing }
DocumentReportDataSelector >> customerType: anObject [
	
	customerType := anObject
]

{ #category : #accessing }
DocumentReportDataSelector >> documentNumber [
	
	^ documentNumber
]

{ #category : #accessing }
DocumentReportDataSelector >> documentNumber: anObject [
	
	documentNumber := anObject.
	self extractDNINumber 
]

{ #category : #'as yet unclassified' }
DocumentReportDataSelector >> labelForTab [

	^'Busqueda por documento'
]

{ #category : #rendering }
DocumentReportDataSelector >> renderContentOn: html [
	"Renderiza el ingreso de datos requeridos por el receptor."

	html div id: 'firstStep'; with:[
	super renderContentOn: html.
	html div id: 'ingresoDNI'; with:[
		html div class: 'titulo2'; with: [html text: 'Ingreso número de DNI, CUIL o CUIT:'].
		html textInput 
			callback: [:numero | self documentNumber: numero];
			value:  self documentNumber].
	self renderButtonNextOn: html].
	"self renderElectoralRollCaptchaOn: html"
		
]

{ #category : #'as yet unclassified' }
DocumentReportDataSelector >> tabIndex [

	^1
]
