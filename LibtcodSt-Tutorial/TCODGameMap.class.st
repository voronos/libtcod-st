Class {
	#name : #TCODGameMap,
	#superclass : #Object,
	#instVars : [
		'tiles',
		'width',
		'height'
	],
	#category : #'LibtcodSt-Tutorial'
}

{ #category : #accessing }
TCODGameMap class >> defaultHeight [
^ 45
]

{ #category : #accessing }
TCODGameMap class >> defaultMaxRoomSize [
^ 10
]

{ #category : #accessing }
TCODGameMap class >> defaultMaxRooms [
^ 30
]

{ #category : #accessing }
TCODGameMap class >> defaultMinRoomSize [
^ 6
]

{ #category : #accessing }
TCODGameMap class >> defaultWidth [ 
^ 80
]

{ #category : #'instance creation' }
TCODGameMap class >> new [
^ self newWidth: self defaultWidth andHeight: self defaultHeight.
]

{ #category : #'instance creation' }
TCODGameMap class >> newWidth: width andHeight: height [
	| instance |
	instance := self basicNew.
	instance
		width: width;
		height: height.
	instance resetTiles.
	^ instance
]

{ #category : #'instance creation' }
TCODGameMap class >> randomNewWidth: width andHeight: height withPlayer: aTcodObject [
	| instance rooms |
	instance := self basicNew.
	instance
		width: width;
		height: height.
	instance resetTiles.
	rooms := OrderedCollection new.
	0 to: self defaultMaxRooms do: [ :r | 
		| w h x y newRoom failed |
		w := TCOD randomIntFrom: self defaultMinRoomSize to: self defaultMaxRoomSize.
		h := TCOD randomIntFrom: self defaultMinRoomSize to: self defaultMaxRoomSize.
		x := TCOD randomIntFrom: 0 to: width - w - 1.
		y := TCOD randomIntFrom: 0 to: height - h - 1.
		newRoom := x @ y extent: w @ h.
		failed := false.
		rooms
			detect: [ :otherRoom | newRoom intersects: otherRoom ]
			ifNone: [ instance createRoom: newRoom.
				rooms
					ifEmpty: [ aTcodObject x: newRoom center x y: newRoom center y ]
					ifNotEmpty: [ "connect rooms via tunnel"
						| previousCenter |
						previousCenter := rooms last center.
						(TCOD randomIntFrom: 0 to: 1) = 1
							ifTrue: [ instance
									createHorizontalTunnelFrom: previousCenter x
									to: newRoom center x
									atRow: previousCenter y.
								instance
									createVerticalTunnelFrom: previousCenter y
									to: newRoom center y
									atColumn: newRoom center x ]
							ifFalse: [ instance
									createVerticalTunnelFrom: previousCenter y
									to: newRoom center y
									atColumn: previousCenter x.
								instance
									createHorizontalTunnelFrom: previousCenter x
									to: newRoom center x
									atRow: newRoom center y ] ].
				rooms add: newRoom ] ].
	^ instance
]

{ #category : #accessing }
TCODGameMap >> at: aPoint [
^ tiles at: aPoint
]

{ #category : #accessing }
TCODGameMap >> at: aPoint ifPresent: aBlockClosure [ 
 ^ tiles at: aPoint ifPresent: aBlockClosure
]

{ #category : #initialization }
TCODGameMap >> connectRoom: newRoom to: oldRoom [
|previousCenter|
previousCenter := oldRoom center.
						(TCOD randomIntFrom: 0 to: 1) = 1
							ifTrue: [ self
									createHorizontalTunnelFrom: previousCenter x
									to: newRoom center x
									atRow: previousCenter y.
								self
									createVerticalTunnelFrom: previousCenter y
									to: newRoom center y
									atColumn: newRoom center x ]
							ifFalse: [ self
									createVerticalTunnelFrom: previousCenter y
									to: newRoom center y
									atColumn: previousCenter x.
								self
									createHorizontalTunnelFrom: previousCenter x
									to: newRoom center x
									atRow: newRoom center y ].
]

{ #category : #initialization }
TCODGameMap >> createHorizontalTunnelFrom: x1 to: x2 atRow: y [
	(x1 min: x2) to: (x1 max: x2) do: [ :x | 
		self
			at: x @ y
			ifPresent: #unblockTile ]
]

{ #category : #initialization }
TCODGameMap >> createRoom: aRect [
"Carve out a room contained by the aRect."
"We are leaving some padding on all sides so that rooms have a border and don't share space."
	aRect left + 1 to: aRect right - 1 do: [ :x | 
		aRect top + 1 to: aRect bottom - 1 do: [ :y | 
			self
				at: x @ y
				ifPresent: [ :tile | 
					tile
						blocked: false;
						blocksSight: false ] ] ]
]

{ #category : #initialization }
TCODGameMap >> createRooms: roomCount withPlayer: aPlayer [
	| rooms |
	rooms := OrderedCollection new.
	0 to: roomCount do: [ :r | 
		| w h x y newRoom |
		w := TCOD randomIntFrom: self class defaultMinRoomSize to: self class defaultMaxRoomSize.
		h := TCOD randomIntFrom: self class defaultMinRoomSize to: self class defaultMaxRoomSize.
		x := TCOD randomIntFrom: 0 to: width - w - 1.
		y := TCOD randomIntFrom: 0 to: height - h - 1.
		newRoom := x @ y extent: w @ h.
		rooms
			detect: [ :otherRoom | newRoom intersects: otherRoom ]
			ifNone: [ self createRoom: newRoom.
				rooms
					ifEmpty: [ aPlayer x: newRoom center x y: newRoom center y ]
					ifNotEmpty: [ self connectRoom: newRoom to: rooms last ].
				rooms add: newRoom ] ]
]

{ #category : #initialization }
TCODGameMap >> createVerticalTunnelFrom: y1 to: y2 atColumn: x [
	(y1 min: y2) to: (y1 max: y2) do: [ :y | 
		self
			at: x @ y
			ifPresent: #unblockTile ]
]

{ #category : #drawing }
TCODGameMap >> drawOn: aTcodConsole withFov: aTcodMap [
	self
		tilesDo: [ :coord :tile | 
			| color |
			color := aTcodMap
				ifVisibleAtX: coord x
				atY: coord y
				do: [ tile beExplored.
					tile visibleColor ]
				ifNot: [ tile isExplored
						ifTrue: [ tile notVisibleColor ] ].
			color
				ifNotNil:
					[ aTcodConsole setCharBackgroundAtX: coord x y: coord y toColor: color ] ]
]

{ #category : #accessing }
TCODGameMap >> height [
	^ height
]

{ #category : #accessing }
TCODGameMap >> height: anObject [
	height := anObject
]

{ #category : #initialization }
TCODGameMap >> resetTiles [
	tiles := Dictionary new.
	0 to: self width do: [ :x | 0 to: self height do: [ :y | tiles at: x @ y put: (TCODTile newBlocking: true) ] ]
]

{ #category : #accessing }
TCODGameMap >> tilesDo: aTwoArgBlock [
tiles associationsDo: [ :kv |
	aTwoArgBlock value: kv key value: kv value ]
]

{ #category : #'as yet unclassified' }
TCODGameMap >> updateFovMap: aTcodFovMap [
	self
		tilesDo: [ :coord :tile | 
aTcodFovMap 
				setIsTransparent: tile blocksSight not
				isWalkable: tile blocked not
				atX: coord x
				atY: coord y ]
]

{ #category : #accessing }
TCODGameMap >> width [
	^ width
]

{ #category : #accessing }
TCODGameMap >> width: anObject [
	width := anObject
]
