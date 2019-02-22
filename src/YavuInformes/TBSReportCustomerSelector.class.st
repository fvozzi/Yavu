Class {
	#name : #TBSReportCustomerSelector,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'reportType',
		'steps',
		'dniCustomer',
		'nameCustomer',
		'notification'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #'as yet unclassified' }
TBSReportCustomerSelector >> customer [

	| searchedCustomer formatedNumber |
	formatedNumber := self dniCustomer copyWithoutAll: ','; copyWithoutAll: '.'.
	
	searchedCustomer := self searchCustomerByNumber: formatedNumber.
	searchedCustomer isNil
		ifTrue: [ searchedCustomer := self newCustomerIfExistsDataForNumber: formatedNumber ].
	^searchedCustomer
]

{ #category : #accessing }
TBSReportCustomerSelector >> dniCustomer [
	
	^ dniCustomer
]

{ #category : #accessing }
TBSReportCustomerSelector >> dniCustomer: anObject [
	
	dniCustomer := anObject
]

{ #category : #'as yet unclassified' }
TBSReportCustomerSelector >> initialize [

	super initialize.
	notification := 'alert-info' -> 'Ingrese documento o nombre para realizar la busqueda.'
]

{ #category : #accessing }
TBSReportCustomerSelector >> isCompleted [
	
	[self dniCustomer asNumber] on: Error do: [ :ex | self notificateInvalidNumber. ^false ].
	^self dniCustomer notEmpty
]

{ #category : #accessing }
TBSReportCustomerSelector >> nameCustomer [
	
	^ nameCustomer
]

{ #category : #accessing }
TBSReportCustomerSelector >> nameCustomer: anObject [
	
	nameCustomer := anObject
]

{ #category : #accessing }
TBSReportCustomerSelector >> notificateInvalidNumber [

	notification := 'alert-warning' -> 'El numero ingresado no es valido.'
]

{ #category : #'as yet unclassified' }
TBSReportCustomerSelector >> notificationClass [

	^notification key
]

{ #category : #'as yet unclassified' }
TBSReportCustomerSelector >> notificationText [

	^notification value
]

{ #category : #'as yet unclassified' }
TBSReportCustomerSelector >> renderContentOn: html [ 
	
	html form: [  
	html tbsContainer: [ 
		html tbsFormGroup: [ 
			html label for: 'dniCustomer'; with: 'Nro. de documento'.
			html textInput tbsFormControl; id: 'dniCustomer'; placeholder: 'DNI, CUIL o CUIT'; on: #dniCustomer of: self].
		html tbsFormGroup: [ 
			html label for: 'nameCustomer'; with: 'Nombre'.
			html textInput tbsFormControl; id: 'nameCustomer'; placeholder: 'Apellido y Nombre'; on: #nameCustomer of: self].
		html tbsAlert 
		class: self notificationClass;
		with: [ html strong:  self notificationText ].
		]
	]
]

{ #category : #accessing }
TBSReportCustomerSelector >> searchCustomerByNumber: documentNumber [ 

	documentNumber size = 11 
		ifTrue: [ ^self searchOrganizationByNumber: documentNumber ].
	(documentNumber size between: 6 and: 9)
		ifTrue: [ ^self searchNaturalPersonbyNumber: documentNumber ] .
	^nil
]

{ #category : #accessing }
TBSReportCustomerSelector >> searchNaturalPersonbyNumber: numeroDocumento [
	| clienteBuscado |
	
	clienteBuscado := nil.
	CustomerType allNaturalPersonsTypes
		do: [ :each | 
			clienteBuscado isNil
				ifTrue: [ 
					clienteBuscado := self session yavuSystem searchCustomerByNumber: numeroDocumento customerType: each.
					"Si no tiene tipo, tratamos de buscar el numero de cuit."
					(clienteBuscado notNil and: [clienteBuscado customerTypeClass isNotDeclared]) ifTrue: [ 
						self updateCuitTo: clienteBuscado.
						 ] ]
				].
	^clienteBuscado
]
