Class {
	#name : #Timer,
	#superclass : #YvObject,
	#instVars : [
		'interval',
		'enabled'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
Timer class >> interval: anInterval [

	^self new initializeInterval: anInterval
]

{ #category : #'sin categoria' }
Timer >> initializeInterval: anInterval [

	interval  := anInterval.
	self start
]

{ #category : #'sin categoria' }
Timer >> start [

	enabled := true.
	[[enabled] whileTrue: [
		(Delay forMilliseconds: interval) wait.
		self triggerEvent: #onTimerTick  
		]] fork
]

{ #category : #'sin categoria' }
Timer >> stop [

	enabled := false
]
