Class {
	#name : #YavuCustomer,
	#superclass : #YavuEntity,
	#instVars : [
		'vatCondition',
		'cuitNumber',
		'address',
		'phoneNumber',
		'email'
	],
	#category : #'YavuSale-Entities'
}

{ #category : #testing }
YavuCustomer class >> isVoyageRoot [ 

	^ true
]

{ #category : #'sin categoria' }
YavuCustomer class >> label [ 

	 ^ 'Cliente'
]

{ #category : #accessing }
YavuCustomer class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #accessing }
YavuCustomer >> address [
	^ address
]

{ #category : #accessing }
YavuCustomer >> address: anObject [
	address := anObject
]

{ #category : #descriptions }
YavuCustomer >> afipCodigoDocumentoComprador [
	
	^ self vatCondition afipCodigoDocumentoComprador
]

{ #category : #accessing }
YavuCustomer >> cuitNumber [
	^ cuitNumber
]

{ #category : #accessing }
YavuCustomer >> cuitNumber: anObject [
	cuitNumber := anObject
]

{ #category : #descriptions }
YavuCustomer >> descriptionAddress [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #address;
      label: 'Dirección';
      	priority: 150;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #'magritte descriptions' }
YavuCustomer >> descriptionCUITNumber [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #cuitNumber;
      label: 'CUIT';
      	priority: 140;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #'magritte descriptions' }
YavuCustomer >> descriptionContainer [

	^super descriptionContainer
		addCondition: [ :obj | (obj readUsing: self descriptionVatCondition) cuitNumberIsRequired ifTrue: [ (obj readUsing: self descriptionCUITNumber) notNil ] ifFalse: [true]]
		labelled: 'La condición de IVA del cliente requiere ingresar el CUIT';
      	yourself
]

{ #category : #descriptions }
YavuCustomer >> descriptionEMail [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #email;
      label: 'Correo electronico';
      	priority: 150;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuCustomer >> descriptionPhoneNumber [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #phoneNumber;
      label: 'Teléfono';
      	priority: 160;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuCustomer >> descriptionVatCondition [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #vatCondition;
		label: 'Condición IVA';
		priority: 120;
		optionsAndLabels: (YavuVatCondition allSubclasses collect: [:each | each -> each label]);
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #accessing }
YavuCustomer >> email [
	^ email
]

{ #category : #accessing }
YavuCustomer >> email: anObject [
	email := anObject
]

{ #category : #accessing }
YavuCustomer >> invoiceType [
	
	^ self vatCondition invoiceType
]

{ #category : #'as yet unclassified' }
YavuCustomer >> legalName [
	
	^ self name
]

{ #category : #accessing }
YavuCustomer >> phoneNumber [
	^ phoneNumber
]

{ #category : #accessing }
YavuCustomer >> phoneNumber: anObject [
	phoneNumber := anObject
]

{ #category : #accessing }
YavuCustomer >> vatCondition [
	^ vatCondition
]

{ #category : #accessing }
YavuCustomer >> vatCondition: anObject [
	vatCondition := anObject
]
