Class {
	#name : #Male,
	#superclass : #CustomerType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
Male class >> code [
	"Devuelve el codigo de clase del receptor."

	^'M'
]

{ #category : #testing }
Male class >> correspondeA: xy [
	"Devuelve true si xy es un posible xy de la clase del receptor."
	
	^xy asNumber between: 20 and: 26
]

{ #category : #accessing }
Male class >> label [

	^'Masculino'
]

{ #category : #accessing }
Male class >> xy [
	"Devuelve el valor de xy usado en el calculo del numero de cuit."
	
	^'20'
]

{ #category : #accessing }
Male class >> zParaRestoUno [

	^'9'
]
