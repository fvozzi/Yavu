Class {
	#name : #YavuSupplier,
	#superclass : #YavuEntity,
	#instVars : [
		'businessName',
		'vatCondition',
		'isRetentionAgent',
		'cuitNumber',
		'address',
		'phoneNumber',
		'openingHours'
	],
	#category : #'YavuPurchase-Entities'
}

{ #category : #testing }
YavuSupplier class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuSupplier class >> label [ 

	^ 'Proveedor'
]

{ #category : #accessing }
YavuSupplier >> address [
	^ address
]

{ #category : #accessing }
YavuSupplier >> address: anObject [
	address := anObject
]

{ #category : #accessing }
YavuSupplier >> businessName [
	^ businessName
]

{ #category : #accessing }
YavuSupplier >> businessName: anObject [
	businessName := anObject
]

{ #category : #accessing }
YavuSupplier >> cuitNumber [
	^ cuitNumber
]

{ #category : #accessing }
YavuSupplier >> cuitNumber: anObject [
	cuitNumber := anObject
]

{ #category : #descriptions }
YavuSupplier >> descriptionAddress [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #address;
      label: 'Dirección';
      	priority: 150;
		componentClass: TBSMagritteTextInputComponent;
      	yourself

]

{ #category : #descriptions }
YavuSupplier >> descriptionBusinessName [
	"Devuelve un objeto que describe la representación de la variable correo electrónico del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #businessName;
        	label: 'Razón Social';
        	priority: 110;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuSupplier >> descriptionCUITNumber [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #cuitNumber;
      label: 'CUIT';
      	priority: 140;
		beRequired;
		componentClass: TBSMagritteTextInputComponent;
      	yourself

]

{ #category : #descriptions }
YavuSupplier >> descriptionIsRetentionAgent [
	
	<magritteDescription>
	^MABooleanDescription new
		accessor: #isRetentionAgent;
		label: 'Es Agente de Retención?';
		priority: 130;
		componentClass: TBSMagritteCheckboxComponent;
		yourself
]

{ #category : #descriptions }
YavuSupplier >> descriptionOpeningHours [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #openingHours;
      label: 'Horario';
      	priority: 170;
		componentClass: TBSMagritteTextInputComponent;	
      	yourself

]

{ #category : #descriptions }
YavuSupplier >> descriptionPhoneNumber [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #phoneNumber;
      label: 'Teléfono';
      	priority: 160;
		componentClass: TBSMagritteTextInputComponent;
      	yourself

]

{ #category : #descriptions }
YavuSupplier >> descriptionVatCondition [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #vatCondition;
		label: 'Condición IVA';
		priority: 120;
		options: YavuVatCondition allSubclasses;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #'as yet unclassified' }
YavuSupplier >> invoiceType [
	
	^ self vatCondition invoiceType
]

{ #category : #accessing }
YavuSupplier >> isRetentionAgent [
	^ isRetentionAgent
]

{ #category : #accessing }
YavuSupplier >> isRetentionAgent: anObject [
	isRetentionAgent := anObject
]

{ #category : #accessing }
YavuSupplier >> openingHours [
	^ openingHours
]

{ #category : #accessing }
YavuSupplier >> openingHours: anObject [
	openingHours := anObject
]

{ #category : #accessing }
YavuSupplier >> phoneNumber [
	^ phoneNumber
]

{ #category : #accessing }
YavuSupplier >> phoneNumber: anObject [
	phoneNumber := anObject
]

{ #category : #crud }
YavuSupplier >> removeFromSystem [
	
	self yavuSystem purchaseSubsystem removeSupplier: self
]

{ #category : #crud }
YavuSupplier >> updateOnSystem [
	
		self halt.
	self yavuSystem purchaseSubsystem update: self
]

{ #category : #accessing }
YavuSupplier >> vatCondition [
	^ vatCondition
]

{ #category : #accessing }
YavuSupplier >> vatCondition: anObject [
	vatCondition := anObject
]