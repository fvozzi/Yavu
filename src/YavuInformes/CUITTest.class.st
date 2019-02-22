Class {
	#name : #CUITTest,
	#superclass : #TestCase,
	#category : #'YavuInformes-Test'
}

{ #category : #'as yet unclassified' }
CUITTest >> testCalculoCUITSegunDNI [
	"Testea el calculo del número de CUIT/CUIL según el dni y el sexo."
	
	self assert: '23276349759' = (CUIT dni: '27634975' tipo: (CustomerType atCodigo: 'M')) cuit
]
