--require
local CVS_NOTIFY_API = require( script.parent:GetCustomProperty("CVS_NOTIFY_API") ) 
--custom
local CLIENT_ROOT = script.parent
local CURVA = script:GetCustomProperty("curveAnim")
local UI_RES_ICON = CLIENT_ROOT:GetCustomProperty("resource_Icon"):WaitForObject()
local UI_NUM_RES = CLIENT_ROOT:GetCustomProperty("resource_Quantity"):WaitForObject()
local P_BAR = CLIENT_ROOT:GetCustomProperty("resource_pBar"):WaitForObject()
local BAR_MAX_NUM = UI_NUM_RES:FindChildByName("res Total")
--user exposed
local IS_CORE_RES = CLIENT_ROOT:GetCustomProperty("resource_CoreResources")
local RES_NAME = CLIENT_ROOT:GetCustomProperty("resource_Name")
local IS_CUSTOM_EVENT_RES = CLIENT_ROOT:GetCustomProperty("resource_CustomEvent")
local CUSTOM_EVENT_NAME = CLIENT_ROOT:GetCustomProperty("resource_CustomEventName")
local RATIO_SC = CLIENT_ROOT:GetCustomProperty("scale_Multiplier")
local RATIO_SPEED_SC = CLIENT_ROOT:GetCustomProperty("scale_Speed_Multiplier")
local debugPrint = CLIENT_ROOT:GetCustomProperty("debugPrint")
local MAX_RES_BAR = CLIENT_ROOT:GetCustomProperty("Initial_ProgressBar")
local FULLBAR_DOUBLE = CLIENT_ROOT:GetCustomProperty("fullBar_Double")
local FULLBAR_ADDCUSTOM = CLIENT_ROOT:GetCustomProperty("fullBar_addCustom")
local CUSTOM_QTY = CLIENT_ROOT:GetCustomProperty("customNewQuantity")
--user exposed notifications
local STACK_GROW = CLIENT_ROOT:GetCustomProperty("stackBoxes_res1")
local STACK_FULL = CLIENT_ROOT:GetCustomProperty("stackBoxes_fullBar")
local STACK_ISCUSTOM_QTY = CLIENT_ROOT:GetCustomProperty("stackBoxes_customQty")
local STACK_CUSTOM_QTY_1 = CLIENT_ROOT:GetCustomProperty("stackBoxes_Qty_1")
local STACK_CUSTOM_QTY_2 = CLIENT_ROOT:GetCustomProperty("stackBoxes_Qty_2")
local STACK_CUSTOM_QTY_3 = CLIENT_ROOT:GetCustomProperty("stackBoxes_Qty_3")
local isSent_1 = false
local isSent_2 = false
local isSent_3 = false
--local 
local localPlayer = Game.GetLocalPlayer()
local barValue = 0
local currentGrow = 0
local objList = nil
local doAnim = false
local OFFSET = 0.5
-----------------------------------FUNCTIONS---------------------------------

--@params boolean 'is start from fresh or when full progress bar'
--@params integer 'to continue from it was'
--SETTING UP PROGRESS BAR
function settingBar (isStartingSetUp, currentValue)
	if Object.IsValid (BAR_MAX_NUM) then 
		if isStartingSetUp then 			
		elseif not isStartingSetUp then
			--MAX_RES_BAR = currentValue + currentGrow
			MAX_RES_BAR = MAX_RES_BAR + currentGrow
			if Object.IsValid (P_BAR) then 
				P_BAR.progress =  barValue / MAX_RES_BAR
			end
		end 
		BAR_MAX_NUM.text = "/"..tostring(MAX_RES_BAR) 
	end 
end 


--LAUNCH ALL ANIMATIONS AT THE SAME TIME
function doAnim ()
	if not isAnim then 		
		Task.Spawn(function() scaleAnim(UI_RES_ICON) end)
		Task.Spawn(function() scaleAnim(UI_NUM_RES) end)
	end 
end 

--@params 'UIImage' OR/AND  'UIText'
--ANIMATION
function scaleAnim (UI_Object)
	if Object.IsValid (UI_Object) then 
		isAnim = true
		local minCURVA = CURVA.minValue
		local index = 0
		if UI_Object.type == "UIImage" then 
			index = 0
			if UI_Object.clientUserData.wOrig == nil then 		
				UI_Object.clientUserData.wOrig = UI_Object.width		
				UI_Object.clientUserData.hOrig = UI_Object.height
			end	
			repeat
			 	local rawValue = CURVA:GetValue(index + OFFSET)
			 	local value = math.tointeger(CoreMath.Round(rawValue* RATIO_SC, 0))
				index = index + RATIO_SPEED_SC
				Task.Wait(RATIO_SPEED_SC)		
				UI_Object.width = value + UI_Object.clientUserData.wOrig
				UI_Object.height = value + UI_Object.clientUserData.hOrig
			until rawValue <= (minCURVA+OFFSET)
		elseif UI_Object.type == "UIText" then
			index = 0
			if UI_Object.clientUserData.szOrig == nil then 		
				UI_Object.clientUserData.szOrig = UI_Object.fontSize		
			end	
			repeat
			 	local rawValue = CURVA:GetValue(index + OFFSET)
			 	local value = math.tointeger(CoreMath.Round(rawValue* RATIO_SC, 0))
				index = index + RATIO_SPEED_SC
				Task.Wait(RATIO_SPEED_SC)		
				UI_Object.fontSize = value + UI_Object.clientUserData.szOrig
			until rawValue <= (minCURVA+OFFSET)
		end 
		isAnim = false
		if debugPrint then print(script.name..">> ", UI_Object, " DONE") end 
	end 
end 

--@params player
--@params string 'resource name'
--@params integer 'quantity of that resource'
--EVENT LISTENER: RESOURCE ASSOCIATED CHANGES
function onResChange (player, resName, resQty)
	if player == localPlayer then 
		if resName == RES_NAME then			
			if Object.IsValid (UI_NUM_RES) then 
				UI_NUM_RES.text = tostring(resQty)
				barValue = resQty
				doAnim()
				addToBar()
			end 
		end 
	end 
end

--@params player
--@params integer
--CUSTOM EVENT. ADD NEW VALUE TO RESOURCE. Values are stored in [player.clientUserData.qtyResource]
function onCallEvent (player, newValue)
	if player == localPlayer then 
		if Object.IsValid (UI_NUM_RES) then 
			if player.clientUserData.qtyResource == nil then player.clientUserData.qtyResource = 0 end
			player.clientUserData.qtyResource = player.clientUserData.qtyResource + newValue
			doAnim()
			barValue = player.clientUserData.qtyResource
			UI_NUM_RES.text = tostring(player.clientUserData.qtyResource)
			addToBar()
		end 
	end 
end

--PROGRESS BAR LOGICS
function addToBar ()
	if Object.IsValid (P_BAR) then 
		P_BAR.progress = barValue / MAX_RES_BAR
	end 
	if STACK_GROW then 
		sendNotification("grow")
	end
	if STACK_ISCUSTOM_QTY then
		if barValue >= STACK_CUSTOM_QTY_1 and not isSent_1 then 
			isSent_1 = true 
			sendNotification("custom", STACK_CUSTOM_QTY_1)
		end 
		if barValue >= STACK_CUSTOM_QTY_2 and not isSent_2 then 
			isSent_2 = true 
			sendNotification("custom", STACK_CUSTOM_QTY_2)
		end 
		if barValue >= STACK_CUSTOM_QTY_3 and not isSent_3 then 
			isSent_3 = true 
			sendNotification("custom", STACK_CUSTOM_QTY_3)
		end 
	end 
	if barValue >= MAX_RES_BAR then 
		settingBar(false, barValue)
		if STACK_FULL then 
			sendNotification("max")
		end 
	end 	
end 

--@params string 'code of the notification'
--@params 
--SEND STACK NOTIFICATION TO ITS AREA
function sendNotification(typeCode, data_1)
	if debugPrint then print(script.name.." Sending stack notification >>"..typeCode.." // ", data_1) end 
	local objID = CLIENT_ROOT:GetReference()
	CVS_NOTIFY_API.sendNotification (typeCode, objID, data_1)
end 
-------------------------------- VALIDATION -----------------------------------

if IS_CORE_RES then 
	localPlayer.resourceChangedEvent:Connect( onResChange )
end 

if IS_CORE_RES and IS_CUSTOM_EVENT_RES then 
	localPlayer.resourceChangedEvent:Connect( onResChange )
	warn(" You have to choose one single method to call the notification / animation. Core Resources will be the option")
end 

if not IS_CORE_RES and IS_CUSTOM_EVENT_RES then 
	if CUSTOM_EVENT_NAME ~= nil then 
		local customName = CUSTOM_EVENT_NAME	
		objList = Events.Connect(customName, onCallEvent)
		script.destroyEvent:Connect( function (obj)
			objList:Destroy()
			end)
		if debugPrint then print(script.name.." >> Event ["..customName.."] connected for ", CLIENT_ROOT) end
	else 
		warn(" You have to type a custom EVENT name to be called. Core Resources will be the option")
	end
end 

if FULLBAR_ADDCUSTOM then 
	if CUSTOM_QTY ~= nil and CUSTOM_QTY >0 then 
	else
		CUSTOM_QTY = 50
		warn(" You have to set a quantity in 'customNewQuantity' and this has to be > 0. Set to default 50")
	end 
	currentGrow = CUSTOM_QTY
elseif FULLBAR_DOUBLE then 
	currentGrow = MAX_RES_BAR
end 

if STACK_ISCUSTOM_QTY then
	local atLeastOne = false
	if (STACK_CUSTOM_QTY_1 ~= nil and STACK_CUSTOM_QTY_1 >0) then 
		atLeastOne = true
	end 
	if (STACK_CUSTOM_QTY_2 ~= nil and STACK_CUSTOM_QTY_2 >0) then 
		atLeastOne = true
	end 
	if (STACK_CUSTOM_QTY_3 ~= nil and STACK_CUSTOM_QTY_3 >0) then 
		atLeastOne = true
	end 
	if atLeastOne then return  
	else
		STACK_CUSTOM_QTY_1 = 50
		warn(" You have to set a quantity , at least in one 'stackBoxes_Qty_#' and this has to be > 0. Set to default 50")
	end 
end

settingBar(true)