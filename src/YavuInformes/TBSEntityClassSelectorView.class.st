Class {
	#name : #TBSEntityClassSelectorView,
	#superclass : #WAYavuBootstrap,
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #rendering }
TBSEntityClassSelectorView >> onEntitySelection: anEntityClass [

	self call: (TBSFactoryView on: (Factory on: anEntityClass))
]

{ #category : #rendering }
TBSEntityClassSelectorView >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

		html tbsPanel beDefault with: [ html tbsPanelHeading: [ html tbsPanelTitle level: 3; with: 'Entidades' ].
		html tbsPanelBody: [
				html form: [ 
				  self session yavuSystem allowedEntitiesClasses do: [ :each |
					html tbsButton 	
						bePrimary;		 
						beBlock;
						callback: [ self onEntitySelection: each ];
						with: each name.
					]
				]
			]]
]
