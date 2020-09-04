Class {
	#name : #WAYavuPing,
	#superclass : #WAComponent,
	#category : #'YavuCommon-View'
}

{ #category : #testing }
WAYavuPing class >> canBeRoot [
	^ true
]

{ #category : #rendering }
WAYavuPing >> renderContentOn: html [

	html text: 'pong'
]
