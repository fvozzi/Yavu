Class {
	#name : #TBSEntitiesBrowserTask,
	#superclass : #WATask,
	#category : #'YavuCommon-View'
}

{ #category : #running }
TBSEntitiesBrowserTask >> go [ 

	self call: self tbsForm
]

{ #category : #running }
TBSEntitiesBrowserTask >> tbsForm [ 


	| theForm |
	theForm := TBSMagritteExampleFormDescription new asComponent.
	theForm addDecoration: TBSMagritteValidationDecoration new.
	
	theForm
		addDecoration: 
			(TBSMagritteFormDecoration newWithDefaultButtons 
				formCss: 'form-horizontal';
				legend: 'Prueba';
				yourself);
		yourself.
	
	theForm magritteDescription tbsInlineValidationMessages: false.
	theForm magritteDescription tbsFormInline: false.
	theForm magritteDescription tbsFormHorizontal: true.

	^ theForm
]
