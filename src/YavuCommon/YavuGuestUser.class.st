Class {
	#name : #YavuGuestUser,
	#superclass : #YavuUser,
	#classVars : [
		'Current'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #accessing }
YavuGuestUser class >> current [

	Current ifNil: [ Current := self newGuest].
	^Current
]

{ #category : #accessing }
YavuGuestUser class >> newGuest [

	^ self new
		name: 'Guest';
		yourself
]
