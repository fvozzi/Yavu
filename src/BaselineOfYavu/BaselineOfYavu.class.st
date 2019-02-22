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
			self seaside3: spec.
			self magritte3: spec.
			self glorp: spec.
			self bootstrap: spec.
			"Packages"
			spec package: 'YavuCommon'.
			spec package: 'YavuNutriData' with: [spec requires: 'YavuCommon'].
			"spec package: 'YavuInformes' with: [spec requires: #('YavuCommon' 'Seaside3' 'Magritte3' 'Glorp' 'Bootstrap)]".
			]
		
]

{ #category : #dependencies }
BaselineOfYavu >> bootstrap: spec [

	spec
		baseline:'Bootstrap';
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
	project: 'Magritte3'
	with: [ spec
		className: #ConfigurationOfMagritte3;
		versionString: #'release3';
		loads: #('Core' 'Magritte-Seaside');
		repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main/' ]
]

{ #category : #accessing }
BaselineOfYavu >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfYavu >> seaside3: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository']
]
