Class {
	#name : #TCODMap,
	#superclass : #FFIExternalObject,
	#category : #'LibtcodSt-FFI'
}

{ #category : #'instance creation' }
TCODMap class >> newWidth: width height: height [
	^ self ffiCall: #(TCODMap TCOD_map_new #(int width , int height)) module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCODMap >> computeFovAtX: x atY: y torchRadius: torchRadius doComputeLightWalls: aBool withAlgorithm: aTcodFovAlgorithm [
self ffiCall: #(void TCOD_map_compute_fov (TCODMap self, int x, int y, int torchRadius, bool aBool, TCODFovAlgorithm aTcodFovAlgorithm)) module: LibTCOD 
]

{ #category : #testing }
TCODMap >> ifVisibleAtX: x atY: y do: aBlock [
	(self isVisibleAtX: x atY: y)		ifTrue: aBlock
]

{ #category : #testing }
TCODMap >> isVisibleAtX: x atY: y [
^ self ffiCall: #(bool TCOD_map_is_in_fov #(TCODMap self, int x, int y)) module: LibTCOD .
]

{ #category : #initialization }
TCODMap >> setIsTransparent: isTransparent isWalkable: isWalkable atX: x atY: y [
	self
		ffiCall: #(void TCOD_map_set_properties #(TCODMap self , int x , int y , bool isTransparent , bool isWalkable))
		module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCODMap >> updatePropertiesFrom: aMap [
	aMap
		tilesDo:
			[ :coord :tile | 
			self
				setIsTransparent:
					tile
						blocksSight not
				isWalkable:
					tile
						blocked not
				atX:
					coord
						x
				atY:
					coord
						y ]
]
