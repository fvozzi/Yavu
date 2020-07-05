Class {
	#name : #TBSSystemAboutView,
	#superclass : #WAYavuBootstrap,
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSSystemAboutView class >> on: yavuSystem [  

	 ^ self new
]

{ #category : #rendering }
TBSSystemAboutView >> renderContentOn: html [
	html text: 'Yavu System'.
	html break.
	html text: 'Subsistemas instalados:'.
	html break.
	self session yavuSystem enabledSubsystems do: [ :each |
		 html text: each name; break]
	
]
