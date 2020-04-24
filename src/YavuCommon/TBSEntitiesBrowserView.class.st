Class {
	#name : #TBSEntitiesBrowserView,
	#superclass : #TBSYavuObjectBrowserView,
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSEntitiesBrowserView >> browserCaption [

	^ super browserCaption, ' -> Entidades'
]

{ #category : #accessing }
TBSEntitiesBrowserView >> instances [ 

	^ objectClass all
]

{ #category : #accessing }
TBSEntitiesBrowserView >> possibleInstancesClasses [

	^ (self session yavuSystem allowedEntitiesClassesOn: self subsystemClass)
]

{ #category : #rendering }
TBSEntitiesBrowserView >> renderObjectClassSelection: html [

	html text: 'Tipo de entidad:'.
	html select
		list: self possibleInstancesClasses;
		selected: self selectedOrDefaultObjectClass ;
		callback: [ :oneEntityClass | self onObjectSelection: oneEntityClass ];
		labels: [ :each | each label];
		onChange: 'submit()'
]
