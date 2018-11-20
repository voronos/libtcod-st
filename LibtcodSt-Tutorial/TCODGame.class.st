Class {
	#name : #TCODGame,
	#superclass : #Object,
	#instVars : [
		'objects',
		'map',
		'actionMap',
		'screenWidth',
		'screenHeight',
		'fovMap',
		'player',
		'monsterGenerator',
		'gameState',
		'playerAction'
	],
	#category : #'LibtcodSt-Tutorial'
}

{ #category : #'as yet unclassified' }
TCODGame class >> defaultMaxRoomMonsters [
^ 3
]

{ #category : #drawing }
TCODGame >> drawOn: aTcodConsole [
	map drawOn: aTcodConsole withFov: fovMap.
	objects do: [ :o | o drawOn: aTcodConsole withFov:  fovMap ].
	aTcodConsole blitTo: TCODConsole null fromExtent: (0 @ 0 extent: screenWidth @ screenHeight) toPoint: 0 @ 0.
	TCOD flush.
	objects do: [ :o | o clearOn: aTcodConsole ]
]

{ #category : #accessing }
TCODGame >> handleKeys [
	| key |
	key := TCOD waitForKeypress: true.
	actionMap
		at: key vk
		ifPresent: [ :action | 
			action value.
			^ 'playing' ].

	"use this as last to return true or false"
	^ key vk = TCODKeycode TCODK_ESCAPE
		ifTrue: [ 'exit' ]
		ifFalse: [ 'didnt-take-turn' ]
]

{ #category : #initialization }
TCODGame >> initialize [
	monsterGenerator := TCODMonsterGenerator new.
	screenWidth := 80.
	screenHeight := 50.
	self initializePlayer.
	objects := OrderedCollection with: player.
	map := TCODGameMap
		randomNewWidth: TCODGameMap defaultWidth
		andHeight: TCODGameMap defaultHeight
		forGame: self.
	fovMap := TCODFovMap newWidth: TCODGameMap defaultWidth height: TCODGameMap defaultHeight.
	map updateFovMap: fovMap.
self initializeActionMap
]

{ #category : #initialization }
TCODGame >> initializeActionMap [
	actionMap := {(TCODKeycode TCODK_DOWN
		-> [ player
				moveOrAttackInGame: self
				onMap: map
				byX: 0
				andY: 1 ]).
	(TCODKeycode TCODK_LEFT
		-> [ player
				moveOrAttackInGame: self
				onMap: map
				byX: -1
				andY: 0 ]).
	(TCODKeycode TCODK_RIGHT
		-> [ player
				moveOrAttackInGame: self
				onMap: map
				byX: 1
				andY: 0 ]).
	(TCODKeycode TCODK_UP
		-> [ player
				moveOrAttackInGame: self
				onMap: map
				byX: 0
				andY: -1 ])} asDictionary
]

{ #category : #initialization }
TCODGame >> initializePlayer [
	player := TCODObject new
		char: $@;
		doesBlock: true;
		color: Color white
]

{ #category : #accessing }
TCODGame >> objects [
	^ objects
]

{ #category : #accessing }
TCODGame >> objectsAt: aPoint do: aBlock [
objects select: [ :o | (o x @ o y)= aPoint  ] thenDo: aBlock.
]

{ #category : #accessing }
TCODGame >> performMonsterActions [
	objects
		select: [ :o | o ~= player ]
		thenDo: [ :o | 
			Transcript
				show: 'The ';
				show: o char;
				show: ' growls.';
				cr ]
]

{ #category : #'as yet unclassified' }
TCODGame >> placeObjectsIn: aRect [
	1 to: (TCOD randomIntFrom: 0 to: self class defaultMaxRoomMonsters) do: [ :i | 
		objects add: (monsterGenerator newMonsterAt: aRect randomInnerPoint) ]
]

{ #category : #playing }
TCODGame >> play [
	| con |
	TCOD
		initRootWidth: screenWidth
		height: screenHeight
		title: 'libtcod - smalltalk'
		isFullScreen: false
		renderer: TCODRendererEnum TCOD_RENDERER_SDL.
	con := TCODConsole newWithWidth: screenWidth andHeight: screenHeight.
	con setDefaultForegroundColor: Color white asTcodColor.
	gameState := 'playing'.
	[ 'exit' = playerAction ]
		whileFalse: [ self recomputeFov.
			self drawOn: con.
			playerAction := self handleKeys.
			(gameState = 'playing' and: [ playerAction ~= 'didnt-take-turn' ])
				ifTrue: [ self performMonsterActions ] ].
	TCOD quit
]

{ #category : #playing }
TCODGame >> recomputeFov [
fovMap
		computeFovAtX: player x
		atY: player y
		torchRadius: 10
		doComputeLightWalls: true
		withAlgorithm: TCODFovAlgorithm defaultFovAlgorithm.
]

{ #category : #accessing }
TCODGame >> setPlayerAt: aPoint [
player x: aPoint x y: aPoint y
]
