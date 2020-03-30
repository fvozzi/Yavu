Class {
	#name : #TBSYavuHomeView,
	#superclass : #WAYavuBootstrap,
	#category : #'YavuCommon-View'
}

{ #category : #rendering }
TBSYavuHomeView >> renderContentOn: html [
	html tbsContainer
		class: 'theme-showcase';
		with: [ html
				tbsJumbotron: [ html heading: 'Yavusoft'.
					html
						paragraph: [ html
								text:
									'Sistema de objetos para modelar la gestión de diferentes actividades.'.
							html
								text: ' En principio cerveceria, restaurante y nutrición. '.
							html
								text: ' El experimento consiste en evaluar las partes comunes para que .'.
							html
								text: ' convivan en un mismo espacio de objetos junto con las diferencias .' ] ] ]
]
