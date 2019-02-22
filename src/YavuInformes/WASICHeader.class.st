Class {
	#name : #WASICHeader,
	#superclass : #WAYavuComponent,
	#category : #'YavuInformes-View'
}

{ #category : #rendering }
WASICHeader >> renderContentOn: html [
	"Renderiza el header del sistema."

	html div id: 'encabezado'; with: [
		html div id: 'logo'; with: [html image resourceUrl: 'logo.png'].
		html div id: 'titulo'; with: [html heading level1 with: [html text: 'SiC - Sistema de Informes Comerciales']].
		html div id: 'logoRegistroNacional'; with: [html image resourceUrl: 'img/isologotipoPDP.jpg'].
		]
]
