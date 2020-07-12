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

	html form: [ 
		html cardBody: [ 
	html row: [ 
		html column: [ 
	html text: 'Migraciones: '.
	html select
		list: self migrationsToRun;
		callback: [ :oneMigration | self migrationToRun: oneMigration ];
		labels: [ :each | each shortDescription]
		] mediumSize: 10.
	html column: [ 
			html row: [ html formButton 
				bePrimary;
				callback: [ self run];
				with: 'Ejecutar' ] ] mediumSize: 2
	]]].
	html div class: 'table-responsive'; with: [  html render: self buildReport ]
	
 
]

{ #category : #running }
TBSMigrationView >> run [ 

	^[ self migrationToRun run] on: Error do: [ :ex | self inform: ex description ]
]
