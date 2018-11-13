Class {
	#name : #TCODObject,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'char',
		'color'
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
	^ color
]

{ #category : #accessing }
TCODObject >> color: anObject [
	color := anObject
]

{ #category : #drawing }
TCODObject >> drawOn: aTcodConsole withFov: aTcodMap [
	aTcodMap ifVisibleAtX: self x atY: self y do: [ aTcodConsole
				setDefaultForegroundColor: self color;
				putChar: self char atX: self x atY: self y ]
]

{ #category : #logic }
TCODObject >> moveOnMap: map byX: dx andY: dy [
	map
		at:
			(self
				x
				+ dx)
				@
					(self
						y
						+ dy)
		ifPresent:
			[ :tile | 
			tile
				blocked
				ifFalse:
					[ x := x
						+ dx.
					y := y
						+ dy ] ]
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
