
foldstart // ZestTouch

type typeZestVec2
	x	as float
	y	as float
endtype

type typeZestTouch
	currentSpriteHit as integer
	currentX as float
	currentY as float
	firstSpriteHit as integer
	previousTouchCount as integer
	spritePressed as integer
	spriteReleased as integer
	spriteToPan as integer
	spriteToScale as integer
	startX as float
	startY as float
	touchCount as integer
	touchTime as float
endtype

global zestTouchCollection as typeZestTouch[10]
global zestTouchCount as integer

function ZestEndTrackingTouch()
	if (GetMultiTouchExists() = 1)
		if (GetRawTouchCount(1) = 0)
			zestTouchCollection[1].currentSpriteHit = 0
			zestTouchCollection[1].firstSpriteHit = 0
			zestTouchCollection[0].previousTouchCount = 0
			zestTouchCollection[1].spritePressed = 0
			zestTouchCollection[1].spriteReleased = 0
			zestTouchCollection[0].touchCount = 0
		endif
	else
		if (GetPointerReleased())
			zestTouchCollection[1].currentSpriteHit = 0
			zestTouchCollection[1].firstSpriteHit = 0
			zestTouchCollection[1].spritePressed = 0
			zestTouchCollection[1].spriteReleased = 0
			zestTouchCollection[0].touchCount = 0
		endif
	endif
endfunction

function ZestGetSpritePressed()
	
endfunction zestTouchCollection[1].firstSpriteHit

function ZestGetSpriteReleased()
	local zestSpriteReleased as integer : zestSpriteReleased = 0
	if (zestTouchCollection[1].firstSpriteHit = zestTouchCollection[1].currentSpriteHit)
		if (GetMultiTouchExists() = 1)
			if (GetRawTouchCount(1) = 0)
				zestSpriteReleased = zestTouchCollection[1].currentSpriteHit
			endif
		else
			if (GetPointerReleased())
				zestSpriteReleased = zestTouchCollection[1].currentSpriteHit
			endif
		endif
	endif
endfunction zestSpriteReleased

function ZestGetSpriteTouching()

endfunction zestTouchCollection[1].currentSpriteHit

function ZestGetTouchCurrentX()
	
endfunction zestTouchCollection[zestTouchCollection[0].touchCount].currentX

function ZestGetTouchCurrentY()
	
endfunction zestTouchCollection[zestTouchCollection[0].touchCount].currentY

function ZestGetTouchStartX()

endfunction zestTouchCollection[zestTouchCollection[0].touchCount].startX

function ZestGetTouchStartY()

endfunction zestTouchCollection[zestTouchCollection[0].touchCount].startY

// The GetRawTouch code in the below function is based on @baxslash's PinchZoom function he shared on the AGK forum
// https://forum.thegamecreators.com/thread/205033
function ZestStartTrackingTouch()
	local zestTouchEvent as integer
	
	zestTouchCollection[0].previousTouchCount = zestTouchCollection[0].touchCount
	zestTouchCollection[0].touchCount = 0
		
	if (GetMultiTouchExists() = 1)
		zestTouchEvent = GetRawFirstTouchEvent(1)
		while (zestTouchEvent > 0)
			inc zestTouchCollection[0].touchCount
			zestTouchCollection[zestTouchCollection[0].touchCount].startX = GetRawTouchStartX(zestTouchEvent)
			zestTouchCollection[zestTouchCollection[0].touchCount].startY = GetRawTouchStartY(zestTouchEvent)
			zestTouchCollection[zestTouchCollection[0].touchCount].currentX = GetRawTouchCurrentX(zestTouchEvent)
			zestTouchCollection[zestTouchCollection[0].touchCount].currentY = GetRawTouchCurrentY(zestTouchEvent)
			zestTouchCollection[zestTouchCollection[0].touchCount].currentSpriteHit = GetSpriteHit(ScreenToWorldX(GetRawTouchCurrentX(zestTouchEvent)), ScreenToWorldY(GetRawTouchCurrentY(zestTouchEvent)))
			zestTouchCollection[zestTouchCollection[0].touchCount].firstSpriteHit = GetSpriteHit(ScreenToWorldX(GetRawTouchStartX(zestTouchEvent)), ScreenToWorldY(GetRawTouchStartY(zestTouchEvent)))
			zestTouchEvent = GetRawNextTouchEvent()
		endwhile

		if (zestTouchCollection[0].touchCount > 0)
			if (zestTouchCollection[0].previousTouchCount <> zestTouchCollection[0].touchCount)
				zestTouchCollection[1].startX = zestTouchCollection[1].currentX
				zestTouchCollection[1].startY = zestTouchCollection[1].currentY
				zestTouchCollection[2].startX = zestTouchCollection[2].currentX
				zestTouchCollection[2].startY = zestTouchCollection[2].currentY
			endif
		endif
	else
		if (GetPointerPressed())
			zestTouchCollection[0].startX = ScreenToWorldX(GetPointerX())
			zestTouchCollection[0].startY = ScreenToWorldY(GetPointerY())
			zestTouchCollection[1].firstSpriteHit = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
			zestTouchCollection[0].touchTime = timer()
		else
			if (GetPointerState())
				zestTouchCollection[1].currentSpriteHit = GetSpriteHit(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))
				if (timer() - zestTouchCollection[0].touchTime > 0.1)
					zestTouchCollection[0].currentX = ScreenToWorldX(GetPointerX())
					zestTouchCollection[0].currentY = ScreenToWorldY(GetPointerY())
				endif
			endif
		endif
	endif
endfunction

foldend
