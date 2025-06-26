Class {
	#name : 'StPlaygroundScriptCommand',
	#superclass : 'StPlaygroundCommand',
	#category : 'NewTools-Playground-Command',
	#package : 'NewTools-Playground',
	#tag : 'Command'
}

{ #category : 'default' }
StPlaygroundScriptCommand class >> defaultDescription [ 
	^ 'manage script'
]

{ #category : 'default' }
StPlaygroundScriptCommand class >> defaultIconName [ 
	^ #tools
]

{ #category : 'default' }
StPlaygroundScriptCommand class >> defaultName [ 
	^ 'Script'
]

{ #category : 'accessing' }
StPlaygroundScriptCommand class >> order [ 
	^ 100
]

{ #category : 'executing' }
StPlaygroundScriptCommand >> execute [
	(StPlaygroundScriptPresenter 
		newApplication: context application
		model: context
		script: context script)
		openDialog.
]
