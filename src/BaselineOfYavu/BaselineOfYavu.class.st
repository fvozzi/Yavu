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
			self magritte3: spec.
			self bootstrap: spec.
			self fontAwesome: spec.
			self xmlParser: spec.
			self neoCSV: spec.
			"Packages"
			spec package: 'YavuCommon'.
			spec package: 'YavuNutriData' with: [spec requires: #('YavuCommon' 'XMLParser')].
			spec package: 'YavuBeerStack' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuPurchase' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuRestaurant' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuSale' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuAccounting' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuInformes' with: [spec requires: #('YavuCommon' 'Seaside3' 'Magritte' 'Bootstrap4' 'FontAwesome')]
			]
		
]

{ #category : #dependencies }
BaselineOfYavu >> bootstrap: spec [

	spec
		baseline:'Bootstrap4'
 		with: [ spec repository: 'github://astares/Seaside-Bootstrap4:master/src']
]

{ #category : #dependencies }
BaselineOfYavu >> fontAwesome: spec [

	spec
		baseline:'FontAwesome'
 		with: [ spec repository: 'github://astares/Seaside-FontAwesome:master/src']
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
BaselineOfYavu >> neoCSV: spec [

	spec 
		project: 'NeoCSV' with: [
				spec
					className: 'ConfigurationOfNeoCSV';
					versionString: #'stable';
					loads: #( 'default' );
					repository: 'http://mc.stfx.eu/Neo']
]

{ #category : #accessing }
BaselineOfYavu >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfYavu >> seaside3: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.x/repository']
		
	
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
					repository: 'github://pharo-nosql/voyage:1.7/mc';
					loads: 'mongo tests' ]
]

{ #category : #dependencies }
BaselineOfYavu >> xmlParser: spec [

	spec baseline: 'XMLParser' with: [ spec repository: 'github://svenvc/XML-Support-Pharo' ]
]
