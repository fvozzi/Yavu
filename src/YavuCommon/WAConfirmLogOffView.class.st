Class {
	#name : #WAConfirmLogOffView,
	#superclass : #WAYavuBootstrap,
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
WAConfirmLogOffView >> renderContentOn: html [
	html
		form: [ html row
				with: [ html column
						largeSize: 4;
						with: [  ].
					html column
						largeSize: 4;
						with: [ html heading
								level: 2;
								with: '¿Desea salir del sistema?'.
							html formButton
								bePrimary;
								text: 'Sí';
								callback: [ parent cerrarSession ].
							html space.
							html formButton
								beSecondary;
								text: 'No';
								callback: [ parent content: self session yavuSystem homeViewClass new ] ].
					html column
						largeSize: 4;
						with: [  ] ] ]
]
