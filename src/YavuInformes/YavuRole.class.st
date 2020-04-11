Class {
	#name : #YavuRole,
	#superclass : #YvEntity,
	#instVars : [
		'menuElements',
		'securityFunctions'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
YavuRole class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Rol'
]

{ #category : #'sin categoria' }
YavuRole >> addMenuElement: aMenuElementName view: aWAComponent [

	self menuElements add: (YavuMenuElement label: aMenuElementName view: aWAComponent)

]

{ #category : #'sin categoria' }
YavuRole >> allowedEntitiesClasses [

	^self securityFunctions collect: [:each | each yavuObjectClass]  
]

{ #category : #'sin categoria' }
YavuRole >> descriptionMenuElements [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #menuElements;
		label: 'Acceso';
		priority: 130;
		componentClass: MAListCompositonComponent;
		options: YavuMenuElement selectableMenuElements;
		beSorted; 
		yourself
]

{ #category : #'as yet unclassified' }
YavuRole >> initialize [ 

	super initialize.
	menuElements := OrderedCollection new.
	securityFunctions := OrderedCollection new
]

{ #category : #'sin categoria' }
YavuRole >> menuElements [

	^menuElements
]

{ #category : #'sin categoria' }
YavuRole >> menuElements: anObject [
	menuElements := anObject
]

{ #category : #'sin categoria' }
YavuRole >> securityFunctions [
	^ securityFunctions
]

{ #category : #'sin categoria' }
YavuRole >> securityFunctions: anObject [
	securityFunctions := anObject
]

{ #category : #'sin categoria' }
YavuRole >> securityFunctionsDescription [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #securityFunctions;
		label: 'Entidades permitidas';
		priority: 140;
		componentClass: MAListCompositonComponent;
		options: YavuSecurityFunction all;
		beSorted; 
		yourself
]
