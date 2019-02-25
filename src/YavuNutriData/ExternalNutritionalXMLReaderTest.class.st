Class {
	#name : #ExternalNutritionalXMLReaderTest,
	#superclass : #TestCase,
	#category : #'YavuNutriData-Test'
}

{ #category : #'as yet unclassified' }
ExternalNutritionalXMLReaderTest >> exampleNutriInfoXMLFile [

	^'<?xml version="1.0" encoding="UTF-8"?><dataroot>
<AlimentoyComposicion>
<Codigo>2296</Codigo><Alimento>Galletitas Cindor</Alimento>
<Porcion>33g <em>(3 galletitas)</em></Porcion><E>159 kcal</E><HCdisp>21 g</HCdisp>
<Prot>2,5 g</Prot><Lip>7,3 g</Lip><AGSat>2,5 g</AGSat><AGMI>4 g</AGMI>
<AGPI>0,6 g</AGPI><GrasasTrans>0 g</GrasasTrans><Colesterol>0 mg</Colesterol>
<Fibra>0,8 g</Fibra><Na>102 mg</Na><Actualizado>19 de Octubre de 2014</Actualizado>
</AlimentoyComposicion>
</dataroot>'
]

{ #category : #'as yet unclassified' }
ExternalNutritionalXMLReaderTest >> exampleSARAFile [
	
	 ^'<?xml version="1.0" encoding="UTF-8"?>
<dataroot xmlns:od="urn:schemas-microsoft-com:officedata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xsi:noNamespaceSchemaLocation="AlimentoyComposicion.xsd" generated="2014-10-04T15:00:05">
<AlimentoyComposicion>
<Codigo>A001</Codigo>
<Alimento>Almidón de maíz</Alimento>
<UnidadMedida>gramos</UnidadMedida>
<Decimales>sin</Decimales>
<FactorCorreccion>1</FactorCorreccion>
<Id>325</Id>
<Agua>8.32</Agua>
<E>362.97</E>
<Prot>0.26</Prot>
<Lip>0.05</Lip>
<HCtotal>91.27</HCtotal>
<HCdisp>90.37</HCdisp>
<Fibra>0.9</Fibra>
<Cen>0.09</Cen>
<Na>9</Na>
<K>3</K>
<Ca>2</Ca>
<P>13</P>
<Fe>0.47</Fe>
<Zn>0.06</Zn>
<B1>0</B1>
<B2>0</B2>
<Niac>0</Niac>
<Folatos>0</Folatos>
<VitA>0</VitA>
<VitB12>0</VitB12>
<VitC>0</VitC>
<AGSat>0.009</AGSat>
<AGMI>0.016</AGMI>
<AGPI>0.025</AGPI>
<Colesterol>0</Colesterol>
<VitD>0</VitD>
<B1_fort>0</B1_fort>
<B2_fort>0</B2_fort>
<Fe_fort>0.47</Fe_fort>
<Niac_for>0</Niac_for>
<Fola_for>0</Fola_for>
</AlimentoyComposicion>
<AlimentoyComposicion>
<Codigo>A002</Codigo>
<Alimento>Amaranto</Alimento>
<UnidadMedida>gramos</UnidadMedida>
<Decimales>sin</Decimales>
<FactorCorreccion>1</FactorCorreccion>
<Id>326</Id>
<Agua>9.84</Agua>
<E>320.27</E>
<Prot>14.45</Prot>
<Lip>6.51</Lip>
<HCtotal>66.17</HCtotal>
<HCdisp>50.97</HCdisp>
<Fibra>15.2</Fibra>
<Cen>3.03</Cen>
<Na>21</Na>
<K>366</K>
<Ca>153</Ca>
<P>455</P>
<Fe>7.59</Fe>
<Zn>3.18</Zn>
<B1>0.08</B1>
<B2>0.208</B2>
<Niac>1.29</Niac>
<Folatos>49</Folatos>
<VitA>0</VitA>
<VitB12>0</VitB12>
<VitC>0</VitC>
<AGSat>1.662</AGSat>
<AGMI>1.433</AGMI>
<AGPI>2.891</AGPI>
<Colesterol>0</Colesterol>
<VitD>0</VitD>
<B1_fort>0.08</B1_fort>
<B2_fort>0.208</B2_fort>
<Fe_fort>7.59</Fe_fort>
<Niac_for>1.29</Niac_for>
<Fola_for>49</Fola_for>
</AlimentoyComposicion>
</dataroot>'
]

{ #category : #accessing }
ExternalNutritionalXMLReaderTest >> testSARAXMLFileReader [
	| reader foodComposition |
	reader := ExternalNutritionalXMLReader on: self exampleSARAFile.
	foodComposition := reader foodAtCode: 'A001'.
	self assert: foodComposition code equals: 'A001'.
	self assert: foodComposition name equals: 'Almidón de maíz'.
	self assert: foodComposition unit equals: 'gramos'.
	self assert: foodComposition correctionFactor equals: '1'.
	self assert: foodComposition water equals: '8.32'.
	self assert: foodComposition energy equals: '362.97'.
	self assert: foodComposition protein equals: '0.26'.
	self assert: foodComposition lipidos equals: '0.05'.
	self assert: foodComposition acidosGrasosSaturados equals: '0.009'.
	self
		assert: foodComposition acidosGrasosMonoinsaturados
		equals: '0.016'.
	self
		assert: foodComposition acidosGrasosPoliinsaturados
		equals: '0.025'.
	self assert: foodComposition colesterol equals: '0'.
	self assert: foodComposition hidratosDeCarbono equals: '90.37'.
	self assert: foodComposition fibra equals: '0.9'.
	self assert: foodComposition cenizas equals: '0.09'.
	self assert: foodComposition sodio equals: '9'.
	self assert: foodComposition potasio equals: '3'.
	self assert: foodComposition calcio equals: '2'.
	self assert: foodComposition fosforo equals: '13'.
	self assert: foodComposition hierro equals: '0.47'.
	self assert: foodComposition zinc equals: '0.06'.
	self assert: foodComposition niacina equals: '0'.
	self assert: foodComposition folatos equals: '0'.
	self assert: foodComposition vitaminaA equals: '0'.
	self assert: foodComposition tiaminaB1 equals: '0'.
	self assert: foodComposition riboflavinaB2 equals: '0'.
	self assert: foodComposition vitaminaB12 equals: '0'.
	self assert: foodComposition vitaminaC equals: '0'.
	self assert: foodComposition vitaminaD equals: '0'.
	self assert: (reader foodAtCode: 'A001x1') code isNil.
	self assert: (reader foodAtCode: 'A002') code equals: 'A002'
]

{ #category : #'as yet unclassified' }
ExternalNutritionalXMLReaderTest >> testXMLFileReader [
	
	| foodComposition reader |

	reader := (ExternalNutritionalXMLReader on: self exampleNutriInfoXMLFile).
	foodComposition := reader foodAtCode: '2296'.
	self assert: foodComposition code = '2296'.
	self assert: foodComposition name = 'Galletitas Cindor'.
	self assert: foodComposition unit = ''.
	self assert: foodComposition correctionFactor = ''.
	self assert: foodComposition water = ''.
	self assert: foodComposition energy = '159 kcal'.
	self assert: foodComposition protein = '2,5 g'.
	self assert: foodComposition lipidos = '7,3 g'.
	self assert: foodComposition acidosGrasosSaturados  = '2,5 g'.
	self assert: foodComposition acidosGrasosMonoinsaturados = '4 g'.
	self assert: foodComposition acidosGrasosPoliinsaturados = '0,6 g'.						
	self assert: foodComposition colesterol = '0 mg'.								
	self assert: foodComposition hidratosDeCarbono = '21 g'.	
	self assert: foodComposition fibra = '0,8 g'.														
	self assert: foodComposition sodio = '102 mg'.																																																																																																								
	self assert: foodComposition fechaActualizado = '19 de Octubre de 2014'
]
