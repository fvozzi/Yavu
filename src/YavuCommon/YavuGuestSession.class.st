Class {
	#name : #YavuGuestSession,
	#superclass : #YavuSession,
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'as yet unclassified' }
YavuGuestSession >> initialize [ 

	super initialize.
	yavuSystem := YavuEnvironment current newSystem.
	yavuSystem setGuestUser
]
