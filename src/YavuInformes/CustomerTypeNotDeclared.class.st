Class {
	#name : #CustomerTypeNotDeclared,
	#superclass : #CustomerType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
CustomerTypeNotDeclared class >> code [
	"Devuelve el codigo de clase del receptor."

	^'N'
]

{ #category : #accessing }
CustomerTypeNotDeclared class >> cuitNumberOf: aDocumentNumber [
	"En el caso de Junin no siempre viene el sexo y entonces no podemos definir el CUIL."
	
	^aDocumentNumber
]

{ #category : #testing }
CustomerTypeNotDeclared class >> isNotDeclared [
	
	
	^true
]

{ #category : #accessing }
CustomerTypeNotDeclared class >> label [

	^'No declarado' 
]
