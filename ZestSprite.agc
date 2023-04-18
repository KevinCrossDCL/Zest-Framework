
foldstart // ZestSprite Widget

function ZestCreateSprite(zestWidgetParameters as string)
	local zestSpriteID as integer
	
	zestSpriteID = CreateSprite(0)
	SetSpriteOffset(zestSpriteID, 0, 0)

	zestCreatedWidgets.insert(ZestAddCreatedWidget(zestSpriteID, "Sprite"))

	if (zestWidgetParameters <> "") then ZestUpdateSprite(zestSpriteID, zestWidgetParameters)
endfunction zestSpriteID

function ZestPinSpriteToBottomCenterOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinSpriteToBottomCentreOfSprite(zestSpriteA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinSpriteToBottomCentreOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, GetSpriteX(zestSpriteB) + (GetSpriteWidth(zestSpriteB) / 2), GetSpriteY(zestSpriteB) + GetSpriteHeight(zestSpriteB) - zestOffsetY)
	endif
endfunction

function ZestPinSpriteToBottomLeftOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, GetSpriteX(zestSpriteB) + zestOffsetX, (GetSpriteY(zestSpriteB) + GetSpriteHeight(zestSpriteB)) - (GetSpriteHeight(zestSpriteA) + zestOffsetY))
	endif
endfunction

function ZestPinSpriteToBottomRightOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, (GetSpriteX(zestSpriteB) + GetSpriteWidth(zestSpriteB)) - (GetSpriteWidth(zestSpriteA) + zestOffsetX), (GetSpriteY(zestSpriteB) + GetSpriteHeight(zestSpriteB)) - (GetSpriteHeight(zestSpriteA) + zestOffsetY))
	endif
endfunction

function ZestPinSpriteToCenterLeftOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinSpriteToCentreLeftOfSprite(zestSpriteA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinSpriteToCenterOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinSpriteToCentreOfSprite(zestSpriteA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinSpriteToCenterRightOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinSpriteToCentreRightOfSprite(zestSpriteA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinSpriteToCentreLeftOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, GetSpriteX(zestSpriteB) + zestOffsetX, GetSpriteY(zestSpriteB) + (GetSpriteHeight(zestSpriteB) / 2) + zestOffsetY)
	endif
endfunction

function ZestPinSpriteToCentreOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, GetSpriteX(zestSpriteB) + (GetSpriteWidth(zestSpriteB) / 2) + zestOffsetX, GetSpriteY(zestSpriteB) + (GetSpriteHeight(zestSpriteB) / 2) + zestOffsetY)
	endif
endfunction

function ZestPinSpriteToCentreRightOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, GetSpriteX(zestSpriteB) + GetSpriteWidth(zestSpriteB) + zestOffsetX, GetSpriteY(zestSpriteB) + (GetSpriteHeight(zestSpriteB) / 2) + zestOffsetY)
	endif
endfunction

function ZestPinSpriteToSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, GetSpriteX(zestSpriteB) + zestOffsetX, GetSpriteY(zestSpriteB) + zestOffsetY)
	endif
endfunction

function ZestPinSpriteToTopCenterOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinSpriteToTopCentreOfSprite(zestSpriteA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinSpriteToTopCentreOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, GetSpriteX(zestSpriteB) + (GetSpriteWidth(zestSpriteB) / 2) + zestOffsetX, GetSpriteY(zestSpriteB) + zestOffsetY)
	endif
endfunction

function ZestPinSpriteToTopLeftOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, GetSpriteX(zestSpriteB) + zestOffsetX, GetSpriteY(zestSpriteB) + zestOffsetY)
	endif
endfunction

function ZestPinSpriteToTopRightOfSprite(zestSpriteA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetSpriteExists(zestSpriteA) and GetSpriteExists(zestSpriteB))
		SetSpritePositionByOffset(zestSpriteA, (GetSpriteX(zestSpriteB) + GetSpriteWidth(zestSpriteB)) - (GetSpriteWidth(zestSpriteA) + zestOffsetX), GetSpriteY(zestSpriteB) + zestOffsetY)
	endif
endfunction

function ZestUpdateSprite(zestSpriteID as integer, zestWidgetParameters as string)
	ZestSetParametersType(zestWidgetParameters)

	if (GetSpriteExists(zestSpriteID))
		if (zestParameters.size[1] > -999999 and zestParameters.size[2] > -999999)
			SetSpriteSize(zestSpriteID, zestParameters.size[1], zestParameters.size[2])
		elseif (zestParameters.size[1] > -999999 and zestParameters.size[2] = -999999)
			SetSpriteSize(zestSpriteID, zestParameters.size[1], GetSpriteHeight(zestSpriteID))
		elseif (zestParameters.size[1] = -999999 and zestParameters.size[2] > -999999)
			SetSpriteSize(zestSpriteID, GetSpriteWidth(zestSpriteID), zestParameters.size[2])
		endif
		if (zestParameters.angle > -999999)
			SetSpriteAngle(zestSpriteID, zestParameters.angle)
		endif
		if (zestParameters.color[1] > -999999 or zestParameters.color[2] > -999999 or zestParameters.color[3] > -999999)
			SetSpriteColor(zestSpriteID, zestParameters.color[1], zestParameters.color[2], zestParameters.color[3], GetSpriteColorAlpha(zestSpriteID))
		endif
		if (zestParameters.color[4] > -999999)
			SetSpriteColorAlpha(zestSpriteID, zestParameters.color[4])
		endif
		if (zestParameters.depth > -999999)
			SetSpriteDepth(zestSpriteID, zestParameters.depth)
		endif
		if (zestParameters.fixToScreen > -999999)
			FixSpriteToScreen(zestSpriteID, zestParameters.fixToScreen)
		endif
		if (zestParameters.group > -999999)
			SetSpriteGroup(zestSpriteID, zestParameters.group)
		endif
		if (zestParameters.imageID > 0)
			SetSpriteImage(zestSpriteID, zestParameters.imageID)
		endif

		if (zestParameters.offsetTopLeft = 1)
			SetSpriteOffset(zestSpriteID, 0, 0)
		elseif (zestParameters.offsetTopCenter = 1)
			SetSpriteOffset(zestSpriteID, GetSpriteWidth(zestSpriteID) / 2.0, 0)
		elseif (zestParameters.offsetTopRight = 1)
			SetSpriteOffset(zestSpriteID, GetSpriteWidth(zestSpriteID), 0)
		elseif (zestParameters.offsetCenterLeft = 1)
			SetSpriteOffset(zestSpriteID, 0, GetSpriteHeight(zestSpriteID) / 2.0)
		elseif (zestParameters.offsetCenter = 1)
			SetSpriteOffset(zestSpriteID, GetSpriteWidth(zestSpriteID) / 2.0, GetSpriteHeight(zestSpriteID) / 2.0)
		elseif (zestParameters.offsetCenterRight = 1)
			SetSpriteOffset(zestSpriteID, GetSpriteWidth(zestSpriteID), GetSpriteHeight(zestSpriteID) / 2.0)
		elseif (zestParameters.offsetBottomLeft = 1)
			SetSpriteOffset(zestSpriteID, 0, GetSpriteHeight(zestSpriteID))
		elseif (zestParameters.offsetBottomCenter = 1)
			SetSpriteOffset(zestSpriteID, GetSpriteWidth(zestSpriteID) / 2.0, GetSpriteHeight(zestSpriteID))
		elseif (zestParameters.offsetBottomRight = 1)
			SetSpriteOffset(zestSpriteID, GetSpriteWidth(zestSpriteID), GetSpriteHeight(zestSpriteID))
		else
			if (zestParameters.offset[1] > -999999 or zestParameters.offset[2] > -999999)
				SetSpriteOffset(zestSpriteID, zestParameters.offset[1], zestParameters.offset[2])
			endif
		endif
		if (zestParameters.position[1] > -999999 and zestParameters.position[2] > -999999)
			SetSpritePositionByOffset(zestSpriteID, zestParameters.position[1], zestParameters.position[2])
		elseif (zestParameters.position[1] > -999999 and zestParameters.position[2] = -999999)
			SetSpritePositionByOffset(zestSpriteID, zestParameters.position[1], GetSpriteYByOffset(zestSpriteID))
		elseif (zestParameters.position[1] = -999999 and zestParameters.position[2] > -999999)
			SetSpritePositionByOffset(zestSpriteID, GetSpriteXByOffset(zestSpriteID), zestParameters.position[2])
		endif
		if (zestParameters.spriteShader > -999999)
			SetSpriteShader(zestSpriteID, zestParameters.spriteShader)
		endif
	endif
endfunction

foldend
