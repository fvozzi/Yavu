Class {
	#name : #YavuServiceContract,
	#superclass : #YavuTransaction,
	#instVars : [
		'customerNumber',
		'description',
		'installments',
		'expirationDay'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'sin categoria' }
YavuServiceContract class >> entityClass [
	
	^ YavuSupplier 
]

{ #category : #testing }
YavuServiceContract class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuServiceContract class >> label [ 

	^ 'Contrato de Servicio'
]

{ #category : #accessing }
YavuServiceContract class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #accessing }
YavuServiceContract >> customerNumber [
	^ customerNumber
]

{ #category : #accessing }
YavuServiceContract >> customerNumber: anObject [
	customerNumber := anObject
]

{ #category : #accessing }
YavuServiceContract >> description [
	^ description
]

{ #category : #accessing }
YavuServiceContract >> description: anObject [
	description := anObject
]

{ #category : #'as yet unclassified' }
YavuServiceContract >> descriptionCustomerNumber [
	"Devuelve un objeto que describe la representación de la variable correo electrónico del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #customerNumber;
        	label: 'Número Cliente/Contrato';
        	priority: 120;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuServiceContract >> descriptionDescription [
	"Devuelve un objeto que describe la representación de la variable correo electrónico del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #description;
        	label: 'Descripción';
        	priority: 110;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuServiceContract >> descriptionEntity [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #entity;
		default: nil;
		options: self subsystem servicesSuppliers;
		label: self class entityLabel;
		priority: 10;
		sorted: true;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #'as yet unclassified' }
YavuServiceContract >> descriptionExpirationDay [
	"Devuelve un objeto que describe la representación de la variable correo electrónico del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #expirationDay;
        	label: 'Día habitual de vencimiento';
        	priority: 150;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuServiceContract >> descriptionInstallments [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #installments;
        	label: 'Cuotas';
        	priority: 130;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #accessing }
YavuServiceContract >> expirationDay [
	^ expirationDay
]

{ #category : #accessing }
YavuServiceContract >> expirationDay: anObject [
	expirationDay := anObject
]

{ #category : #initialization }
YavuServiceContract >> initialize [ 

	super initialize.
	installments := 0.
	expirationDay := 5
]

{ #category : #accessing }
YavuServiceContract >> installments [
	^ installments
]

{ #category : #accessing }
YavuServiceContract >> installments: anObject [
	installments := anObject
]
