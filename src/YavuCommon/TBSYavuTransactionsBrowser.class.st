Class {
	#name : #TBSYavuTransactionsBrowser,
	#superclass : #TBSYavuObjectsBrowser,
	#category : #'YavuCommon-View'
}

{ #category : #crud }
TBSYavuTransactionsBrowser >> newInstance [
	^ instanceClass entity: parent entity date: Date today
]
