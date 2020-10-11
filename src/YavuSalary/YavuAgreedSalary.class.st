Class {
	#name : #YavuAgreedSalary,
	#superclass : #YavuTransaction,
	#instVars : [
		'agreedAmount',
		'workingHours'
	],
	#category : #'YavuSalary-DomainObjects'
}

{ #category : #'sin categoria' }
YavuAgreedSalary class >> entityClass [
	
	^ YavuJobRole 
]

{ #category : #testing }
YavuAgreedSalary class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuAgreedSalary class >> label [ 

	^ 'Acuerdo Salarial'
]

{ #category : #accessing }
YavuAgreedSalary class >> subsystemClass [
	^ Smalltalk at: #YavuSalarySubsystem
]

{ #category : #accessing }
YavuAgreedSalary >> agreedAmount [
	^ agreedAmount
]

{ #category : #accessing }
YavuAgreedSalary >> agreedAmount: anObject [
	agreedAmount := anObject
]

{ #category : #descriptions }
YavuAgreedSalary >> descriptionPaymentAmount [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #agreedAmount;
        	label: 'Monto acordado';
        	priority: 125;
			min: 0.1;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuAgreedSalary >> descriptionWorkingHours [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #workingHours;
        	label: 'Horas laborales';
        	priority: 125;
			min: 1;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #accessing }
YavuAgreedSalary >> workingHours [
	^ workingHours
]

{ #category : #accessing }
YavuAgreedSalary >> workingHours: anObject [
	workingHours := anObject
]
