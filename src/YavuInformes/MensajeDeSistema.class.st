Class {
	#name : #MensajeDeSistema,
	#superclass : #YvObject,
	#instVars : [
		'mensaje'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
MensajeDeSistema class >> mensaje: unString [
	"Devuelve una nueva instancia del receptor con unString como el mensaje."
	
	^self new inicializarMensaje: unString
]

{ #category : #'sin categoria' }
MensajeDeSistema >> descriptionMensaje [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #mensaje;
        	priority: 100;
		 beReadonly;
        	yourself
]

{ #category : #'sin categoria' }
MensajeDeSistema >> inicializarMensaje: unString [

	mensaje := unString
]

{ #category : #'sin categoria' }
MensajeDeSistema >> mensaje [ 
	
	^mensaje
]
