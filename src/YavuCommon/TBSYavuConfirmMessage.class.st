Class {
	#name : #TBSYavuConfirmMessage,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'message'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'sin categoria' }
TBSYavuConfirmMessage class >> messsage: unString [
	"Devuelve una nueva instancia del receptor con unString como el mensaje."
	
	^self new initializeMessage: unString
]

{ #category : #'sin categoria' }
TBSYavuConfirmMessage >> descriptionMensaje [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #message;
        	priority: 100;
		 	beReadonly;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'sin categoria' }
TBSYavuConfirmMessage >> initializeMessage: unString [

	message := unString
]

{ #category : #'sin categoria' }
TBSYavuConfirmMessage >> message [ 
	
	^message
]
