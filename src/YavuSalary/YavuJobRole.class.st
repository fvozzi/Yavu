Class {
	#name : #YavuJobRole,
	#superclass : #YavuEntity,
	#category : #'YavuSalary-Entities'
}

{ #category : #testing }
YavuJobRole class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuJobRole class >> label [

	 ^'Puesto de Trabajo' 
]

{ #category : #accessing }
YavuJobRole class >> subsystemClass [
	^ Smalltalk at: #YavuSalarySubsystem
]
