Class {
	#name : #MailTimer,
	#superclass : #YvObject,
	#instVars : [
		'timer'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
MailTimer >> checkDayFiveOfMonth [
	"Answer true if the current day is the day number five in the current month."
	
		^Date today dayOfMonth = 5
]

{ #category : #'as yet unclassified' }
MailTimer >> initialize [

	super initialize.
	"Setea el timer para que chequee si debe enviar el mail de aviso cada 24 horas. "
	timer:= Timer interval: 1 * 24 * 60 * 60 * 1000.
	timer when: #onTimerTick send: #onTimer to: self



]

{ #category : #'as yet unclassified' }
MailTimer >> log: anUser [

	| logFile linea |
	
	logFile := StandardFileStream fileNamed: 'logs\sentMails.log'.
	linea :=  'E-mail sent to ', anUser name, ' (', TimeStamp now printString, ')'.
	logFile isEmpty ifFalse:  [logFile setToEnd; crlf].
	logFile nextPutAll: linea.
	logFile close

]

{ #category : #'as yet unclassified' }
MailTimer >> onTimer [
	"En cada evento del reloj envia un mail de aviso a todos los usuarios configurados para recibirlo."

	self checkDayFiveOfMonth ifTrue: [
		self usersToBeNotified do: [:user | self sendAdvertisingMailTo: user]
		]
	ifFalse: [ Transcript cr; show: TimeStamp now printString ]
]

{ #category : #'as yet unclassified' }
MailTimer >> sendAdvertisingMailTo: anUser [

	WAMailComposer advertisingMailFor: anUser.
	self log: anUser
]

{ #category : #'as yet unclassified' }
MailTimer >> timer: aTimer [

	timer := aTimer
]

{ #category : #'sin categoria' }
MailTimer >> usersToBeNotified [

	^YavuUser all reject: [:each | each email isNil or: [each email isEmpty]]
	

]
