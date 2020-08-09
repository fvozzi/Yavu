Class {
	#name : #YavuSaleCategory,
	#superclass : #YavuEntity,
	#category : #'YavuSale-Entities'
}

{ #category : #testing }
YavuSaleCategory class >> isVoyageRoot [ 

	^ true
]

{ #category : #'sin categoria' }
YavuSaleCategory class >> label [ 

	 ^ 'Categoria Producto de Venta'
]

{ #category : #accessing }
YavuSaleCategory class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]
