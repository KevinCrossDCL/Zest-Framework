
foldstart // ZestImageButton Widget

type typeZestImageButton
	id as integer
	disabledImageID as integer
	enabled as integer
	enabledImageID as integer
	held as integer
	hoverImageID as integer
	pressed as integer
	released as integer
	sprContainer as integer
	timePressed as float
endtype

global zestImageButtonCollection as typeZestImageButton[]
zestImageButtonCollection.length = 1

function ZestCreateImageButton(zestWidgetParameters as string)
	local zestImageButtonID as integer
	
	zestImageButtonCollection.length = zestImageButtonCollection.length + 1
	zestImageButtonID = zestImageButtonCollection.length
	zestImageButtonCollection[zestImageButtonID].id = zestImageButtonID

	zestCreatedWidgets.insert(ZestAddCreatedWidget(zestImageButtonID, "Button"))
	
	// DEFAULT SETTINGS
	zestImageButtonCollection[zestImageButtonID].enabled = 1
	
	zestImageButtonCollection[zestImageButtonID].sprContainer = CreateSprite(0)
	SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, 0, 0)
	
	if (zestWidgetParameters <> "") then ZestUpdateImageButton(zestImageButtonID, zestWidgetParameters)
endfunction zestImageButtonID

function ZestDeleteImageButton(zestImageButtonID as integer)
	DeleteSprite(zestImageButtonCollection[zestImageButtonID].sprContainer)
endfunction

function ZestDisableImageButton(zestImageButtonID as integer)
	if (zestImageButtonCollection[zestImageButtonID].enabled = 1)
		zestImageButtonCollection[zestImageButtonID].enabled = 0
		ZestUpdateImageButton(zestImageButtonID, "enabled:false")
	endif
endfunction

function ZestEnableImageButton(zestImageButtonID as integer)
	if (zestImageButtonCollection[zestImageButtonID].enabled = 0)
		zestImageButtonCollection[zestImageButtonID].enabled = 1
		ZestUpdateImageButton(zestImageButtonID, "enabled:true")
	endif
endfunction

function ZestGetImageButtonHeight(zestImageButtonID as integer)
	local zestImageButtonHeight as float
	
	if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
		zestImageButtonHeight = GetSpriteHeight(zestImageButtonCollection[zestImageButtonID].sprContainer)
	endif
endfunction zestImageButtonHeight

function ZestGetImageButtonHeld(zestImageButtonID as integer)
	zestImageButtonCollection[zestImageButtonID].held = 0
	if (zestImageButtonCollection[zestImageButtonID].enabled = 1)
		if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
			if (ZestGetSpriteTouching() = zestImageButtonCollection[zestImageButtonID].sprContainer)
				zestImageButtonCollection[zestImageButtonID].held = 1
			endif
		endif
	endif
endfunction zestImageButtonCollection[zestImageButtonID].held

function ZestGetImageButtonID(zestImageButtonID as integer)
	local zestID as integer
	
	zestID = zestImageButtonCollection[zestImageButtonID].id
endfunction zestID

function ZestGetImageButtonPressed(zestImageButtonID as integer)
	zestImageButtonCollection[zestImageButtonID].pressed = 0
	if (zestImageButtonCollection[zestImageButtonID].enabled = 1)
		if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
			if (ZestGetSpritePressed() = zestImageButtonCollection[zestImageButtonID].sprContainer)
				zestImageButtonCollection[zestImageButtonID].pressed = 1
			endif
		endif
	endif
endfunction zestImageButtonCollection[zestImageButtonID].pressed

function ZestGetImageButtonReleased(zestImageButtonID as integer)
	zestImageButtonCollection[zestImageButtonID].released = 0
	if (zestImageButtonCollection[zestImageButtonID].enabled = 1)
		if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
			if (ZestGetSpriteReleased() = zestImageButtonCollection[zestImageButtonID].sprContainer)
				zestImageButtonCollection[zestImageButtonID].released = 1
			else
				zestImageButtonCollection[zestImageButtonID].released = 0
			endif
		endif
	endif
endfunction zestImageButtonCollection[zestImageButtonID].released

function ZestGetImageButtonWidth(zestImageButtonID as integer)
	local zestImageButtonWidth as float
	
	if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
		zestImageButtonWidth = GetSpriteWidth(zestImageButtonCollection[zestImageButtonID].sprContainer)
	endif
endfunction zestImageButtonWidth

function ZestGetImageButtonX(zestImageButtonID as integer)
	local zestImageButtonX as float
	
	if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
		zestImageButtonX = GetSpriteX(zestImageButtonCollection[zestImageButtonID].sprContainer)
	endif
endfunction zestImageButtonX

function ZestGetImageButtonXByOffset(zestImageButtonID as integer)
	local zestImageButtonX as float
	
	if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
		zestImageButtonX = GetSpriteXByOffset(zestImageButtonCollection[zestImageButtonID].sprContainer)
	endif
endfunction zestImageButtonX

function ZestGetImageButtonY(zestImageButtonID as integer)
	local zestButtonY as float
	
	if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
		zestButtonY = GetSpriteY(zestImageButtonCollection[zestImageButtonID].sprContainer)
	endif
endfunction zestButtonY

function ZestGetImageButtonYByOffset(zestImageButtonID as integer)
	local zestButtonY as float
	
	if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
		zestButtonY = GetSpriteYByOffset(zestImageButtonCollection[zestImageButtonID].sprContainer)
	endif
endfunction zestButtonY

function ZestImageButtonListener(zestImageButtonID as integer)
	local zestButtonSprite as integer

	if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
		if (ZestGetSpritePressed() = zestImageButtonCollection[zestImageButtonID].sprContainer)
			if (zestImageButtonCollection[zestImageButtonID].hoverImageID > 0 and zestImageButtonCollection[zestImageButtonID].enabledImageID > 0)
				SetSpriteImage(zestImageButtonCollection[zestImageButtonID].sprContainer, zestImageButtonCollection[zestImageButtonID].hoverImageID)
			endif
		endif
		if (ZestGetSpriteTouching() <> zestImageButtonCollection[zestImageButtonID].sprContainer)
			if (zestImageButtonCollection[zestImageButtonID].enabled)
				if (zestImageButtonCollection[zestImageButtonID].hoverImageID > 0 and zestImageButtonCollection[zestImageButtonID].enabledImageID > 0)
					SetSpriteImage(zestImageButtonCollection[zestImageButtonID].sprContainer, zestImageButtonCollection[zestImageButtonID].enabledImageID)
				endif
			else
				if (zestImageButtonCollection[zestImageButtonID].hoverImageID > 0 and zestImageButtonCollection[zestImageButtonID].disabledImageID > 0)
					SetSpriteImage(zestImageButtonCollection[zestImageButtonID].sprContainer, zestImageButtonCollection[zestImageButtonID].disabledImageID)
				endif
			endif
		endif
		if (ZestGetSpriteReleased() = zestImageButtonCollection[zestImageButtonID].sprContainer)
			if (zestImageButtonCollection[zestImageButtonID].enabled)
				if (zestImageButtonCollection[zestImageButtonID].hoverImageID > 0 and zestImageButtonCollection[zestImageButtonID].enabledImageID > 0)
					SetSpriteImage(zestImageButtonCollection[zestImageButtonID].sprContainer, zestImageButtonCollection[zestImageButtonID].enabledImageID)
				endif
			else
				if (zestImageButtonCollection[zestImageButtonID].hoverImageID > 0 and zestImageButtonCollection[zestImageButtonID].disabledImageID > 0)
					SetSpriteImage(zestImageButtonCollection[zestImageButtonID].sprContainer, zestImageButtonCollection[zestImageButtonID].disabledImageID)
				endif
			endif
		endif
	endif
endfunction

function ZestUpdateImageButton(zestImageButtonID as integer, zestWidgetParameters as string)
	ZestSetParametersType(zestWidgetParameters)
			
	if (GetSpriteExists(zestImageButtonCollection[zestImageButtonID].sprContainer))
		// PARAMETERS FOR SINGLE STATE
		if (zestParameters.enabled > -999999)
			zestImageButtonCollection[zestImageButtonID].enabled = zestParameters.enabled
		endif
		if (zestParameters.hoverImageID > -999999)
			zestImageButtonCollection[zestImageButtonID].hoverImageID = zestParameters.hoverImageID
		endif
		if (zestParameters.imageID > -999999)
			zestImageButtonCollection[zestImageButtonID].disabledImageID = zestParameters.imageID
			zestImageButtonCollection[zestImageButtonID].enabledImageID = zestParameters.imageID
		endif
		
		// PARAMETERS FOR DISABLED STATE
		if (zestParameters.disabledImageID > -999999)
			zestImageButtonCollection[zestImageButtonID].disabledImageID = zestParameters.disabledImageID
		endif
		
		// PARAMETERS FOR ENABLED STATE
		if (zestParameters.enabledImageID > -999999)
			zestImageButtonCollection[zestImageButtonID].enabledImageID = zestParameters.enabledImageID
		endif
		
		// IMPORTANT PARAMETERS WHICH AFFECT THE SIZE, OFFSET, AND POSITION OF THE WIDGET
		if (zestParameters.size[1] > -999999 and zestParameters.size[2] > -999999)
			SetSpriteSize(zestImageButtonCollection[zestImageButtonID].sprContainer, zestParameters.size[1], zestParameters.size[2])
		elseif (zestParameters.size[1] > -999999 and zestParameters.size[2] = -999999)
			SetSpriteSize(zestImageButtonCollection[zestImageButtonID].sprContainer, zestParameters.size[1], GetSpriteHeight(zestImageButtonCollection[zestImageButtonID].sprContainer))
		elseif (zestParameters.size[1] = -999999 and zestParameters.size[2] > -999999)
			SetSpriteSize(zestImageButtonCollection[zestImageButtonID].sprContainer, GetSpriteWidth(zestImageButtonCollection[zestImageButtonID].sprContainer), zestParameters.size[2])
		endif

		if (zestParameters.offsetTopLeft = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, 0, 0)
		elseif (zestParameters.offsetTopCenter = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, GetSpriteWidth(zestImageButtonCollection[zestImageButtonID].sprContainer) / 2.0, 0)
		elseif (zestParameters.offsetTopRight = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, GetSpriteWidth(zestImageButtonCollection[zestImageButtonID].sprContainer), 0)
		elseif (zestParameters.offsetCenterLeft = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, 0, GetSpriteHeight(zestImageButtonCollection[zestImageButtonID].sprContainer) / 2.0)
		elseif (zestParameters.offsetCenter = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, GetSpriteWidth(zestImageButtonCollection[zestImageButtonID].sprContainer) / 2.0, GetSpriteHeight(zestImageButtonCollection[zestImageButtonID].sprContainer) / 2.0)
		elseif (zestParameters.offsetCenterRight = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, GetSpriteWidth(zestImageButtonCollection[zestImageButtonID].sprContainer), GetSpriteHeight(zestImageButtonCollection[zestImageButtonID].sprContainer) / 2.0)
		elseif (zestParameters.offsetBottomLeft = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, 0, GetSpriteHeight(zestImageButtonCollection[zestImageButtonID].sprContainer))
		elseif (zestParameters.offsetBottomCenter = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, GetSpriteWidth(zestImageButtonCollection[zestImageButtonID].sprContainer) / 2.0, GetSpriteHeight(zestImageButtonCollection[zestImageButtonID].sprContainer))
		elseif (zestParameters.offsetBottomRight = 1)
			SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, GetSpriteWidth(zestImageButtonCollection[zestImageButtonID].sprContainer), GetSpriteHeight(zestImageButtonCollection[zestImageButtonID].sprContainer))
		else
			if (zestParameters.offset[1] > -999999 or zestParameters.offset[2] > -999999)
				SetSpriteOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, zestParameters.offset[1], zestParameters.offset[2])
			endif
		endif
		if (zestParameters.position[1] > -999999 and zestParameters.position[2] > -999999)
			SetSpritePositionByOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, zestParameters.position[1], zestParameters.position[2])
		elseif (zestParameters.position[1] > -999999 and zestParameters.position[2] = -999999)
			SetSpritePositionByOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, zestParameters.position[1], GetSpriteYByOffset(zestImageButtonCollection[zestImageButtonID].sprContainer))
		elseif (zestParameters.position[1] = -999999 and zestParameters.position[2] > -999999)
			SetSpritePositionByOffset(zestImageButtonCollection[zestImageButtonID].sprContainer, GetSpriteXByOffset(zestImageButtonCollection[zestImageButtonID].sprContainer), zestParameters.position[2])
		endif
		
		// DISABLED STATE
		if (zestImageButtonCollection[zestImageButtonID].enabled = 0)
			if (zestImageButtonCollection[zestImageButtonID].disabledImageID > 0) then SetSpriteImage(zestImageButtonCollection[zestImageButtonID].sprContainer, zestImageButtonCollection[zestImageButtonID].disabledImageID)
		endif
		
		// ENABLED STATE
		if (zestImageButtonCollection[zestImageButtonID].enabled = 1)
			if (zestImageButtonCollection[zestImageButtonID].enabledImageID > 0) then SetSpriteImage(zestImageButtonCollection[zestImageButtonID].sprContainer, zestImageButtonCollection[zestImageButtonID].enabledImageID)
		endif
		
		// THE REST OF THE PARAMETERS NEXT
		if (zestParameters.angle > -999999)
			SetSpriteAngle(zestImageButtonCollection[zestImageButtonID].sprContainer, zestParameters.angle)
		endif
		if (zestParameters.depth > -999999)
			SetSpriteDepth(zestImageButtonCollection[zestImageButtonID].sprContainer, zestParameters.depth)
		endif
		if (zestParameters.fixToScreen = 1)
			FixSpriteToScreen(zestImageButtonCollection[zestImageButtonID].sprContainer, 1)
		endif
	endif
endfunction

foldend
