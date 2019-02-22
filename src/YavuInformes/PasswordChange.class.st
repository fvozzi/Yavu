Class {
	#name : #PasswordChange,
	#superclass : #Transaction,
	#instVars : [
		'currentPassword',
		'newPassword',
		'confirmedPassword'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
PasswordChange class >> entityClass [
	
	^SicUser
]

{ #category : #'sin categoria' }
PasswordChange class >> on: aSICUser [

	^self entity: aSICUser date: Date today
]

{ #category : #'sin categoria' }
PasswordChange >> apply [

	self currentPassword = self entity password ifFalse: [^self error: 'La contraseña actual no coincide.'].
	self confirmedPassword = self newPassword ifFalse: [^self error: 'La contraseña nueva debe coincidir con la confirmada.'].
	self newPassword size > 5 ifFalse: [^self error: 'La contraseña nueva debe tener más de 5 caracteres.'].
	self newPassword size = self newPassword onlyLetters size ifTrue: [^self error: 'La contraseña nueva debe incluir al menos un número. Ejemplo: "pepe86"'].
	self newPassword isAllDigits ifTrue: [^self error: 'La contraseña nueva debe incluir al menos una letra. Ejemplo: "pepe86"'].
	self entity 
		password: self newPassword;
		store
	
]

{ #category : #'sin categoria' }
PasswordChange >> confirmedPassword [
	^ confirmedPassword
]

{ #category : #'sin categoria' }
PasswordChange >> confirmedPassword: anObject [
	confirmedPassword := anObject
]

{ #category : #'sin categoria' }
PasswordChange >> confirmedPasswordDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteContainer>
	^MAPasswordDescription new 
       	accessor: #confirmedPassword;
        	label: 'Confirmar contraseña';
        	priority: 140;
	  	required: true;
        	yourself
]

{ #category : #'sin categoria' }
PasswordChange >> currentPassword [
	^ currentPassword
]

{ #category : #'sin categoria' }
PasswordChange >> currentPassword: anObject [
	currentPassword := anObject
]

{ #category : #'sin categoria' }
PasswordChange >> currentPasswordDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteContainer>
	^MAPasswordDescription new 
        accessor: #currentPassword;
        label: 'Contraseña actual';
        priority: 120;
	  required: true;
        yourself
]

{ #category : #'sin categoria' }
PasswordChange >> dateDescription [
	
	<magritteContainer>
	^super descriptionDate
		visible: false;
		yourself
]

{ #category : #'sin categoria' }
PasswordChange >> entityDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteContainer>
	^super descriptionEntity 
		visible: false;
		yourself
]

{ #category : #'sin categoria' }
PasswordChange >> newPassword [
	^ newPassword
]

{ #category : #'sin categoria' }
PasswordChange >> newPassword: anObject [
	newPassword := anObject
]

{ #category : #'sin categoria' }
PasswordChange >> newPasswordDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteContainer>
	^MAPasswordDescription new 
        	accessor: #newPassword;
        	label: 'Contraseña nueva';
        	priority: 130;
	  	required: true;
       	yourself
]
