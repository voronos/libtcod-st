Extension { #name : #Rectangle }

{ #category : #'*LibtcodSt-Tutorial' }
Rectangle >> randomInnerPoint [
^ (TCOD randomIntFrom: self left + 1 to: self right -1) @ (TCOD randomIntFrom: self top + 1 to: self bottom -1)
]
