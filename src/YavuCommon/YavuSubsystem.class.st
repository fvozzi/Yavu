Class {
	#name : #YavuSubsystem,
	#superclass : #Object,
	#instVars : [
		'system'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #configuration }
YavuSubsystem class >> entitiesClasses [

	^ YavuEntity allSubclasses select: [ :each | each subsystemClass = self ]
]

{ #category : #configuration }
YavuSubsystem class >> menuElements [
	
	^ OrderedCollection new
]

{ #category : #'instance creation' }
YavuSubsystem class >> on: aYavuSystem [

	^self new initializeSystem: aYavuSystem 
]

{ #category : #configuration }
YavuSubsystem class >> subsystemName [

	^ 'Subsistema'
]

{ #category : #configuration }
YavuSubsystem class >> subsystemTag [

	 ^ self subclassResponsibility 
]

{ #category : #configuration }
YavuSubsystem class >> transactionsClasses [

	^ YavuTransaction allSubclasses select: [ :each | each subsystemClass = self ]
	

]

{ #category : #removing }
YavuSubsystem >> canRemoveFromSystem: aYavuPaymentType [ 
	
	^ ((self dependentsOf: aYavuPaymentType) 
			detect: [ :each |	each existsReferencesTo: aYavuPaymentType ]
			ifNone: [  ] ) isNil 
]

{ #category : #removing }
YavuSubsystem >> dependencies [
	
	^ Dictionary new
]

{ #category : #removing }
YavuSubsystem >> dependentsOf: aYavuObject [
	
	^ self dependencies at: aYavuObject class ifAbsent: [ OrderedCollection new ]
]

{ #category : #initialization }
YavuSubsystem >> initializeSystem: aSystem [

	system := aSystem 
]

{ #category : #accessing }
YavuSubsystem >> name [ 

	 ^ 'Subsistema'
]

{ #category : #removing }
YavuSubsystem >> removeFromSystem: aYavuObject [ 

	 ^ (self canRemoveFromSystem: aYavuObject)
			ifTrue: [ self system storedSubsystem remove: aYavuObject  ]
			ifFalse: [ Error signal: 'No puedo borrar el objeto porque esta siendo usado por el sistema.' ]
]

{ #category : #'as yet unclassified' }
YavuSubsystem >> system [
	^ system
]

{ #category : #updating }
YavuSubsystem >> update: aYavuObject [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
YavuSubsystem >> yavuSystem [
	self shouldBeImplemented.
]
