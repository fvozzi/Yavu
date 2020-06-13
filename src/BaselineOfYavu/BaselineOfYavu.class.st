"
Linea base de todos los proyectos que tenemos dando vuelta.

Administración
Birra
"
Class {
	#name : #BaselineOfYavu,
	#superclass : #BaselineOf,
	#category : #BaselineOfYavu
}

{ #category : #baselines }
BaselineOfYavu >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self voyageMongo: spec.
			self seaside3: spec.
			self materialDesignLite: spec.
			self magritte3: spec.
			self glorp: spec.
			self bootstrap: spec.
			self xmlParser: spec.
			self telePharoServer: spec.
			"Packages"
			spec package: 'YavuCommon'.
			spec package: 'YavuNutriData' with: [spec requires: #('YavuCommon' 'XMLParser')].
			spec package: 'YavuBeerStack' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuPurchase' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuRestaurant' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuSale' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuInformes' with: [spec requires: #('YavuCommon' 'Seaside3' 'Magritte' 'Glorp' 'Bootstrap' 'TelePharo')]
			]
		
]

{ #category : #dependencies }
BaselineOfYavu >> bootstrap: spec [

	spec
		baseline:'Bootstrap'
 		with: [ spec repository: 'github://astares/Seaside-Bootstrap:master/src']
]

{ #category : #dependencies }
BaselineOfYavu >> glorp: spec [

	spec
		baseline: 'Glorp'
		with: [ spec repository: 'github://pharo-rdbms/glorp']
]

{ #category : #dependencies }
BaselineOfYavu >> magritte3: spec [

	spec
		baseline: 'Magritte'
		with: [ spec 
			loads: #('Core' 'Magritte-Seaside');
			repository: 'github://magritte-metamodel/magritte:master/repository']
]

{ #category : #dependencies }
BaselineOfYavu >> materialDesignLite: spec [

	spec
    	baseline: 'MaterialDesignLite'
    	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #accessing }
BaselineOfYavu >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfYavu >> seaside3: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:v3.3.4/repository']
		
	
]

{ #category : #dependencies }
BaselineOfYavu >> telePharoServer: spec [

	spec
		baseline: 'TelePharo'
		with: [ spec 
					repository: 'github://pharo-ide/TelePharo';
					loads: 'Server'
			]
		
	
]

{ #category : #dependencies }
BaselineOfYavu >> voyageMongo: spec [

	spec
		baseline:'Voyage'
 		with: [ spec 
					repository: 'github://pharo-nosql/voyage';
					loads: 'mongo tests' ]
]

{ #category : #dependencies }
BaselineOfYavu >> xmlParser: spec [

	spec baseline: 'XMLParser' with: [ spec repository: 'github://svenvc/XML-Support-Pharo' ]
]
