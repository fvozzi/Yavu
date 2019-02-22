Class {
	#name : #WALocalidadComponent,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'localidadForm'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WALocalidadComponent class >> canBeRoot [
	^ true
]

{ #category : #'as yet unclassified' }
WALocalidadComponent >> children [
    ^ Array with: localidadForm
]

{ #category : #'as yet unclassified' }
WALocalidadComponent >> initialize [ 

    super initialize.
    localidadForm := (Smalltalk at: #Localidad) new asComponent.
	localidadForm addValidatedForm
]
