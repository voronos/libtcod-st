Class {
	#name : #TCODObject,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'char',
		'color',
		'doesBlock'
	],
	#category : #'LibtcodSt-Tutorial'
}

{ #category : #accessing }
TCODObject >> char [
	^ char
]

{ #category : #accessing }
TCODObject >> char: anObject [
	char := anObject
]

{ #category : #drawing }
TCODObject >> clearOn: aTcodConsole [
aTcodConsole atX: self x atY: self y putChar: Character space withBackground: TCODBackgroundFlag BackgroundNone.
]

{ #category : #accessing }
TCODObject >> color [
	^ color asTcodColor
]

{ #category : #accessing }
TCODObject >> color: anObject [
	color := anObject
]

{ #category : #accessing }
TCODObject >> doesBlock [
	^ doesBlock
]

{ #category : #accessing }
TCODObject >> doesBlock: anObject [
	doesBlock := anObject
]

{ #category : #drawing }
TCODObject >> drawOn: aTcodConsole withFov: aTcodMap [
	aTcodMap ifVisibleAtX: self x atY: self y do: [ aTcodConsole
				setDefaultForegroundColor: self color;
				putChar: self char atX: self x atY: self y ]
]

{ #category : #initialization }
TCODObject >> initialize [ 
doesBlock := false.
]

{ #category : #accessing }
TCODObject >> location [
^ x @ y
]

{ #category : #logic }
TCODObject >> moveOrAttackInGame: aTcodGame onMap: map byX: dx andY: dy [
	| targetX targetY |
	targetX := self x + dx.
	targetY := self y + dy.
	aTcodGame objects
		detect: [ :o | o location = (targetX @ targetY) ]
		ifFound: [ :target | 
			Transcript
				show: 'The ';
				show: target char asString;
				show: ' laughs at your puny efforts to attack him!';
				cr ]
		ifNone: [ (map isPoint: targetX @ targetY blockedInGame: aTcodGame)
				ifFalse: [ self
						x: targetX;
						y: targetY ] ]
]

{ #category : #accessing }
TCODObject >> x [
	^ x
]

{ #category : #accessing }
TCODObject >> x: anObject [
	x := anObject
]

{ #category : #accessing }
TCODObject >> x: newX y: newY [
	x := newX.
	y := newY
]

{ #category : #accessing }
TCODObject >> y [
	^ y
]

{ #category : #accessing }
TCODObject >> y: anObject [
	y := anObject
]
