Class {
	#name : #YavuSalarySubsystem,
	#superclass : #YavuSubsystem,
	#category : #'YavuSalary-Environment'
}

{ #category : #'as yet unclassified' }
YavuSalarySubsystem class >> fontAwesomeClass [

	^ 'fa-inbox'
]

{ #category : #accessing }
YavuSalarySubsystem class >> label [ 

	^ 'Subsistema Sueldos'
]

{ #category : #configuration }
YavuSalarySubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		add: ((YavuSimpleMenuElement label: 'Sueldos' presenterClass: TBSTransactionsBrowserView subsystem: self) id: 2);
		yourself
]

{ #category : #configuration }
YavuSalarySubsystem class >> subsystemName [

	^ 'Sueldos'
]

{ #category : #configuration }
YavuSalarySubsystem class >> subsystemTag [

	 ^'salarySubsystem'
]

{ #category : #'as yet unclassified' }
YavuSalarySubsystem >> cashPaymentType [
	
	^ self system purchaseSubsystem cashPaymentType 
]

{ #category : #'as yet unclassified' }
YavuSalarySubsystem >> jobRoles [

	^ self system storedSubsystem instancesOf: YavuJobRole
]

{ #category : #'as yet unclassified' }
YavuSalarySubsystem >> paymentTypes [
	
	^ self system purchaseSubsystem paymentTypes 
]
