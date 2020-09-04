Class {
	#name : #TBSMenuImageUploadForm,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'file'
	],
	#category : #'YavuRestaurant-View'
}

{ #category : #'instance creation' }
TBSMenuImageUploadForm class >> on: aClass [ 
	
	^ self new
]

{ #category : #rendering }
TBSMenuImageUploadForm >> renderContentOn: html [
    html form multipart; with: [
        html fileUpload
            callback: [ :value | self uploadFile: value ].
        html submitButton: 'Upload' ]
]

{ #category : #rendering }
TBSMenuImageUploadForm >> uploadFile: aFile [
    | stream |
    stream := (File openForWriteFileNamed: aFile fileName).
    [ stream binary; nextPutAll: aFile rawContents ] 
        ensure: [ stream close ]
]
