local CURVA = script:GetCustomProperty("testCurva")
local UI_RES_ICON = script:GetCustomProperty("resIcon"):WaitForObject()
local UI_NUM_RES = script:GetCustomProperty("currentRes"):WaitForObject()
local RATIO_SC = 10 --Higher values make icon larger in anim
local RATIO_SPEED_SC = 0.08 --Lower values get slower scale anim
local OFFSET = 0.5
local RES_NAME = "apples"
local localPlayer = Game.GetLocalPlayer()

function doAnim ()
	Task.Spawn(function() scaleAnim(UI_RES_ICON) end)
	Task.Spawn(function() scaleAnim(UI_NUM_RES) end)
end 

function scaleAnim (UI_Object)
	local minCURVA = CURVA.minValue
	local index = 0
	if UI_Object.type == "UIImage" then 
		index = 0
		local wOrig = UI_Object.width
		local hOrig = UI_Object.height
		repeat
		 	local rawValue = CURVA:GetValue(index + OFFSET)
		 	local value = math.tointeger(CoreMath.Round(rawValue* RATIO_SC, 0))
			index = index + RATIO_SPEED_SC
			Task.Wait(RATIO_SPEED_SC)		
			UI_Object.width = value + wOrig
			UI_Object.height = value + hOrig
			--print(rawValue, minCURVA)		
		until rawValue <= (minCURVA+OFFSET)
		UI_Object.width = wOrig
		UI_Object.height = hOrig
	elseif UI_Object.type == "UIText" then
		index = 0
		local szOrig = UI_Object.fontSize
		repeat
		 	local rawValue = CURVA:GetValue(index + OFFSET)
		 	local value = math.tointeger(CoreMath.Round(rawValue* RATIO_SC, 0))
			index = index + RATIO_SPEED_SC
			Task.Wait(RATIO_SPEED_SC)		
			UI_Object.fontSize = value + szOrig
			--print(rawValue, minCURVA)		
		until rawValue <= (minCURVA+OFFSET)
		UI_Object.fontSize = szOrig
	end 
	print(script.name..">> ", UI_Object, " DONE")
end 



function onResChange (player, resName, resQty)
	if player == localPlayer then 
		if resName == RES_NAME then 
			doAnim()
		end 
	end 
end

localPlayer.resourceChangedEvent:Connect( onResChange )


