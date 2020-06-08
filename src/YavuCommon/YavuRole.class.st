Class {
	#name : #YavuRole,
	#superclass : #YavuEntity,
	#instVars : [
		'menuElements',
		'yavuObjects'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #testing }
YavuRole class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuRole class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Rol'
]

{ #category : #accessing }
YavuRole class >> subsystemClass [

	^Smalltalk at: #YavuSecuritySubsystem 
]

{ #category : #accessing }
YavuRole >> allowedEntitiesClasses [

	^self yavuObjects 
]

{ #category : #descriptions }
YavuRole >> descriptionMenuElements [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #menuElements;
		label: 'Acceso';
		priority: 130;
		beExtensible;
		componentClass: MAListCompositonComponent;
		options: self yavuSystem menuElements;
			reference: MAStringDescription new;
		beSorted; 
		yourself
]

{ #category : #initialization }
YavuRole >> initialize [ 

	super initialize.
	menuElements := OrderedCollection new.
	yavuObjects := OrderedCollection new
]

{ #category : #accessing }
YavuRole >> menuElements [

	^menuElements
]

{ #category : #accessing }
YavuRole >> menuElements: anObject [
	menuElements := anObject
]

{ #category : #configuration }
YavuRole >> subsystem [ 

	^ self yavuSystem loginSubsystem
	
]

{ #category : #accessing }
YavuRole >> yavuObjects [
	^ yavuObjects
]

{ #category : #accessing }
YavuRole >> yavuObjects: anObject [

	yavuObjects := anObject
]

{ #category : #descriptions }
YavuRole >> yavuObjectsDescription [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #yavuObjects;
		label: 'Objetos permitidos';
		priority: 140;
		beExtensible;
		componentClass: MAListCompositonComponent;
		options: self yavuSystem yavuObjects;
		beSorted; 
		reference: MAStringDescription new;
		yourself
]
