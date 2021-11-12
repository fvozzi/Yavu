Class {
	#name : #YavuShop,
	#superclass : #YavuEntity,
	#instVars : [
		'address',
		'email',
		'businessName',
		'priceLists',
		'logoImageName'
	],
	#category : #'YavuAccounting-Entities'
}

{ #category : #testing }
YavuShop class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuShop class >> label [ 

	^ 'Local'
]

{ #category : #accessing }
YavuShop class >> subsystemClass [
	^ Smalltalk at: #YavuAccountingSubsystem
]

{ #category : #accessing }
YavuShop >> address [
	^ address
]

{ #category : #accessing }
YavuShop >> address: anObject [
	address := anObject
]

{ #category : #accessing }
YavuShop >> businessName [
	^ businessName
]

{ #category : #accessing }
YavuShop >> businessName: anObject [
	businessName := anObject
]

{ #category : #descriptions }
YavuShop >> descriptionAddress [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #address;
      label: 'Dirección';
      	priority: 140;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuShop >> descriptionBusinessName [ 
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #businessName;
		label: 'Razón Social';
		priority: 120;
		options: YavuBusinessName all;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuShop >> descriptionEMail [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #email;
      label: 'Correo Electronico';
      	priority: 150;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuShop >> descriptionLogoImageName [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #logoImageName ;
      label: 'Imagen logo';
      	priority: 155;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuShop >> descriptionPriceLists [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #priceLists;
		label: 'Listas de Precio';
		priority: 220;
		componentClass: TBSListCompositionComponent;
		options: (self subsystem priceLists);
		beSorted; 
		yourself
]

{ #category : #accessing }
YavuShop >> email [
	^ email
]

{ #category : #accessing }
YavuShop >> email: anObject [
	email := anObject
]

{ #category : #accessing }
YavuShop >> logoImageName [
	^ logoImageName
]

{ #category : #accessing }
YavuShop >> logoImageName: anObject [
	logoImageName := anObject
]

{ #category : #accessing }
YavuShop >> priceLists [
	^ priceLists
]

{ #category : #accessing }
YavuShop >> priceLists: anObject [
	priceLists := anObject
]
