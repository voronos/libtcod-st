Class {
	#name : #TCODMonsterGenerator,
	#superclass : #Object,
	#category : #'LibtcodSt-Tutorial'
}

{ #category : #'instance creation' }
TCODMonsterGenerator >> newMonsterAt: aPoint [
	^ (TCOD randomIntFrom: 0 to: 100) < 80
		ifTrue: [ TCODObject new
				x: aPoint x y: aPoint y;
				char: $o;
				doesBlock: true;
				color: Color green lighter ]
		ifFalse: [ TCODObject new
				x: aPoint x y: aPoint y;
				char: $T;
				doesBlock: true;
				color: Color green muchDarker ]
]
