Class {
	#name : #YavuSalaryAdvancePayment,
	#superclass : #YavuTransaction,
	#instVars : [
		'paymentAmount',
		'paymentType'
	],
	#category : #'YavuSalary-DomainObjects'
}

{ #category : #'sin categoria' }
YavuSalaryAdvancePayment class >> entityClass [
	
	^ YavuStaff
]

{ #category : #testing }
YavuSalaryAdvancePayment class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuSalaryAdvancePayment class >> label [ 

	^ 'Adelanto de Sueldo'
]

{ #category : #accessing }
YavuSalaryAdvancePayment class >> subsystemClass [
	^ Smalltalk at: #YavuSalarySubsystem
]

{ #category : #descriptions }
YavuSalaryAdvancePayment >> descriptionPaymentAmount [

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
YavuSalaryAdvancePayment >> descriptionPaymentType [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #paymentType;
		default: self subsystem cashPaymentType;
		options: self subsystem paymentTypes;
		label: 'Medio de Pago';
		priority: 150;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #accessing }
YavuSalaryAdvancePayment >> paymentAmount [
	^ paymentAmount
]

{ #category : #accessing }
YavuSalaryAdvancePayment >> paymentAmount: anObject [
	paymentAmount := anObject
]

{ #category : #accessing }
YavuSalaryAdvancePayment >> paymentType [
	^ paymentType
]

{ #category : #accessing }
YavuSalaryAdvancePayment >> paymentType: anObject [
	paymentType := anObject
]
