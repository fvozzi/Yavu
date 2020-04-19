Class {
	#name : #TBSTransactionsBrowserView,
	#superclass : #TBSYavuObjectBrowserView,
	#category : #'YavuCommon-View'
}

{ #category : #subclassResponsability }
TBSTransactionsBrowserView >> possibleInstancesClasses [

	^ (self session yavuSystem allowedTransactionsClassesOn: self subsystemClass)
]

{ #category : #subclassResponsability }
TBSTransactionsBrowserView >> renderObjectClassSelection: html [

	html text: 'Transacción:'.
	html select
		list: self possibleInstancesClasses;
		selected: self selectedOrDefaultObjectClass ;
		callback: [ :oneObjectClass | self onObjectSelection: oneObjectClass ];
		labels: [ :each | each label];
		onChange: 'submit()'
]
