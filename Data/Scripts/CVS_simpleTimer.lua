--require
local CVS_NOTIFY_API = require( script.parent:GetCustomProperty("CVS_NOTIFY_API") ) 
--custom
local CLIENT_ROOT = script.parent
local CRONO = CLIENT_ROOT:FindDescendantByName("Time")
--user exposed
local ISTIMER_ENABLED = CLIENT_ROOT:GetCustomProperty("isEnabledTimer")
local CALL_EVENT_NAME = CLIENT_ROOT:GetCustomProperty("timer_callEventName")
local END_EVENT_NAME = CLIENT_ROOT:GetCustomProperty("timer_endEventName")
local ARRIVAL_PERCENT = CLIENT_ROOT:GetCustomProperty("arrivalPercent")
local IS_ANIM_ENABLED = CLIENT_ROOT:GetCustomProperty("animationArrival")
local SC_ANIM = CLIENT_ROOT:GetCustomProperty("scaleAnimation")
local OBJ_ANIM = CLIENT_ROOT:GetCustomProperty("objectAnimation"):WaitForObject()
local COLOR_DANGER = CLIENT_ROOT:GetCustomProperty("colorArrival")
local propStackBoxes_end = CLIENT_ROOT:GetCustomProperty("stackBoxes_end")
local propStackBoxes_arrival = CLIENT_ROOT:GetCustomProperty("stackBoxes_arrival")
local debugPrint = CLIENT_ROOT:GetCustomProperty("debugPrint")
--anim
local ANIM_CURVE = script:GetCustomProperty("animCurve")
--local
local localPlayer = Game.GetLocalPlayer()
local origColor = CRONO:GetColor()
local timeZero = 0
local dangerEndTime = 0
local cronoEnabled = false
local isCronoReverse = false
local isRunning = false
local timeTo = 0
local isNotified = false
_G.chrono = 0
local W_ORIG, H_ORIG
------------------------------------------FUNCTIONS---------------------------

--MAIN TICK FUNCTION
function Tick ()
	if not ISTIMER_ENABLED then return end
	if not isRunning then return end 
	
	if isCronoReverse then 
		_G.chrono = timeTo - (os.clock() - timeZero)
		parse()
		if _G.chrono <= 0 then 
			endTimer(isCronoReverse)
			CRONO.text =  string.format("%02d:%02d:%02d", 0, 0, 0)
		end
	elseif not isCronoReverse then 
		_G.chrono = os.clock() - timeZero
		parse()
		if _G.chrono >= timeTo then
			endTimer(isCronoReverse)
		end
	end 	
end

--@params boolean 'false for regular chrono, true for reverse chrono'
--@params float 'time to set the chrono'
--@params string 'code to setup the chrono: "start" "stop" "reset"'
--@params player
--EVENT CALL TIMER. SETTING UP
function onCallTimer (player, codeIn, timeEndIn, isCronoReverseIn) 
	if debugPrint then print (script.name.. " >> data received on chrono: ",player.name, codeIn, timeEndIn, isCronoReverseIn) end
	CRONO:SetColor(origColor)
	timeTo = timeEndIn
	timeZero = os.clock()
	isCronoReverse = isCronoReverseIn
	if  player == localPlayer then 	
		if codeIn == "start" then
			isRunning = true
		elseif codeIn == "stop" then 
			isRunning = false
		elseif codeIn == "reset" then 
			isRunning = false
			CRONO.text =  string.format("%02d:%02d:%02d", 0, 0, 0)
			return
		end 
		if isCronoReverse then 
			dangerEndTime = (timeTo * ARRIVAL_PERCENT)/100
			if debugPrint then print(script.name.." >> New DangerTime en reverseCrono: ", dangerEndTime) end
		elseif not isCronoReverse then 
			dangerEndTime = timeTo - ((timeTo * ARRIVAL_PERCENT)/100)
			if debugPrint then print(script.name.." >> New DangerTime en Crono: ", dangerEndTime) end 
		end 
		isNotified = false
	end
end

--@params boolean 'internal enable animation'
--ICON ANIMATION
function animIcon(enableAnimation)
	if IS_ANIM_ENABLED then 
		if enableAnimation then 
			local rawValue = ANIM_CURVE:GetValue(_G.chrono)
			local value = math.tointeger(CoreMath.Round(rawValue*SC_ANIM , 0))
			OBJ_ANIM.width = W_ORIG + value
			OBJ_ANIM.height = H_ORIG + value
		end 
	end 
end 


--PARSE DATA TO SHOW THE TEXT
function parse()
    local currentTime = _G.chrono    
    currentTime = currentTime * 100
    currentTime = math.floor(currentTime)
    local milliseconds = currentTime % 100
    currentTime = currentTime-milliseconds
    currentTime = math.floor(currentTime / 100)
    local seconds = currentTime % 60
    currentTime = currentTime - seconds
    currentTime = math.floor(currentTime/60)
    local minutes = math.min(currentTime, 99)  
    if dangerEndTime > 0  then
    	if isCronoReverse then 
    		if _G.chrono <= dangerEndTime then
    			if debugPrint and not isNotified then print(script.name.." >> timer llego al dangerZone!!!") end
	    		CRONO:SetColor(COLOR_DANGER)
	    		isNotified = true
	    		animIcon(true)
	    	end 
    	elseif not isCronoReverse then 
    		if _G.chrono >= dangerEndTime then
	    		if debugPrint and not isNotified then print(script.name.." >> timer llego al dangerZone!!!") end
	    		CRONO:SetColor(COLOR_DANGER)
	    		isNotified = true
	    		animIcon(true)
    		end 
    	end     	
    end 
    CRONO.text =  string.format("%02d:%02d:%02d", minutes, seconds, milliseconds)
end

--END TIMER
function endTimer()
	isRunning = false
	if Object.IsValid (OBJ_ANIM) then 
		OBJ_ANIM.width = W_ORIG 
		OBJ_ANIM.height = H_ORIG 
	end 
	Events.BroadcastToServer(END_EVENT_NAME, localPlayer)
	sendNotification("endTimer")
end 

--@params string 'code of the notification'
--@params 
--SEND STACK NOTIFICATION TO ITS AREA
function sendNotification(typeCode, data_1)
	if debugPrint then print(script.name.." Sending stack notification >>"..typeCode.." // ", data_1) end 
	 local objID = CLIENT_ROOT:GetReference()
	 CVS_NOTIFY_API.sendNotification (typeCode,objID, data_1)
end 


-------------------------------VALIDATION------------------------------------

if CALL_EVENT_NAME == nil or CALL_EVENT_NAME == "" then 
	warn(" Call Event Name can't be empty. Set to default")
	CALL_EVENT_NAME = "timerSimple"
end 

if END_EVENT_NAME == nil or END_EVENT_NAME == "" then
	warn(" Call Event Name can't be empty. Set to default")
	END_EVENT_NAME = "endTimer"
end 

if IS_ANIM_ENABLED and (OBJ_ANIM == nil or OBJ_ANIM == "") then 
	warn (" If arrival animation is enabled, object to animate can't be empty. Will bea deactivated")
	IS_ANIM_ENABLED = false
end 

if IS_ANIM_ENABLED then 
	if SC_ANIM <= 0 or SC_ANIM == nil then 
		warn(" You have to set a scale multiplier if icon animation is Enabled. Will be set to 25")
		SC_ANIM = 25
	end 
end 

if IS_ANIM_ENABLED then 
	W_ORIG = OBJ_ANIM.width
	H_ORIG = OBJ_ANIM.height
end 

---------------------------------INIT--------------------------------
parse()
if debugPrint then print(script.name.."Events Connected: ["..CALL_EVENT_NAME.."]  ["..END_EVENT_NAME.."]") end 
Events.Connect(CALL_EVENT_NAME,onCallTimer)

