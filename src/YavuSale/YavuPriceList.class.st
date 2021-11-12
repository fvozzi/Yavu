Class {
	#name : #YavuPriceList,
	#superclass : #YavuEntity,
	#instVars : [
		'description'
	],
	#category : #'YavuSale-Entities'
}

{ #category : #testing }
YavuPriceList class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuPriceList class >> label [ 

	^ 'Lista de Precios'
]

{ #category : #accessing }
YavuPriceList class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #accessing }
YavuPriceList >> description [
	^ description
]

{ #category : #accessing }
YavuPriceList >> description: anObject [
	description := anObject
]

{ #category : #descriptions }
YavuPriceList >> descriptionDescription [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #description;
      label: 'Descripción';
      	priority: 140;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]
