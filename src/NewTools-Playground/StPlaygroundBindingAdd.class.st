Class {
	#name : 'StPlaygroundBindingAdd',
	#superclass : 'StPlaygroundBindingPresenter',
	#category : 'NewTools-Playground-View',
	#package : 'NewTools-Playground',
	#tag : 'View'
}

{ #category : 'actions' }
StPlaygroundBindingAdd >> buttonAction [
	|test|	
		
		bindingName text isEmpty ifTrue: [ self error: 'I need a string to by identify' . ^ nil ].
		bindingValue text isEmpty ifTrue: [ self error: 'I need a value' . ^ nil  ].


		test := bindingValue evaluate: bindingValue text onCompileError: [ ^ self ] onError: [ :e | ^ self ]. 		"wait more instruction about this possibility
		test ifNil: [ self error:'test'. ^ nil ]."
		
		
		interactionModel addBindingNamed: bindingName text with: test.
		parent updatePresenterKeepingSelection.
		self delete.
]

{ #category : 'accessing' }
StPlaygroundBindingAdd >> nameButton [ 
	^ 'add'
]

{ #category : 'accessing' }
StPlaygroundBindingAdd >> windowTitle [ 
	^ 'new binding'
]
