Class {
	#name : #TCODTile,
	#superclass : #Object,
	#instVars : [
		'blocked',
		'blocksSight',
		'isExplored'
	],
	#category : #'LibtcodSt-Tutorial'
}

{ #category : #'as yet unclassified' }
TCODTile class >> defaultDarkGroundColor [
	
		^ Color
		r: 50
		g: 50
		b: 150
		range: 255
]

{ #category : #'as yet unclassified' }
TCODTile class >> defaultDarkWallColor [

	^ Color
		r: 0
		g: 0
		b: 100
		range: 255
]

{ #category : #'as yet unclassified' }
TCODTile class >> defaultLightGroundColor [
	^ Color
		r: 200
		g: 180
		b: 50
		range: 255
]

{ #category : #'as yet unclassified' }
TCODTile class >> defaultLightkWallColor [
	^ Color
		r: 130
		g: 110
		b: 50
		range: 255
]

{ #category : #'instance creation' }
TCODTile class >> newBlocking: aBool [
|instance|
instance := self new.
instance blocked: aBool; blocksSight: aBool.
^ instance
]

{ #category : #accessing }
TCODTile >> beExplored [
	isExplored := true
]

{ #category : #accessing }
TCODTile >> blocked [
	^ blocked
]

{ #category : #accessing }
TCODTile >> blocked: anObject [
	blocked := anObject
]

{ #category : #accessing }
TCODTile >> blocksSight [
	^ blocksSight
]

{ #category : #accessing }
TCODTile >> blocksSight: anObject [
	blocksSight := anObject
]

{ #category : #initialization }
TCODTile >> initialize [
	blocked := false.
	blocksSight := false.
	isExplored := false.
]

{ #category : #accessing }
TCODTile >> isExplored [
	^ isExplored
]

{ #category : #accessing }
TCODTile >> notVisibleColor [
	^ self blocksSight
		ifTrue: [
			self class defaultDarkWallColor ]
		ifFalse: [ self class defaultDarkGroundColor ]
]

{ #category : #'as yet unclassified' }
TCODTile >> unblockTile [
self blocked: false; blocksSight: false.
]

{ #category : #accessing }
TCODTile >> visibleColor [
	^ self blocksSight
		ifTrue: [ self class defaultLightkWallColor  ]
		ifFalse: [ self class defaultLightGroundColor ]
]
