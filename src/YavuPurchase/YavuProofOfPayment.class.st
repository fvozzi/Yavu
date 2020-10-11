Class {
	#name : #YavuProofOfPayment,
	#superclass : #YavuTransaction,
	#instVars : [
		'serviceContract',
		'paymentAmount'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'sin categoria' }
YavuProofOfPayment class >> entityClass [
	
	^ YavuSupplier 
]

{ #category : #testing }
YavuProofOfPayment class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuProofOfPayment class >> label [ 

	^ 'Pago a proveedores'
]

{ #category : #accessing }
YavuProofOfPayment class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #descriptions }
YavuProofOfPayment >> descriptionEntity [
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
YavuProofOfPayment >> descriptionPaymentAmount [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #paymentAmount;
        	label: 'Monto pagado';
        	priority: 125;
			min: 0.1;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuProofOfPayment >> descriptionServiceContract [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #serviceContract;
		default: nil;
		options: self subsystem activeServicesContracts;
		label: 'Contrato de Servicio';
		priority: 50;
		sorted: true;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #accessing }
YavuProofOfPayment >> paymentAmount [
	^ paymentAmount
]

{ #category : #accessing }
YavuProofOfPayment >> paymentAmount: anObject [
	paymentAmount := anObject
]

{ #category : #accessing }
YavuProofOfPayment >> serviceContract [
	^ serviceContract
]

{ #category : #accessing }
YavuProofOfPayment >> serviceContract: anObject [
	serviceContract := anObject
]
