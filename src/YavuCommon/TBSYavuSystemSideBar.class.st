Class {
	#name : #TBSYavuSystemSideBar,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'selectedMenuID',
		'main'
	],
	#category : #'YavuCommon-View'
}

{ #category : #accessing }
TBSYavuSystemSideBar class >> main: aTBSSicMain [ 
	
	^self new initializeMain: aTBSSicMain
]

{ #category : #initialization }
TBSYavuSystemSideBar >> initializeMain: aTBSSicMain [ 
	

	main := aTBSSicMain 
]

{ #category : #rendering }
TBSYavuSystemSideBar >> renderContentOn: html [ 

	| accordion |
	accordion := TBSAccordion new.
	accordion 
		add: [:htmlCanvas | 
			
					self session yavuSystem allowedRootMenuActions do: [ :each | 
						htmlCanvas anchor callback: [ self executeMenuActionFor: each ]; with: each label ] 
										 ]  title: 'Seguridad';
		add: [:htmlCanvas | htmlCanvas text: 'Some more content' ] title: 'Compras'.
	html render: accordion 
]
