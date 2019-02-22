Class {
	#name : #LostCheck,
	#superclass : #CheckOperation,
	#instVars : [
		'lostDate'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
LostCheck >> lostDate [
	
	^ lostDate
]

{ #category : #accessing }
LostCheck >> lostDate: anObject [
	
	lostDate := anObject
]

{ #category : #printing }
LostCheck >> lostDateDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteDescription>
	^MADateDescription new 
        	accessor: #lostDate;
        	label: 'Fecha Extravío';
        	priority: 140;
		beRequired;
        	yourself
]
