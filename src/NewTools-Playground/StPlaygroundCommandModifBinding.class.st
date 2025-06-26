Class {
	#name : 'StPlaygroundCommandModifBinding',
	#superclass : 'StPlaygroundCommand',
	#category : 'NewTools-Playground-Command',
	#package : 'NewTools-Playground',
	#tag : 'Command'
}

{ #category : 'default' }
StPlaygroundCommandModifBinding class >> defaultDescription [ 
	^ 'change the name and the value of a binding'
]

{ #category : 'default' }
StPlaygroundCommandModifBinding class >> defaultIconName [ 
	^ #edit
]

{ #category : 'default' }
StPlaygroundCommandModifBinding class >> defaultName [ 
	^ 'modif binding'
]

{ #category : 'executing' }
StPlaygroundCommandModifBinding >> execute [ 
	(StPlaygroundBindingModif
		model: context)
		open.
]
