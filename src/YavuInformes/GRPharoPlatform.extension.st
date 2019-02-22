Extension { #name : #GRPharoPlatform }

{ #category : #'*yavuinformes' }
GRPharoPlatform >> seasideSmtpPassword [

	^ self seasideHandlerPreferenceAt: #smtpPassword ifAbsent: [ YavuPersistentSubsystem smtpPassword]
]

{ #category : #'*yavuinformes' }
GRPharoPlatform >> seasideSmtpUsername [

	^ self seasideHandlerPreferenceAt: #smtpUsername ifAbsent: [ YavuPersistentSubsystem smtpUserName ]
]
