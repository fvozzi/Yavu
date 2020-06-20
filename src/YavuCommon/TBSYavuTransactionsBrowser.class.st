Class {
	#name : #TBSYavuTransactionsBrowser,
	#superclass : #TBSYavuObjectsBrowser,
	#category : #'YavuCommon-View'
}

{ #category : #crud }
TBSYavuTransactionsBrowser >> newInstance [

	^ instanceClass entity: parent entity date: Date today
]

{ #category : #rendering }
TBSYavuTransactionsBrowser >> renderAddInstanceForm: anInstance [
	
	^ anInstance useMagritteEditor 
		ifTrue: [ super renderAddInstanceForm: anInstance   ]
		ifFalse: [ TBSYavuVatDeclarationView new ]
]
