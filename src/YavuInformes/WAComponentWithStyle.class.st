Class {
	#name : #WAComponentWithStyle,
	#superclass : #WAYavuComponent,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAComponentWithStyle class >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
WAComponentWithStyle >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^self class claseDeAyuda
]

{ #category : #'as yet unclassified' }
WAComponentWithStyle >> renderMenuAyudaOn: html [
	"Renderiza el anchor de menu ayuda para el receptor.
	NOTA: cada clase que implemente la ayuda deberá definir la clase de ayuda."
	
	html div class: #ayuda; with: [html popupAnchor
		scrollbars: true;
		resizable: false;
		extent: 700 @ 500;
		position: 50 @ 50;
		callback: [self parent call: self claseDeAyuda new]; with: 'Ayuda'].  
]
