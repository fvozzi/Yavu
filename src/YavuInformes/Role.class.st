Class {
	#name : #Role,
	#superclass : #Entity,
	#instVars : [
		'menuElements',
		'securityFunctions'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
Role class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Rol'
]

{ #category : #'sin categoria' }
Role >> addMenuElement: aMenuElementName view: aWAComponent [

	self menuElements add: (MenuElement label: aMenuElementName view: aWAComponent)

]

{ #category : #'sin categoria' }
Role >> allowedEntitiesClasses [

	^self securityFunctions collect: [:each | each yavuObjectClass]  
]

{ #category : #'sin categoria' }
Role >> descriptionMenuElements [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #menuElements;
		label: 'Acceso';
		priority: 130;
		componentClass: MAListCompositonComponent;
		options: MenuElement selectableMenuElements;
		beSorted; 
		yourself
]

{ #category : #'as yet unclassified' }
Role >> initialize [ 

	super initialize.
	menuElements := OrderedCollection new.
	securityFunctions := OrderedCollection new
]

{ #category : #'sin categoria' }
Role >> menuElements [

	^menuElements
]

{ #category : #'sin categoria' }
Role >> menuElements: anObject [
	menuElements := anObject
]

{ #category : #'sin categoria' }
Role >> securityFunctions [
	^ securityFunctions
]

{ #category : #'sin categoria' }
Role >> securityFunctions: anObject [
	securityFunctions := anObject
]

{ #category : #'sin categoria' }
Role >> securityFunctionsDescription [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #securityFunctions;
		label: 'Entidades permitidas';
		priority: 140;
		componentClass: MAListCompositonComponent;
		options: SecurityFunction all;
		beSorted; 
		yourself
]
