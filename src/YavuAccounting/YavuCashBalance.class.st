Class {
	#name : #YavuCashBalance,
	#superclass : #YavuTransaction,
	#instVars : [
		'startCashBalance',
		'endCashBalance',
		'expense',
		'cash',
		'creditCard',
		'mercadoPago',
		'pedidosYaCash',
		'pedidosYaOnline',
		'workShift'
	],
	#category : #'YavuAccounting-DomainObjects'
}

{ #category : #'sin categoria' }
YavuCashBalance class >> entityClass [

	^ YavuShop 
]

{ #category : #testing }
YavuCashBalance class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuCashBalance class >> label [ 

	^ 'Balance de Caja'
]

{ #category : #accessing }
YavuCashBalance class >> subsystemClass [
	^ Smalltalk at: #YavuAccountingSubsystem
]

{ #category : #accessing }
YavuCashBalance >> cash [
	^ cash
]

{ #category : #accessing }
YavuCashBalance >> cash: anObject [
	cash := anObject
]

{ #category : #accessing }
YavuCashBalance >> creditCard [
	^ creditCard
]

{ #category : #accessing }
YavuCashBalance >> creditCard: anObject [
	creditCard := anObject
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionCash [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #cash;
        	label: 'Efectivo';
        	priority: 130;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionCreditCard [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #creditCard;
        	label: 'Tarjeta de Crédito';
        	priority: 140;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionEndCashBalance [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #endCashBalance;
        	label: 'Efectivo Caja Final';
        	priority: 120;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionExpense [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #expense;
        	label: 'Gastos';
        	priority: 125;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionMercadoPago [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #mercadoPago;
        	label: 'Mercado Pago';
        	priority: 150;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionPedidosOnline [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #pedidosYaOnline;
        	label: 'Pedidos Ya Online';
        	priority: 170;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionPedidosYaCash [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #pedidosYaCash;
        	label: 'Pedidos Ya Efectivo';
        	priority: 160;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionStartCashBalance [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #startCashBalance;
        	label: 'Efectivo Caja Inicial';
        	priority: 110;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> descriptionTotal [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #total;
        	label: 'Total';
        	priority: 180;
			componentClass: TBSMagritteTextInputComponent;
			beReadonly;
        	yourself
]

{ #category : #descriptions }
YavuCashBalance >> descriptionWorkShit [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #workShift;
		default: self workShift;
		options: self yavuSystem workShifts;
		label: 'Turno';
		priority: 170;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #accessing }
YavuCashBalance >> endCashBalance [
	^ endCashBalance
]

{ #category : #accessing }
YavuCashBalance >> endCashBalance: anObject [
	endCashBalance := anObject
]

{ #category : #accessing }
YavuCashBalance >> expense [
	^ expense
]

{ #category : #accessing }
YavuCashBalance >> expense: anObject [
	expense := anObject
]

{ #category : #'magrittes-descriptions' }
YavuCashBalance >> initialize [ 

	super initialize.
	endCashBalance := cash := creditCard := mercadoPago := pedidosYaCash := pedidosYaOnline := 0.
	workShift := self yavuSystem workShiftOnCurrentTime.
	startCashBalance := self subsystem startCashBalanceDate: self date workShift: workShift.
	expense := self subsystem expenseDate: self date workShift: workShift.
	
]

{ #category : #accessing }
YavuCashBalance >> mercadoPago [
	^ mercadoPago
]

{ #category : #accessing }
YavuCashBalance >> mercadoPago: anObject [
	mercadoPago := anObject
]

{ #category : #accessing }
YavuCashBalance >> pedidosYaCash [
	^ pedidosYaCash
]

{ #category : #accessing }
YavuCashBalance >> pedidosYaCash: anObject [
	pedidosYaCash := anObject
]

{ #category : #accessing }
YavuCashBalance >> pedidosYaOnline [
	^ pedidosYaOnline
]

{ #category : #accessing }
YavuCashBalance >> pedidosYaOnline: anObject [
	pedidosYaOnline := anObject
]

{ #category : #accessing }
YavuCashBalance >> startCashBalance [
	^ startCashBalance
]

{ #category : #accessing }
YavuCashBalance >> startCashBalance: anObject [
	startCashBalance := anObject
]

{ #category : #accessing }
YavuCashBalance >> total [
	^ self endCashBalance 
	- self startCashBalance 
	+ self expense 
	+ self cash 
	+ self creditCard 
	+ self mercadoPago 
	+ self pedidosYaOnline
]

{ #category : #accessing }
YavuCashBalance >> total: anObject [
	
	
]

{ #category : #accessing }
YavuCashBalance >> workShift [
	^ workShift
]

{ #category : #accessing }
YavuCashBalance >> workShift: anObject [
	workShift := anObject
]
