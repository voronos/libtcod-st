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
		'player'
	],
	#category : #'LibtcodSt-Tutorial'
}

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
|key|
	key := TCOD waitForKeypress: true.
	
	actionMap at: key vk ifPresent: [ :action | 
		action value ].
	"use this as last to return true or false"
	^ key vk = TCODKeycode TCODK_ESCAPE 
]

{ #category : #initialization }
TCODGame >> initialize [
	| npc |
	screenWidth := 80.
	screenHeight := 50.
	player := TCODObject
		new
		
			char: $@;
		
			color:
			Color
				white.
	map := TCODGameMap
		randomNewWidth:
			TCODGameMap
				defaultWidth
		andHeight:
			TCODGameMap
				defaultHeight
		withPlayer:
			player.
	fovMap := TCODFovMap
		newWidth:
			TCODGameMap
				defaultWidth
		height:
			TCODGameMap
				defaultHeight.
				map updateFovMap: fovMap.
	npc := TCODObject
		new
		
			x: 10;
		
			y: 10;
		
			char: $@;
		
			color:
			Color
				yellow.
	objects := {player.
	npc}.
	actionMap := {(TCODKeycode
		TCODK_DOWN
		->
			[ player
				moveOnMap: map
				byX: 0
				andY: 1 ]).
	(TCODKeycode
		TCODK_LEFT
		->
			[ player
				moveOnMap: map
				byX: -1
				andY: 0 ]).
	(TCODKeycode
		TCODK_RIGHT
		->
			[ player
				moveOnMap: map
				byX: 1
				andY: 0 ]).
	(TCODKeycode
		TCODK_UP
		->
			[ player
				moveOnMap: map
				byX: 0
				andY: -1 ])}
		asDictionary
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
	[ self recomputeFov.
	self drawOn: con.
	self handleKeys ] whileFalse.
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
