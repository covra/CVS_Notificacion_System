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
				["READ"] = { head = Color.GRAY, body = Color.FromLinearHex("101010FF")},
				}
				
local tableContent = {
				["TIMER"] = {
							["end"] = { title = "CHECK" ,abs = "end" , fullTxt = "Chrono arrived to "},
							},
							
				["RESOURCES"] = {
							["grow"] = { title = "INCREASE" ,abs = "increased by one" , fullTxt = "was increased by one. You have: "},
							["custom"] = { title = "STACK" ,abs = "stack: " , fullTxt = "You have a stack of: "},
							["max"] = { title = "MAX" ,abs = "maximun stack " , fullTxt = "You have reached the maximun stack established: "},
							},
							
				["GAME"] = { ["customEq"] = { title = "EQUIP" ,abs = "> " , fullTxt = " get the special equipment: "},
							 
							},
							
				["WORLD"] = {
							["poolParty"] = { title = "FOUND" ,abs = " found pool" , fullTxt = " found the pool party cave"},
							["doorTrigg"] = { title = "ACHIEVED" ,abs = " oppened doors" , fullTxt = " achieved unlock and open the Dwarf Doors"},
							["bridge"] = { title = "ARRIVED" ,abs = " to bridge" , fullTxt = " arrived to the Rock Bridge"},
							},
							
				["PLAYER"] = {
							["join"] = { title = "JOINED" ,abs = "> " , fullTxt = " joined "},
							["leaves"] = { title = "LEAVES" ,abs = "> " , fullTxt = "  leaves the game "},
							["die"] = { title = "DIED" ,abs = "> " , fullTxt = "  has died "},
							["hpLow"] = { title = "HITPOINTS" ,abs = "Critical low  " , fullTxt = " is almost died. Check!"},
							}
				}
local tableGame = {
				["GAME"] = { ["equips"] = { "Advanced Staff"}},
				["WORLD"] = {["custom"] = {
									[1] = "poolParty",
									[2] = "doorTrigg",
									[3] = "bridge",
									}
							}
				}
--custom
local SIDE_PANEL = World.FindObjectByName("UI Side Panel")	
local MAIN_FOLDER = World.FindObjectByName("CVS_MAIN_NOTIFY")	
local ANIMDESTROY = MAIN_FOLDER:GetCustomProperty("animDestroyC")
local REF_STACK = MAIN_FOLDER:GetCustomProperty("stackTemplate")
local SELFDESTROY_TIME = MAIN_FOLDER:GetCustomProperty("selfDestroy_time")
--custom notifications
		--PONER AQUI LAS ESPECIALES, COMO LA DEL PLAYER GRANDE Y TAL (DESDE MAIN FOLDER)
--local
if not Environment.IsServer() then 
	local localPlayer = Game.GetLocalPlayer()
	_G.numStacks = 0
	_G.totalElementos = 0
	script.clientUserData.isBusy = false
end
local indexTask = 0
local pendingTask = {}
local eventBusy = 0
local sortPos = 0
local callOffFade = false
local isFading = false
_G.fadeTask = nil
local INT_DESTROY_TIME = 1
--------------------------------------------------API--------------------------------------

local CVS_NOTIFY_API = {}

function CVS_NOTIFY_API.fadeOut ()
	fadeOut()
end

function CVS_NOTIFY_API.showStack()
	callOffFade = true
	SIDE_PANEL.opacity = 1	
end 

function CVS_NOTIFY_API.closeWindow(window)
	local isDone = animDestroy (window)
	reLocate()
end 

function CVS_NOTIFY_API.sendNotification (typeCode, data_1, data_2, data_3)
	_G.numStacks  = _G.numStacks  + 1
	internalSend(typeCode, data_1, data_2, data_3)
	_G.totalElementos = _G.totalElementos + 1
end

function CVS_NOTIFY_API.animWindow (objID, open)
	local window = objID:GetObject()
	if window.clientUserData.origW == nil then
		window.clientUserData.origW = window.width
		window.clientUserData.origH = window.height
		window.clientUserData.xPos = window.x
		window.clientUserData.yPos = window.height
		window.clientUserData.origAnch = window.anchor
		window.clientUserData.origDk = window.dock
	end 
	if open then 
		local newW = math.tointeger( CoreMath.Round(    (window.clientUserData.origW  * 4)/3    ,0))
		local newH = math.tointeger( CoreMath.Round(    (window.clientUserData.origH  * 7)/3    ,0))
		EaseUI.EaseWidth(window, newW, 0.5, EaseUI.EasingEquation.ELASTIC)
		EaseUI.EaseHeight(window,newH,0.5, EaseUI.EasingEquation.ELASTIC)
		window.anchor = UIPivot.MIDDLE_CENTER
		window.dock = UIPivot.MIDDLE_CENTER
		window.x = 0
		window.y = 0
		local tableWindows = SIDE_PANEL:GetChildren()
		for _, pn in pairs (tableWindows) do 	
			if pn:IsA("UIPanel") then 
				if pn ~= window then 
					pn.opacity = 0
				end
			end 
		end
		Task.Wait(0.5)
		showBigContent(window, true)
	elseif not open then 
		showBigContent(window, false)
		EaseUI.EaseWidth(window, window.clientUserData.origW,0.5, EaseUI.EasingEquation.ELASTIC)
		EaseUI.EaseHeight(window, window.clientUserData.origH,0.5,EaseUI.EasingEquation.ELASTIC)
		window.anchor = window.clientUserData.origAnch
		window.dock  =window.clientUserData.origDk
		reLocate()
			local tableWindows = SIDE_PANEL:GetChildren()
			for _, pn in pairs (tableWindows) do 	
			if pn:IsA("UIPanel") then 
				if pn ~= window then 
					pn.opacity = 1
				end
			end 
		end
	end 
end


function CVS_NOTIFY_API.getSpecialEquips()
	return (tableGame["GAME"])["equips"]
end

function CVS_NOTIFY_API.getCustomEvents()
	return (tableGame["WORLD"])["custom"]
end

function internalSend (typeCode, data_1, data_2, data_3)
	if not Environment.IsServer() then 
		if not script.clientUserData.isBusy then 
			script.clientUserData.isBusy = true
			if eventBusy then 								
				sortPos = _G.numStacks - eventBusy			
				_G.numStacks = sortPos
				eventBusy = 0	
				if debugPrint then print(script.name.."event busy: cambiando stack number:"..tostring(_G.numStacks).." to "..tostring(sortPos)) end
			end 	
			local typeCode = string.upper(typeCode)
			print(script.name.." Receiving stack notification type: ["..typeCode.."]  DATA>> data_1[".. tostring(data_1).."] // data_2[".. tostring(data_2).."]  // data_3["..tostring(data_3).."]  ON LOCAL: "..Game.GetLocalPlayer().name)
			callOffFade = true
			SIDE_PANEL.opacity = 1		
			local stackWindow = World.SpawnAsset(REF_STACK,{parent = SIDE_PANEL}) 
			local isOk = getContent(stackWindow, typeCode, data_1, data_2, data_3)
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
			pendingTask [indexTask] = {t = typeCode, d1 = data_1, d2 = data_2, d3 = data_3}
			print(script.name.." busy, Generando tarea")
			return false
		end
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
		local heightWindows = window.height * (numStak -1)
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
		if not Environment.IsServer() then 
			window.clientUserData.isSet = true
			window.clientUserData.pos = numStak
		end
	end,0.5)
end

function animDestroy (window)
	if not Environment.IsServer() then 
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
					if Object.IsValid(window) then
						EaseUI.EaseX(window, -50, 0.5, EaseUI.EasingEquation.ELASTIC)
					end
					if Object.IsValid(window) then
						EaseUI.EaseX(window, 800, 0.7, EaseUI.EasingEquation.ELASTIC)
					end
				end)
			end
		until timeA >= time
	end
	return true
end 

function reLocate()
	if not Environment.IsServer() then 
		Task.Wait(INT_DESTROY_TIME + 0.5)
		local newIndex = 0
		local tableWindows = SIDE_PANEL:GetChildren()
		for _, pn in pairs (tableWindows) do 	
			if pn:IsA("UIPanel") then 
				newIndex = newIndex + 1
				if debugPrint then print(">>>>>>RELOCATE>>>>>>>>>>>",pn,_G.dynamicHeight," origPos: ",pn.clientUserData.pos, " newPos: ", newIndex) end
				pn.clientUserData.pos = newIndex
				local pos =  _G.dynamicHeight - (pn.clientUserData.pos * pn.height)
				EaseUI.EaseY(pn, pos+pn.height, 0.5, EaseUI.EasingEquation.ELASTIC)			
			end 
		end
		_G.numStacks = newIndex
	end
end


function fadeOut ()  
	local oldStacks = _G.numStacks
	callOffFade = false
	if fadeTask ~= nil then 
		_G.fadeTask:Cancel()
	end 
	_G.fadeTask = Task.Spawn(function()	
		if isFading  then return
			print("FADEOUT: already fading, return end")
		else
			isFading = true
			for i= SIDE_PANEL.opacity, 0, -0.1 do 
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
			Task.Spawn(function() if Object.IsValid (window) then window:Destroy() end end,INT_DESTROY_TIME + 1)
			fadeOut()
		end
		reLocate()
	end, SELFDESTROY_TIME)	
end


function getContent (window, typeCode, data_1, data_2, data_3)
	if not Environment.IsServer() then 
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
			if content == nil  then 
				warn(" No content found for typeCode: ", typeCode, " or data_1:", data_1)
				content = { title = "GENERAL EVENT" ,abs = "" , fullTxt = "No aditional data"}
			end
			window.clientUserData.fullTxt = content.fullTxt
			window.clientUserData.abs = content.abs
			if typeCode == "TIMER" then 
				local obj = data_2:GetObject()
				window.clientUserData.abs = obj.name.." : "..content.abs
			elseif typeCode == "PLAYER" then 
				window.clientUserData.abs = content.abs..data_2.." <"
				window.clientUserData.fullTxt =data_2.. window.clientUserData.fullTxt
			elseif typeCode == "RESOURCES" then 
				if data_2 ~= nil then 
					window.clientUserData.abs = content.abs
					window.clientUserData.fullTxt = window.clientUserData.fullTxt..tostring(data_2)
				end	
			elseif typeCode == "WORLD" then 
				if data_1 ~= nil then 
					if data_2 ~= nil then 
						window.clientUserData.abs =data_2.name..content.abs						
					end 
				end 
			elseif typeCode == "GAME" then 
				if data_2 ~= nil then 
					window.clientUserData.abs =content.abs..data_2.." <"
					if data_1 == "customEq" then 
						local equip = (data_3:GetObject()).name
						window.clientUserData.fullTxt =data_2.. window.clientUserData.fullTxt..equip
					end
				end
			end
			window.clientUserData.title = typeCode..":"..content.title	
			print(script.name.." >> Get content stack: ["..typeCode.."]  Title: ["..window.clientUserData.title.."]  Abstract: [".. window.clientUserData.abs.."]")
			return true			
		end
	end
end 

function writeContent (window)
	if not Environment.IsServer() then 
		local Title = window:FindDescendantByName("Title")
		local Body = window:FindDescendantByName("bodyText")	
		Title.text = window.clientUserData.title
		Body.text = window.clientUserData.abs
	end
end

function showBigContent (window, show)
	local Body = window:FindDescendantByName("bodyText")	
	if show then 
		Body.y = 60
		Body.text = window.clientUserData.fullTxt
		Body.anchor = UIPivot.TOP_CENTER
		Body.dock = UIPivot.TOP_CENTER		
	else 
		Body.y = 0
		Body.text = window.clientUserData.abs
		Body.anchor = UIPivot.BOTTOM_CENTER
		Body.dock = UIPivot.BOTTOM_CENTER
		setStackColor (window, "READ")
	end
end

return CVS_NOTIFY_API

