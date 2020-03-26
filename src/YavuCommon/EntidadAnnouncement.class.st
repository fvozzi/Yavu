Class {
	#name : #EntidadAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'entidad'
	],
	#category : #'YavuCommon-Announcement'
}

{ #category : #accessing }
EntidadAnnouncement >> entity [
	^ entidad
]

{ #category : #accessing }
EntidadAnnouncement >> entity: anObject [
	entidad := anObject
]
