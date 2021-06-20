--require
local EaseUI = require(script:GetCustomProperty("EaseUI"))
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
				
local tableContent = {
				["TIMER"] = {
							["end"] = { title = "CHECK" ,abs = "end" , fullTxt = "Chrono arrived to "},
							},
				["RESOURCES"] = {
							["grow"] = { title = "INCREASE" ,abs = "increased by one" , fullTxt = "was increased by one. You have: "},
							["custom"] = { title = "STACK" ,abs = "stack: " , fullTxt = "You have a stack of %s &s"},
							["max"] = { title = "MAX" ,abs = "maximun stack " , fullTxt = "You have reached the maximun stack established"},
							},
				["GAME"] = { head = Color.CYAN, body = Color.FromLinearHex("010618FF")},
				["WORLD"] ={ head = Color.PURPLE, body = Color.FromLinearHex("1A0026FF")},
				["PLAYER"] = {
							["join"] = { title = "JOINED" ,abs = "> " , fullTxt = "%s joined "},
							["leaves"] = { title = "LEAVES" ,abs = "> " , fullTxt = "%s leaves the game "},
							}
				}
--custom
local SIDE_PANEL = World.FindObjectByName("UI Side Panel")	
local MAIN_FOLDER = World.FindObjectByName("CVS_common_Notifications")	
local ANIMDESTROY = MAIN_FOLDER:GetCustomProperty("animDestroyC")
local REF_STACK = MAIN_FOLDER:GetCustomProperty("stackTemplate")
--custom notifications
		--PONER AQUI LAS ESPECIALES, COMO LA DEL PLAYER GRANDE Y TAL (DESDE MAIN FOLDER)
--local
local localPlayer = Game.GetLocalPlayer()
_G.numStacks = 0
_G.totalElementos = 0
script.clientUserData.isBusy = false
local indexTask = 0
local pendingTask = {}
local eventBusy = 0
local sortPos = 0
local callOffFade = false
local isFading = false
local INT_DESTROY_TIME = 1
--------------------------------------------------API--------------------------------------

local CVS_NOTIFY_API = {}

function CVS_NOTIFY_API.sendNotification (typeCode, data_1, data_2)
	_G.numStacks  = _G.numStacks  + 1
	internalSend(typeCode, data_1, data_2)
	_G.totalElementos = _G.totalElementos + 1
end

function internalSend (typeCode, data_1, data_2)
	if not script.clientUserData.isBusy then 
		script.clientUserData.isBusy = true
		if eventBusy then 								
			sortPos = _G.numStacks - eventBusy			
			_G.numStacks = sortPos
			eventBusy = 0	
			if debugPrint then print(script.name.."event busy: cambiando stack number:"..tostring(_G.numStacks).." to "..tostring(sortPos)) end
		end 	
		local typeCode = string.upper(typeCode)
		print(script.name.." Receiving stack notification type: ["..typeCode.."]  DATA>> data_1[".. tostring(data_1).."] // data_2[".. tostring(data_2).."]")
		callOffFade = true
		SIDE_PANEL.opacity = 1		
		local stackWindow = World.SpawnAsset(REF_STACK,{parent = SIDE_PANEL}) 
		local isDone = getContent(stackWindow, typeCode, data_1, data_2)
		writeContent(stackWindow)
		setStackColor(stackWindow, typeCode)
		animStack(stackWindow, sortPos)
		fadeOut()
		if _G.SELFDESTROY_TIME ~= nil then destroyStack(stackWindow) end
		script.clientUserData.isBusy = false
		return true
	elseif script.clientUserData.isBusy then						
		eventBusy = eventBusy + 1
		indexTask = indexTask + 1
		pendingTask [indexTask] = {t = typeCode, d1 = data_1, d2 = data_2}
		print(script.name.." busy, Generando tarea")
		return false
	end
end

--[[
function Tick () --externalizar si hace falta
	if not script.clientUserData.isBusy then 
		for i = 1, #pendingTask do 
			if pendingTask[i] ~= nil then  
				local d0 = pendingTask[i].t
				local d1 = pendingTask[i].d1 
				local d2 = pendingTask[i].d2
				local result = internalSend (d0, d1, d2)
				if result then 
					pendingTask[i] = nil 
					print(script.name.." busy > Not busy, tarea entregada, borrando...", i)
				elseif not result then 
					print(script.name.." busy, guardando tarea otra vez..", i)
				end
			end 
		end
	end
	fadeOut()
end 
]]--

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

function animStack(window, numStak)
	Task.Spawn(function()
		local heightWindows = window.height * numStak
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
		window.clientUserData.pos = numStak
	end,0.5)
end

function animDestroy (window)
		Task.Wait(0.5)
		local time = 0.8	
		local timeZero = os.clock()
		repeat 
			local timeA = os.clock() - timeZero
			local value = ANIMDESTROY:GetValue(timeA)
			value = math.tointeger(CoreMath.Round(value , 0))
			window.width= value
			window.height = value
			Task.Wait()
			if timeA >= (time * 3)/4 then 
				Task.Spawn(function() 
					local oX = window.x 
					for xp = oX, oX -50, -1 do 
						if Object.IsValid(window) then 
							window.x = xp 
						end
						Task.Wait()
					end
					
					local oX = window.x 
					for xp = oX , oX + 800,30 do 
						if Object.IsValid(window) then 
							window.x = xp
						end
						Task.Wait()
					end 
				end)
			end
		until timeA >= time
	return true
end 

function reLocate()
	Task.Wait(INT_DESTROY_TIME + 0.5)
	local newIndex = 0
	local tableWindows = SIDE_PANEL:GetChildren()
	for _, pn in pairs (tableWindows) do 	
		if pn:IsA("UIPanel") then 
			newIndex = newIndex + 1
			if debugPrint then print(">>>>>>RELOCATE>>>>>>>>>>>",pn,_G.dynamicHeight," origPos: ",pn.clientUserData.pos, " newPos: ", newIndex) end
			pn.clientUserData.pos = newIndex
			local pos =  _G.dynamicHeight - (pn.clientUserData.pos * pn.height)
			EaseUI.EaseY(pn, pos, 0.5, EaseUI.EasingEquation.ELASTIC)			
		end 
	end
	_G.numStacks = newIndex
end


function fadeOut ()  
	local oldStacks = _G.numStacks
	callOffFade = false
	Task.Spawn(function()	
		if isFading  then return
			print("FADEOUT: already fading, return end")
		else
			isFading = true
			for i= 1, 0, -0.1 do 
				if oldStacks == _G.numStacks then 
					SIDE_PANEL.opacity = i
				else 
					SIDE_PANEL.opacity = 1
					isFading = false
					break
				end
				isFading = false
				if callOffFade then callOffFade = false  print(script.name.." >> fade break") break end
				Task.Wait(0.1)
			end
		end
	end, _G.FADEOUT_TIME)
end 


function destroyStack (window)
	Task.Spawn(function()
		if Object.IsValid(window) then
			callOffFade = true
			SIDE_PANEL.opacity = 1
			if debugPrint then  print(script.name.." >> Destroying old stack: ", window) end
			local isDone = animDestroy(window)
			Task.Spawn(function() if Object.IsValid (window) then window:Destroy() end end,INT_DESTROY_TIME)
			fadeOut()
		end
		reLocate()
	end, _G.SELFDESTROY_TIME)	
end


function getContent (window, typeCode, data_1, data_2)
	local isCodeOk = false
	for _,code in pairs (tableContent) do 
		if tableContent[typeCode] == nil then 
			warn(" typeCode ["..typeCode.."] for stack windows no valid: Set to default")	
			local genContent = { title = "GENERAL EVENT" ,abs = "" , fullTxt = "No aditional data"}
			return genContent
		else 
			isCodeOk = true
		end
	end
	if isCodeOk then 	
		print(script.name.." >> Writting text to ", window)
		local table = tableContent[typeCode]
		local content = table [data_1]
		window.clientUserData.fullTxt = content.fullTxt
		window.clientUserData.abs = content.abs
		if typeCode == "TIMER" then 
			local obj = data_2:GetObject()
			window.clientUserData.abs = obj.name.." : "..content.abs
		elseif typeCode == "PLAYER" then 
			window.clientUserData.abs = content.abs..data_2.." <"
		elseif typeCode == "RESOURCES" then 
			if data_2 ~= nil then 
				window.clientUserData.abs = content.abs..data_2
			end		
		end
		window.clientUserData.title = typeCode..":"..content.title	
		print(script.name.." >> Get content stack: ["..typeCode.."]  Title: ["..window.clientUserData.title.."]  Abstract: [".. window.clientUserData.abs.."]")
		return true
	end
end 

function writeContent (window)
	local Title = window:FindDescendantByName("Title")
	local Body = window:FindDescendantByName("bodyText")	
	Title.text = window.clientUserData.title
	Body.text = window.clientUserData.abs
end


return CVS_NOTIFY_API

