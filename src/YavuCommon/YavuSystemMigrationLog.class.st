Class {
	#name : #YavuSystemMigrationLog,
	#superclass : #YavuObject,
	#instVars : [
		'migrationIdentifier',
		'description',
		'executionDate'
	],
	#category : #'YavuCommon-Migrations'
}

{ #category : #accessing }
YavuSystemMigrationLog >> description [
	^ description
]

{ #category : #accessing }
YavuSystemMigrationLog >> description: anObject [
	description := anObject
]

{ #category : #descriptions }
YavuSystemMigrationLog >> descriptionDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new 
		componentClass: TBSMagritteDateInputComponent;
        	accessor: #executionDate;
        	label: 'Fecha de ejecucion';
        	priority: 20;
			beRequired;
        	yourself
]

{ #category : #descriptions }
YavuSystemMigrationLog >> descriptionDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #description;
		label: 'Descripción';
		priority: 30;
		beRequired;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuSystemMigrationLog >> descriptionMigrationIdentifier [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MANumberDescription new 
		accessor: #migrationIdentifier;
		label: 'Identificador';
		priority: 10;
		beRequired;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #accessing }
YavuSystemMigrationLog >> executionDate [
	^ executionDate
]

{ #category : #accessing }
YavuSystemMigrationLog >> executionDate: anObject [
	executionDate := anObject
]

{ #category : #accessing }
YavuSystemMigrationLog >> migrationIdentifier [
	^ migrationIdentifier
]

{ #category : #accessing }
YavuSystemMigrationLog >> migrationIdentifier: anObject [
	migrationIdentifier := anObject
]
