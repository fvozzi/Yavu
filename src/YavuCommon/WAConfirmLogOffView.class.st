Class {
	#name : #WAConfirmLogOffView,
	#superclass : #WAYavuBootstrap,
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
WAConfirmLogOffView >> renderContentOn: html [

	html form: [ 
		html tbsContainer: [ 
			html tbsRow with: [ 
				html tbsColumn 
					largeSize: 4;
					with: [ ].
				html tbsColumn 
					largeSize: 4;
					with: [ 
						html heading level: 2; with: 'Desea salir del sistema?'..
						html tbsButton 
							beSuccess;
							text: 'Sí'; 
							callback: [ parent cerrarSession ].
					html tbsButton 
						bePrimary; 
						text: 'No'; 
						callback: [ parent content: self session yavuSystem homeViewClass new  ]].
					html tbsColumn 
						largeSize: 4;
						with: [ ].
					
		 ] ]
]
]
