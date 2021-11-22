Class {
	#name : #YavuWorkShift,
	#superclass : #YavuEntity,
	#instVars : [
		'startTime',
		'endTime'
	],
	#category : #'YavuAccounting-Entities'
}

{ #category : #'sin categoria' }
YavuWorkShift class >> label [ 

	^ 'Turno'
]

{ #category : #accessing }
YavuWorkShift class >> subsystemClass [
	^ Smalltalk at: #YavuAccountingSubsystem
]

{ #category : #'as yet unclassified' }
YavuWorkShift >> descriptionEndTime [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #endTime;
        	label: 'Hora Fin';
        	priority: 130;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuWorkShift >> descriptionStartTime [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #startTime;
        	label: 'Hora Inicio';
        	priority: 120;
        	yourself
]

{ #category : #accessing }
YavuWorkShift >> endTime [
	^ endTime
]

{ #category : #accessing }
YavuWorkShift >> endTime: anObject [
	endTime := anObject
]

{ #category : #accessing }
YavuWorkShift >> startTime [
	^ startTime
]

{ #category : #accessing }
YavuWorkShift >> startTime: anObject [
	startTime := anObject
]
