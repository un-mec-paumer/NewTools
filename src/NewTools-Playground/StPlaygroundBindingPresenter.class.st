Class {
	#name : 'StPlaygroundBindingPresenter',
	#superclass : 'StPresenter',
	#instVars : [
		'binding',
		'parent',
		'bindingName',
		'labelName',
		'bindingValue',
		'button',
		'buttonClose',
		'interactionModel'
	],
	#category : 'NewTools-Playground-View',
	#package : 'NewTools-Playground',
	#tag : 'View'
}

{ #category : 'accessing' }
StPlaygroundBindingPresenter class >> model: anModelPresenter [
	^ self basicNew 
		interactionModel: anModelPresenter parent interactionModel;
		setModelBeforeInitialization: anModelPresenter;
		initialize
]

{ #category : 'actions' }
StPlaygroundBindingPresenter >> buttonAction [
	self subclassResponsibility.
]

{ #category : 'layout' }
StPlaygroundBindingPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
			add: (SpBoxLayout new
				   add: (SpBoxLayout newLeftToRight hAlignCenter add: labelName ; yourself) ;
				   add: bindingName; 
				   yourself) withConstraints: [:contrain | contrain width: 75; height: 60; padding: 10];
		 	add: bindingValue;
			add: (SpBoxLayout newLeftToRight hAlignCenter ;
						add: button; 
						add: buttonClose;
						yourself) withConstraints: [ :contrain | contrain width: 70; height: 30 ];
			
		   yourself
]

{ #category : 'initialization' }
StPlaygroundBindingPresenter >> initializeButtons [
	button := self newButton.
	button label: self nameButton.
	button action: [ 
		self buttonAction
	].
	
	buttonClose := self newButton.
	buttonClose label: 'close'.
	buttonClose action: [ self delete ]
]

{ #category : 'initialization' }
StPlaygroundBindingPresenter >> initializeCode [
	bindingValue := self newCode.
	bindingValue interactionModel: SpCodeScriptingInteractionModel new.
]

{ #category : 'initialization - deprecated' }
StPlaygroundBindingPresenter >> initializePresenter [
	self initializeTextInput.

	self initializeCode.
	
	self initializeButtons.
	
	
	

	
]

{ #category : 'initialization' }
StPlaygroundBindingPresenter >> initializeTextInput [ 
	bindingName := self newTextInput.
	labelName := self newLabel.
	labelName label: 'name'.
]

{ #category : 'accessing' }
StPlaygroundBindingPresenter >> interactionModel: aInteractionModel [
	interactionModel := aInteractionModel
]

{ #category : 'accessing' }
StPlaygroundBindingPresenter >> nameButton [
	self subclassResponsibility.
]

{ #category : 'accessing - model' }
StPlaygroundBindingPresenter >> setModelBeforeInitialization: aModel [
	parent := aModel.
]
