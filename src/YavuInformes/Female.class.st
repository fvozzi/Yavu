Class {
	#name : #Female,
	#superclass : #CustomerType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
Female class >> code [
	"Devuelve el codigo de clase del receptor."

	^'F'
]

{ #category : #testing }
Female class >> correspondeA: xy [
	"Devuelve true si xy es un posible xy de la clase del receptor."
	
	^self xy = xy
]

{ #category : #accessing }
Female class >> label [

	^'Femenino' 
]

{ #category : #accessing }
Female class >> xy [
	"Devuelve el valor de xy usado en el calculo del numero de cuit."
	
	^'27'
]

{ #category : #accessing }
Female class >> zParaRestoUno [

	^'4'
]
