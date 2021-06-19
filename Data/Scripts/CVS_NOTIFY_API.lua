--content
local tableCodeTitles = { 
				["max"] = { preTitle = "RESOURCES", Title = "reached maximum"},
				}
				
local tableColors = {
				["TIMER"] = { head = Color.BLACK, body = Color.FromLinearHex("181818FF")},
				["RESOURCES"] = { head = Color.ORANGE, body = Color.FromLinearHex("683E00FF")},
				["GAME"] = { head = Color.CYAN, body = Color.FromLinearHex("010618FF")},
				["WORLD"] ={ head = Color.PURPLE, body = Color.FromLinearHex("1A0026FF")},
				["PLAYER"] = { head = Color.EMERALD, body = Color.FromLinearHex("00382AFF")},
				}
--custom
local SIDE_PANEL = World.FindObjectByName("UI Side Panel")	
local MAIN_FOLDER = World.FindObjectByName("CVS_common_Notifications")	
local REF_STACK = MAIN_FOLDER:GetCustomProperty("stackTemplate")
--custom notifications
		--PONER AQUI LAS ESPECIALES, COMO LA DEL PLAYER GRANDE Y TAL (DESDE MAIN FOLDER)
--local
local localPlayer = Game.GetLocalPlayer()
_G.numStacks = 0
--------------------------------------------------API--------------------------------------

local CVS_NOTIFY_API = {}

function CVS_NOTIFY_API.sendNotification (typeCode, data_1, data_2)
	local typeCode = string.upper(typeCode)
	print(script.name.." Sending stack notification type: ["..typeCode.."]  /DATA >>/ ", data_1," // ", data_2)
	SIDE_PANEL.opacity = 1
	print(SIDE_PANEL, STACK_ID)
	local stackWindow = World.SpawnAsset(REF_STACK,{parent = SIDE_PANEL}) 
	setStackColor(stackWindow, typeCode)
	_G.numStacks  = _G.numStacks  + 1
	animStack(stackWindow)
	fadeOut()
	if _G.SELFDESTROY_TIME ~= nil then destroyStack(stackWindow) end
end

function setStackColor (window, typeCode)
	local isCodeOk = false
	for _,code in pairs (tableColors) do 
		if tableColors[typeCode] == nil then 
			warn(" typeCode ["..typeCode.."] for stack windows no valid: Set to default")	
			break
		else 
			isCodeOk = true
		end
	end
	if isCodeOk then 
		local backBody = window:FindDescendantByName("Back_body")
		local backHead = window:FindDescendantByName("Back_head")
		if Object.IsValid (backHead) then  
			local headColor =  tableColors[typeCode].head 
			backHead:SetColor(headColor)
		end 
		if Object.IsValid(backBody) then 
			local bodyColor = tableColors[typeCode].body 
			local bodyDesat = bodyColor:GetDesaturated(0.2)		
			backBody:SetColor(bodyDesat)	
			local tableTextures = backBody:FindDescendantsByType("UIImage")
			for _,tx in pairs (tableTextures) do 
				tx:SetColor(bodyColor)
			end 
		end
	end 
end

function animStack(window)
	Task.Spawn(function()
		local heightPanel = _G.dynamicHeight
		local heightWindows = window.height * _G.numStacks
		local finalPos =  _G.dynamicHeight - heightWindows
		local time = 0.7	
		local p1 = CurveKey.New(0, 0,{interpolation = CurveInterpolation.CUBIC, tangent = 0.1})
		local p2 =  CurveKey.New(time, finalPos, {interpolation = CurveInterpolation.CUBIC, tangent = 2.75})
		local tableKeys = {[1] = p1, [2] = p2}
		local curveAnim = SimpleCurve.New(tableKeys)
		local timeZero = os.clock()
		repeat 
			local timeA = os.clock() - timeZero
			local value = curveAnim:GetValue(timeA)
			local relAlpha = value /finalPos
			window.opacity = relAlpha
			window.y = value
			Task.Wait()
		until timeA >= time
		window.clientUserData.isSet = true
		window.clientUserData.pos = _G.numStacks
	end,0.5)
end

function reLocate()
	local tableWindows = SIDE_PANEL:GetChildren()
	for _, pn in pairs (tableWindows) do 
		if pn:IsA("UIPanel") then 
			print(">>>>>>>>>>>>>>>>>",pn,_G.dynamicHeight,pn.clientUserData.pos)
			local pos =  _G.dynamicHeight - (pn.clientUserData.pos * pn.height)
			pn.y = pos
		end 
	end
end


function fadeOut ()
	local oldStacks = _G.numStacks
	Task.Spawn(function()		
		for i= 1, 0, -0.1 do 
			if oldStacks == _G.numStacks then 
				SIDE_PANEL.opacity = i
			else 
				SIDE_PANEL.opacity = 1
				break
			end
			Task.Wait(0.1)
		end
	end, _G.FADEOUT_TIME)
end 

function destroyStack (window)
	Task.Spawn(function()
		if Object.IsValid(window) then window:Destroy() end
		reLocate()
	end, _G.SELFDESTROY_TIME)	
			
			--reLocate ()    --debug!!!!!!!!!!!! , quitar luego
end

return CVS_NOTIFY_API