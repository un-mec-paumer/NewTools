Class {
	#name : 'StPlaygroundBindingModif',
	#superclass : 'StPlaygroundBindingPresenter',
	#instVars : [
		'oldBinding'
	],
	#category : 'NewTools-Playground-View',
	#package : 'NewTools-Playground',
	#tag : 'View'
}

{ #category : 'accessing' }
StPlaygroundBindingModif class >> model: anModelPresenter [
	^ self basicNew 
		interactionModel: anModelPresenter parent interactionModel;
		setModelBeforeInitialization: anModelPresenter;
		oldBinding: anModelPresenter selectedBinding;
		initialize
]

{ #category : 'actions' }
StPlaygroundBindingModif >> buttonAction [
	|test|	
		
		bindingName text isEmpty ifTrue: [ self error: 'I need a string to by identify' . ^ nil ].
		bindingValue text isEmpty ifTrue: [ self error: 'I need a value' . ^ nil  ].


		test := bindingValue evaluate: bindingValue text onCompileError: [ ^ self ] onError: [ :e | ^ self ]. 		
		"wait more instruction about this possibility
		test ifNil: [ self error:'test'. ^ nil ]."
		
		interactionModel removeBindingNamed: oldBinding key.
		interactionModel addBindingNamed: bindingName text with: test.
		
		parent updatePresenterKeepingSelection.
		self delete.
]

{ #category : 'initialization' }
StPlaygroundBindingModif >> initializeTextInput [
	super initializeTextInput.
	bindingName text: oldBinding key. 
]

{ #category : 'accessing' }
StPlaygroundBindingModif >> nameButton [
	^ 'modif'
]

{ #category : 'accessing' }
StPlaygroundBindingModif >> oldBinding: aBinding [
	oldBinding := aBinding.
]

{ #category : 'accessing' }
StPlaygroundBindingModif >> windowTitle [ 
	^ 'modif of ' , oldBinding key.
]
