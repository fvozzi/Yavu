Class {
	#name : #TBSEntitiesBrowserView,
	#superclass : #TBSYavuObjectBrowserView,
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSEntitiesBrowserView >> browserCaption [

	^ super browserCaption, ' | Entidades'
]

{ #category : #accessing }
TBSEntitiesBrowserView >> instances [ 

	^ objectClass all asSortedCollection 
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
		selected: self objectClass ;
		callback: [ :oneEntityClass | self objectClass: oneEntityClass ];
		labels: [ :each | each label];
		onChange: 'submit()'
]
