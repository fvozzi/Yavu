Class {
	#name : #YavuMigration2,
	#superclass : #YavuSystemMigration,
	#category : #'YavuCommon-Migrations'
}

{ #category : #accessing }
YavuMigration2 class >> description [ 

	^ 'Prueba Actualizo todas las facturas de compras seteando el precio neto 21 o el precio neto 10.5 según el iva que tenga ingresado. Es decir, si tiene iva 21 entonces seteo en precio neto 21 el valor que se encuentra ingresado en precio neto. Lo mismo para iva 10.5'
]

{ #category : #accessing }
YavuMigration2 class >> migrationIdentifier [

	 ^ 2
]
