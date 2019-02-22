Class {
	#name : #WAYavuComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'YavuInformes-View'
}

{ #category : #accessing }
WAYavuComponent >> convertirFecha: unaFecha [
	"Crea un nuevo Date a partir del string ingresado por el usuario."
	
	^Date readFrom: unaFecha readStream pattern: 'dd/mm/yyyy'
]

{ #category : #'as yet unclassified' }
WAYavuComponent >> parent [

	^parent
]

{ #category : #'as yet unclassified' }
WAYavuComponent >> parent: aWAComponent [

	parent:= aWAComponent
]

{ #category : #'as yet unclassified' }
WAYavuComponent >> renderLabel: aString control: aBlock model: anObject on: html [
	| id |
	html fieldSet: [
		html label
			for: (id := html nextId);
			with: aString.
		html span: [
			aBlock
				value: id
				" update the paragraph "
				value: ((html jQuery this	
					parents: 'fieldset';
					find: 'p') load
						" serialize all nearby form elements "
						serialize: (html jQuery this		
							parents: 'span';
							find: ':input')) ].
		html paragraph: anObject ]
]

{ #category : #'as yet unclassified' }
WAYavuComponent >> sistema [

	^self session sistema
]

{ #category : #'as yet unclassified' }
WAYavuComponent >> sistemaDeInformes [

	^YavuPersistentSubsystem current
]
