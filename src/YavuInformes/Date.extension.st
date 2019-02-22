Extension { #name : #Date }

{ #category : #'*YavuInformes-Extensions' }
Date >> asSQLLiteral [
	"Answer the receiver in a postgresql database compatible format."

	^'to_date(', self ddmmyyyy printString, ',', 'DD/MM/YYYY' printString, ')'
]

{ #category : #'*YavuInformes-Extensions' }
Date >> beginOfMonth [
	"Answer a date representing the first day of the month."
	
	^Date
		year: self year
		month: self monthIndex
		day: 1
]

{ #category : #'*YavuInformes-Extensions' }
Date >> ddmmyyyy [
	"Answer the receiver rendered in standard Argentina format dd/mm/yyyy."

	^ self printFormat: #(1 2 3 $/ 1 1 2)
]

{ #category : #'*YavuInformes-Extensions' }
Date >> endOfMonth [
	"Answer a date representing the last day of the month."
	
	^Date
		year: self year
		month: self monthIndex
		day: self daysInMonth
]
