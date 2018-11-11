Class {
	#name : #TCODTile,
	#superclass : #Object,
	#instVars : [
		'blocked',
		'blocksSight'
	],
	#category : #'LibtcodSt-Tutorial'
}

{ #category : #'as yet unclassified' }
TCODTile class >> defaultGroundColor [
	
		^ Color
		r: 50
		g: 50
		b: 150
		range: 255
]

{ #category : #'as yet unclassified' }
TCODTile class >> defaultWallColor [

	^ Color
		r: 0
		g: 0
		b: 100
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

{ #category : #accessing }
TCODTile >> color [
	^ self blocksSight
		ifTrue: [
			self class defaultWallColor ]
		ifFalse: [ self class defaultGroundColor ]
]

{ #category : #initialization }
TCODTile >> initialize [
	blocked := false.
	blocksSight := false.
]

{ #category : #'as yet unclassified' }
TCODTile >> unblockTile [
self blocked: false; blocksSight: false.
]
