Class {
	#name : #TBSEntitiesBrowserView,
	#superclass : #TBSYavuObjectBrowserView,
	#category : #'YavuCommon-View'
}

{ #category : #'instance creation' }
TBSEntitiesBrowserView class >> on: yavuSubsystemClass [

	 ^ self new initializeSubsystemClass: yavuSubsystemClass
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
