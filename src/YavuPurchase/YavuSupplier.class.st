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
		'openingHours',
		'accountingAccount',
		'isServiceProvider'
	],
	#category : #'YavuPurchase-Model'
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
YavuSupplier class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #accessing }
YavuSupplier >> accountingAccount [
	^ accountingAccount
]

{ #category : #accessing }
YavuSupplier >> accountingAccount: anObject [
	accountingAccount := anObject
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
		componentClass: TBSMagritteTextInputComponent;
      	yourself

]

{ #category : #descriptions }
YavuSupplier >> descriptionContainer [

	^super descriptionContainer
		addCondition: [ :obj | (obj readUsing: self descriptionVatCondition) cuitNumberIsRequired ifTrue: [ (obj readUsing: self descriptionCUITNumber) notNil ] ifFalse: [true]]
		labelled: 'La condición de IVA del cliente requiere ingresar el CUIT';
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
YavuSupplier >> descriptionIsServiceProvider [
	
	<magritteDescription>
	^MABooleanDescription new
		accessor: #isServiceProvider;
		label: 'Es proveedor de servicios?';
		priority: 180;
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
YavuSupplier >> descriptionSubcategory [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #accountingAccount;
		label: 'Cuenta Contable';
		priority: 190;
		options: self subsystem accountingAccounts;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuSupplier >> descriptionVatCondition [
	
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
YavuSupplier >> isServiceProvider [
	
	isServiceProvider ifNil: [ isServiceProvider := false ].
	^ isServiceProvider 
]

{ #category : #accessing }
YavuSupplier >> isServiceProvider: anObject [
	isServiceProvider := anObject
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

{ #category : #accessing }
YavuSupplier >> vatCondition [
	^ vatCondition
]

{ #category : #accessing }
YavuSupplier >> vatCondition: anObject [
	vatCondition := anObject
]
