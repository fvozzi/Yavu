"
Modela la composición nutricional de cada alimento.
"
Class {
	#name : #FoodComposition,
	#superclass : #YavuEntity,
	#instVars : [
		'code',
		'unit',
		'correctionFactor',
		'water',
		'energy',
		'protein',
		'lipidos',
		'acidosGrasosSaturados',
		'acidosGrasosMonoinsaturados',
		'acidosGrasosPoliinsaturados',
		'colesterol',
		'hidratosDeCarbono',
		'fibra',
		'cenizas',
		'sodio',
		'potasio',
		'calcio',
		'fosforo',
		'hierro',
		'zinc',
		'niacina',
		'folatos',
		'vitaminaA',
		'tiaminaB1',
		'riboflavinaB2',
		'vitaminaB12',
		'vitaminaC',
		'vitaminaD',
		'grasasTrans',
		'fechaActualizado'
	],
	#category : #'YavuNutriData-Model'
}

{ #category : #'as yet unclassified' }
FoodComposition class >> fromExternalXMLElement: aXMLElement [ 
	"Instancia una instancia del receptor a partir de aXMLElement. "
	
	 ^self new initializeFromExternalXMLElement: aXMLElement
]

{ #category : #accessing }
FoodComposition >> acidosGrasosMonoinsaturados [
	
	^ acidosGrasosMonoinsaturados
]

{ #category : #accessing }
FoodComposition >> acidosGrasosMonoinsaturados: anObject [
	
	acidosGrasosMonoinsaturados := anObject
]

{ #category : #accessing }
FoodComposition >> acidosGrasosPoliinsaturados [
	
	^ acidosGrasosPoliinsaturados
]

{ #category : #accessing }
FoodComposition >> acidosGrasosPoliinsaturados: anObject [
	
	acidosGrasosPoliinsaturados := anObject
]

{ #category : #accessing }
FoodComposition >> acidosGrasosSaturados [
	
	^ acidosGrasosSaturados
]

{ #category : #accessing }
FoodComposition >> acidosGrasosSaturados: anObject [
	
	acidosGrasosSaturados := anObject
]

{ #category : #accessing }
FoodComposition >> calcio [
	
	^ calcio
]

{ #category : #accessing }
FoodComposition >> calcio: anObject [
	
	calcio := anObject
]

{ #category : #accessing }
FoodComposition >> cenizas [
	
	^ cenizas
]

{ #category : #accessing }
FoodComposition >> cenizas: anObject [
	
	cenizas := anObject
]

{ #category : #accessing }
FoodComposition >> code [
	
	^ code
]

{ #category : #accessing }
FoodComposition >> code: anObject [
	
	code := anObject
]

{ #category : #accessing }
FoodComposition >> colesterol [
	
	^ colesterol
]

{ #category : #accessing }
FoodComposition >> colesterol: anObject [
	
	colesterol := anObject
]

{ #category : #accessing }
FoodComposition >> correctionFactor [
	
	^ correctionFactor
]

{ #category : #accessing }
FoodComposition >> correctionFactor: anObject [
	
	correctionFactor := anObject
]

{ #category : #accessing }
FoodComposition >> energy [
	
	^ energy
]

{ #category : #accessing }
FoodComposition >> energy: anObject [
	
	energy := anObject
]

{ #category : #accessing }
FoodComposition >> fechaActualizado [
	
	^ fechaActualizado
]

{ #category : #accessing }
FoodComposition >> fechaActualizado: anObject [
	
	fechaActualizado := anObject
]

{ #category : #accessing }
FoodComposition >> fibra [
	
	^ fibra
]

{ #category : #accessing }
FoodComposition >> fibra: anObject [
	
	fibra := anObject
]

{ #category : #accessing }
FoodComposition >> folatos [
	
	^ folatos
]

{ #category : #accessing }
FoodComposition >> folatos: anObject [
	
	folatos := anObject
]

{ #category : #accessing }
FoodComposition >> fosforo [
	
	^ fosforo
]

{ #category : #accessing }
FoodComposition >> fosforo: anObject [
	
	fosforo := anObject
]

{ #category : #accessing }
FoodComposition >> grasasTrans [
	
	^ grasasTrans
]

{ #category : #accessing }
FoodComposition >> grasasTrans: anObject [
	
	grasasTrans := anObject
]

{ #category : #accessing }
FoodComposition >> hidratosDeCarbono [
	
	^ hidratosDeCarbono
]

{ #category : #accessing }
FoodComposition >> hidratosDeCarbono: anObject [
	
	hidratosDeCarbono := anObject
]

{ #category : #accessing }
FoodComposition >> hierro [
	
	^ hierro
]

{ #category : #accessing }
FoodComposition >> hierro: anObject [
	
	hierro := anObject
]

{ #category : #'as yet unclassified' }
FoodComposition >> initializeFromExternalXMLElement: aXMLElement [ 
	
	^self 
		code: (aXMLElement contentStringAt: 'Codigo');
		name:  (aXMLElement contentStringAt: 'Alimento');
		unit: (aXMLElement contentStringAt: 'UnidadMedida');
		correctionFactor: (aXMLElement contentStringAt: 'FactorCorreccion');
		water:  (aXMLElement contentStringAt: 'Agua');
		energy: (aXMLElement contentStringAt: 'E');
		protein: (aXMLElement contentStringAt: 'Prot');
		lipidos: (aXMLElement contentStringAt: 'Lip');
		acidosGrasosSaturados: (aXMLElement contentStringAt: 'AGSat');
		acidosGrasosMonoinsaturados: (aXMLElement contentStringAt: 'AGMI');
		acidosGrasosPoliinsaturados: (aXMLElement contentStringAt: 'AGPI');
		colesterol: (aXMLElement contentStringAt: 'Colesterol');
		hidratosDeCarbono: (aXMLElement contentStringAt: 'HCdisp');
		fibra: (aXMLElement contentStringAt: 'Fibra');
		cenizas:  (aXMLElement contentStringAt: 'Cen');
		sodio: (aXMLElement contentStringAt: 'Na');
		potasio: (aXMLElement contentStringAt: 'K');
		calcio: (aXMLElement contentStringAt: 'Ca');
		fosforo: (aXMLElement contentStringAt: 'P');
		hierro: (aXMLElement contentStringAt: 'Fe');
		zinc: (aXMLElement contentStringAt: 'Zn');
		niacina: (aXMLElement contentStringAt: 'Niac');
		folatos: (aXMLElement contentStringAt: 'Folatos');
		vitaminaA: (aXMLElement contentStringAt: 'VitA');
		tiaminaB1: (aXMLElement contentStringAt: 'B1');
		riboflavinaB2: (aXMLElement contentStringAt: 'B2');
		vitaminaB12: (aXMLElement contentStringAt: 'VitB12');
		vitaminaC: (aXMLElement contentStringAt: 'VitC');
		vitaminaD:  (aXMLElement contentStringAt: 'VitD');
		grasasTrans: (aXMLElement contentStringAt: 'GrasasTrans');
		fechaActualizado: (aXMLElement contentStringAt: 'Actualizado');		
		yourself
		
		
		
		
		
		
		
		
		
		
		
]

{ #category : #accessing }
FoodComposition >> lipidos [
	
	^ lipidos
]

{ #category : #accessing }
FoodComposition >> lipidos: anObject [
	
	lipidos := anObject
]

{ #category : #accessing }
FoodComposition >> niacina [
	
	^ niacina
]

{ #category : #accessing }
FoodComposition >> niacina: anObject [
	
	niacina := anObject
]

{ #category : #accessing }
FoodComposition >> potasio [
	
	^ potasio
]

{ #category : #accessing }
FoodComposition >> potasio: anObject [
	
	potasio := anObject
]

{ #category : #accessing }
FoodComposition >> protein [
	
	^ protein
]

{ #category : #accessing }
FoodComposition >> protein: anObject [
	
	protein := anObject
]

{ #category : #accessing }
FoodComposition >> riboflavinaB2 [
	
	^ riboflavinaB2
]

{ #category : #accessing }
FoodComposition >> riboflavinaB2: anObject [
	
	riboflavinaB2 := anObject
]

{ #category : #accessing }
FoodComposition >> sodio [
	
	^ sodio
]

{ #category : #accessing }
FoodComposition >> sodio: anObject [
	
	sodio := anObject
]

{ #category : #accessing }
FoodComposition >> tiaminaB1 [
	
	^ tiaminaB1
]

{ #category : #accessing }
FoodComposition >> tiaminaB1: anObject [
	
	tiaminaB1 := anObject
]

{ #category : #accessing }
FoodComposition >> unit [
	
	^ unit
]

{ #category : #accessing }
FoodComposition >> unit: anObject [
	
	unit := anObject
]

{ #category : #accessing }
FoodComposition >> vitaminaA [
	
	^ vitaminaA
]

{ #category : #accessing }
FoodComposition >> vitaminaA: anObject [
	
	vitaminaA := anObject
]

{ #category : #accessing }
FoodComposition >> vitaminaB12 [
	
	^ vitaminaB12
]

{ #category : #accessing }
FoodComposition >> vitaminaB12: anObject [
	
	vitaminaB12 := anObject
]

{ #category : #accessing }
FoodComposition >> vitaminaC [
	
	^ vitaminaC
]

{ #category : #accessing }
FoodComposition >> vitaminaC: anObject [
	
	vitaminaC := anObject
]

{ #category : #accessing }
FoodComposition >> vitaminaD [
	
	^ vitaminaD
]

{ #category : #accessing }
FoodComposition >> vitaminaD: anObject [
	
	vitaminaD := anObject
]

{ #category : #accessing }
FoodComposition >> water [
	
	^ water
]

{ #category : #accessing }
FoodComposition >> water: anObject [
	
	water := anObject
]

{ #category : #accessing }
FoodComposition >> zinc [
	
	^ zinc
]

{ #category : #accessing }
FoodComposition >> zinc: anObject [
	
	zinc := anObject
]
