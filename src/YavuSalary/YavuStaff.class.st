Class {
	#name : #YavuStaff,
	#superclass : #YavuEntity,
	#instVars : [
		'phone',
		'address',
		'locality',
		'postalCode',
		'dni',
		'cuit',
		'birthdate',
		'jobRole',
		'workStartDate',
		'workEndDate'
	],
	#category : #'YavuSalary-Entities'
}

{ #category : #testing }
YavuStaff class >> isVoyageRoot [

	 ^true 
]

{ #category : #testing }
YavuStaff class >> label [

	 ^'Personal' 
]

{ #category : #accessing }
YavuStaff class >> subsystemClass [
	^ Smalltalk at: #YavuSalarySubsystem
]

{ #category : #accessing }
YavuStaff >> address [
	^ address
]

{ #category : #accessing }
YavuStaff >> address: anObject [
	address := anObject
]

{ #category : #accessing }
YavuStaff >> birthdate [
	^ birthdate
]

{ #category : #accessing }
YavuStaff >> birthdate: anObject [
	birthdate := anObject
]

{ #category : #accessing }
YavuStaff >> cuit [
	^ cuit
]

{ #category : #accessing }
YavuStaff >> cuit: anObject [
	cuit := anObject
]

{ #category : #descriptions }
YavuStaff >> descriptionAddress [

	<magritteDescription>
	^MAStringDescription new 
		accessor: #address ;
		label: 'Dirección';
		priority: 150;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionBirthdate [

	<magritteDescription>
	^MADateDescription new 
		accessor: #birthdate ;
		label: 'Fecha Nacimiento';
		priority: 180;
		componentClass: TBSMagritteDateInputComponent;
		yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionCuit [

	<magritteDescription>
	^MAStringDescription new 
		accessor: #cuit ;
		label: 'CUIT';
		priority: 140;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionDni [

	<magritteDescription>
	^MAStringDescription new 
		accessor: #dni ;
		label: 'DNI';
		priority: 130;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionJobRole [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #jobRole;
		label: 'Puesto';
		priority: 120;
		options: self subsystem jobRoles;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionLocality [

	<magritteDescription>
	^MAStringDescription new 
		accessor: #locality ;
		label: 'Localidad';
		priority: 170;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionPhone [

	<magritteDescription>
	^MAStringDescription new 
		accessor: #phone;
		label: 'Teléfono';
		priority: 145;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionPostalCode [

	<magritteDescription>
	^MAStringDescription new 
		accessor: #postalCode ;
		label: 'Código Postal';
		priority: 160;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionWorkEndDate [
	"La fecha de contratación y fecha de desvinculación deberias ser dos transacción o una que sea EstadoRelaciónLaboral o similar para no tener variables en nil."
	
	<magritteDescription>
	^MADateDescription new 
		componentClass: TBSMagritteDateInputComponent;
        	accessor: #workEndDate;
        	label: 'Fecha desvinculación';
        	priority: 190;
        	yourself
]

{ #category : #descriptions }
YavuStaff >> descriptionWorkStartDate [
	"La fecha de contratación y fecha de desvinculación deberias ser dos transacción o una que sea EstadoRelaciónLaboral o similar para no tener variables en nil."

	<magritteDescription>
	^MADateDescription new 
		componentClass: TBSMagritteDateInputComponent;
        	accessor: #workStartDate;
        	label: 'Fecha contratación';
        	priority: 185;
        	yourself
]

{ #category : #accessing }
YavuStaff >> dni [
	^ dni
]

{ #category : #accessing }
YavuStaff >> dni: anObject [
	dni := anObject
]

{ #category : #accessing }
YavuStaff >> jobRole [
	^ jobRole
]

{ #category : #accessing }
YavuStaff >> jobRole: anObject [
	jobRole := anObject
]

{ #category : #accessing }
YavuStaff >> locality [
	^ locality
]

{ #category : #accessing }
YavuStaff >> locality: anObject [
	locality := anObject
]

{ #category : #accessing }
YavuStaff >> phone [
	^ phone
]

{ #category : #accessing }
YavuStaff >> phone: anObject [
	phone := anObject
]

{ #category : #accessing }
YavuStaff >> postalCode [
	^ postalCode
]

{ #category : #accessing }
YavuStaff >> postalCode: anObject [
	postalCode := anObject
]

{ #category : #accessing }
YavuStaff >> workEndDate [
	^ workEndDate
]

{ #category : #accessing }
YavuStaff >> workEndDate: anObject [
	workEndDate := anObject
]

{ #category : #accessing }
YavuStaff >> workStartDate [
	^ workStartDate
]

{ #category : #accessing }
YavuStaff >> workStartDate: anObject [
	workStartDate := anObject
]
