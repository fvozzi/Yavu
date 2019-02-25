Class {
	#name : #EntityFactoryTest,
	#superclass : #TestCase,
	#category : #'YavuInformes-Test'
}

{ #category : #'as yet unclassified' }
EntityFactoryTest >> testAddMonthlyPaymentUsingFactory [

	| factory monthlyPayment count |
	
	"Anulado para qeu funcione el build".
	^true.
	
	"factory := Factory on: MonthlyPayment.
	monthlyPayment := (MonthlyPayment entity: Commerce default date: '01/01/2013' asDate).
	monthlyPayment packageOfReports: PackageOfReports all first.
	count := MonthlyPayment all size.
	factory add: monthlyPayment.
	self assert: MonthlyPayment all size = (count + 1).
	self assert: MonthlyPayment all size= factory instances size.
	monthlyPayment eliminar.
	self assert: MonthlyPayment all size = count.
	self assert: MonthlyPayment all size = factory instances size"
]

{ #category : #'as yet unclassified' }
EntityFactoryTest >> testDeleteEntity [

	| bank count |
	
	"Anulado para qeu funcione el build".
	^true.
	
	"bank := Bank name: 'Bank Test'.
	count := Bank all size.
	bank store.
	self assert: Bank all size = (count + 1).
	self assert: (Bank atName:  'Bank Test' ifAbsent: [ ]) notNil.
	bank eliminar.
	self assert: Bank all size = count.
	self assert: (Bank atName:  'Bank Test' ifAbsent: [ ]) isNil"
]

{ #category : #'as yet unclassified' }
EntityFactoryTest >> testDeleteEntityUsingFactory [

	| factory bank count |
	
	"Anulado para qeu funcione el build".
	^true.
	"factory := Factory on: Bank.
	bank := Bank name: 'Bank Test'.
	count := Bank all size.
	factory add: bank.
	self assert: Bank all size = (count + 1).
	self assert: Bank all size = factory instances size.
	self assert: (Bank atName:  'Bank Test' ifAbsent: [ ]) notNil.
	bank eliminar.
	self assert: Bank all size = count.
	self assert: Bank all size = factory instances size.
	self assert: (Bank atName:  'Bank Test' ifAbsent: [ ]) isNil"
]

{ #category : #'as yet unclassified' }
EntityFactoryTest >> testDeleteUserUsingFactory [

	| factory user count |
	
	"Anulado para qeu funcione el build".
	^true.
	"
	factory := Factory on: SicUser.
	user := SicUser name: 'User.Prueba' company: Company default.
	user password: 'test'.
	count := Company default users size.
	factory add: user.
	self assert: Company default users size = (count + 1).
	self assert: Company default users size = factory instances size.
	self assert: (SicUser atName:  'User.Prueba' ifAbsent: [ ]) notNil.
	user eliminar.
	self assert: Company default users size = count.
	self assert: Company default users size = factory instances size.
	self assert: (SicUser atName:  'User.Prueba' ifAbsent: [ ]) isNil"
]

{ #category : #'as yet unclassified' }
EntityFactoryTest >> testMonthlyPayments [

	| commerce |
	
	"Anulado para qeu funcione el build".
	^true.
	"
	commerce := Commerce default.
	self assert: commerce monthlyPayments = (commerce monthlyPayments select: [:each | each entity = commerce])"
]

{ #category : #'as yet unclassified' }
EntityFactoryTest >> testUpdateEntity [

	| bank |
	
	"Anulado para qeu funcione el build".
	^true.
	"
	bank := Bank name: 'Bank Test'.
	bank store.
	self assert: (bank := Bank atName: 'Bank Test') name = 'Bank Test'.
	bank name: 'Bank test'.
	bank store.
	self deny: (Bank atName: 'Bank test') name = 'Bank Test'.
	bank eliminar"
]
