Class {
	#name : #TBSMigrationView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'migrationToRun'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSMigrationView class >> on: aClass [ 
	
	^ self new
]

{ #category : #private }
TBSMigrationView >> buildReport [
	"Create a MAReport new instance showing the reciver selected model class instances."

	^(TBSMagritteReport rows: self ranMigrationsLog  description: YavuSystemMigrationLog new maDescriptionForReport)
		batchSize: 20;
		tableEmpty: 'No hay migraciones ejecutadas en el sistema.'
		yourself
]

{ #category : #accessing }
TBSMigrationView >> migrationToRun [
	^ migrationToRun
]

{ #category : #accessing }
TBSMigrationView >> migrationToRun: anObject [
	migrationToRun := anObject
]

{ #category : #rendering }
TBSMigrationView >> migrationsToRun [

	^ self session yavuSystem migrationsToRun
]

{ #category : #private }
TBSMigrationView >> ranMigrationsLog [

	^ self session yavuSystem ranMigrationsLog
]

{ #category : #rendering }
TBSMigrationView >> renderContentOn: html [

	html tbsPanel: [
		html tbsPageHeader: [  
	html tbsRow: [ 
		html tbsColumn: [ 
	html text: 'Migraciones: '.
	html select
		list: self migrationsToRun;
		callback: [ :oneMigration | self migrationToRun: oneMigration ];
		labels: [ :each | each shortDescription]
		] mediumSize: 10.
	html tbsColumn: [ 
			html tbsRow: [ html tbsSubmitButton 
				bePrimary;
				callback: [ self run];
				with: 'Ejecutar' ] ] mediumSize: 2
	]].
	html tbsPanelBody: [  
			html div class: 'table-responsive'; with: [  html render: self buildReport ]
	]]
]
