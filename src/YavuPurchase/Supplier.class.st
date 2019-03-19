Class {
	#name : #Supplier,
	#superclass : #Entity,
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

{ #category : #'as yet unclassified' }
Supplier >> addToSystem [
	
	self yavuSystem purchaseSubsystem addSupplier: self
]

{ #category : #accessing }
Supplier >> address [
	^ address
]

{ #category : #accessing }
Supplier >> address: anObject [
	address := anObject
]

{ #category : #accessing }
Supplier >> businessName [
	^ businessName
]

{ #category : #accessing }
Supplier >> businessName: anObject [
	businessName := anObject
]

{ #category : #accessing }
Supplier >> cuitNumber [
	^ cuitNumber
]

{ #category : #accessing }
Supplier >> cuitNumber: anObject [
	cuitNumber := anObject
]

{ #category : #'as yet unclassified' }
Supplier >> descriptionAddress [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #address;
      label: 'Dirección';
      	priority: 150;
      	yourself

]

{ #category : #'as yet unclassified' }
Supplier >> descriptionBusinessName [
	"Devuelve un objeto que describe la representación de la variable correo electrónico del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #businessName;
        	label: 'Razón Social';
        	priority: 110;
        	yourself
]

{ #category : #'as yet unclassified' }
Supplier >> descriptionCUITNumber [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #cuitNumber;
      label: 'CUIT';
      	priority: 140;
      	yourself

]

{ #category : #'as yet unclassified' }
Supplier >> descriptionIsRetentionAgent [
	
	<magritteDescription>
	^MABooleanDescription new
		accessor: #isRetentionAgent;
		label: 'Es Agente de Retención?';
		priority: 130;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
Supplier >> descriptionOpeningHours [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #openingHours;
      label: 'Horario';
      	priority: 170;
      	yourself

]

{ #category : #'as yet unclassified' }
Supplier >> descriptionPhoneNumber [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #phoneNumber;
      label: 'Teléfono';
      	priority: 160;
      	yourself

]

{ #category : #'as yet unclassified' }
Supplier >> descriptionVatCondition [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #vatCondition;
		label: 'Condición IVA';
		priority: 120;
		options: VatCondition allSubclasses;
		beSorted;
		beRequired;
		yourself
]

{ #category : #accessing }
Supplier >> isRetentionAgent [
	^ isRetentionAgent
]

{ #category : #accessing }
Supplier >> isRetentionAgent: anObject [
	isRetentionAgent := anObject
]

{ #category : #accessing }
Supplier >> openingHours [
	^ openingHours
]

{ #category : #accessing }
Supplier >> openingHours: anObject [
	openingHours := anObject
]

{ #category : #accessing }
Supplier >> phoneNumber [
	^ phoneNumber
]

{ #category : #accessing }
Supplier >> phoneNumber: anObject [
	phoneNumber := anObject
]

{ #category : #accessing }
Supplier >> vatCondition [
	^ vatCondition
]

{ #category : #accessing }
Supplier >> vatCondition: anObject [
	vatCondition := anObject
]
