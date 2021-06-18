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
local propAnimationArrival = CLIENT_ROOT:GetCustomProperty("animationArrival")
local propColorArrival = CLIENT_ROOT:GetCustomProperty("colorArrival")
local propStackBoxes_end = CLIENT_ROOT:GetCustomProperty("stackBoxes_end")
local propStackBoxes_arrival = CLIENT_ROOT:GetCustomProperty("stackBoxes_arrival")
--local
local timeZero = 0
local timeZeroR = 0
local cronoEnabled = false
local isCronoReverse = false
local timeTo = 0
local timeToR = 0
local min,sec,dsec,secF
_G.timerRace = 0
_G.timerRaceR = 0
local dangerEndTime = 0
local isSetColorDanger = false


function onCallTimer (player, codeIn, timeEndIn) --REVISAR ES TO EN MODO NORMAL D EJUEGO
	
	if isCronoReverse then 
		timeTo = timeEndIn
		timeZero = os.clock()
		dangerEndTime = (timeTo * ARRIVAL_PERCENT)/100
		isSetColorDanger = false
		print(script.name.." >> New DangerTime en reverseCrono: ", dangerEndTime)
	elseif not isCronoReverse then 
		timeTo = timeEndIn
		timeZero = os.clock()
		dangerEndTime = (timeTo * ARRIVAL_PERCENT)/100
		isSetColorDanger = false
		print(script.name.." >> New DangerTime en reverseCrono: ", dangerEndTime)
	end 	
	cronoEnabled = not isEndIn	
end





function Tick ()
	if not ISTIMER_ENABLED then return end
	if isCronoReverse then 
		_G.chrono = timeTo - (os.clock() - timeZero)
		if _G.chrono <= 0 then 
			endTimer(isCronoReverse)
		end
	elseif not isCronoReverse then 
		_G.chrono = os.clock() - timeZero
		if _G.chrono >= timeTo then
			endTimer(isCronoReverse)		
		end
	end 
	_G.chrono = CoreMath.Round(_G.timerRaceR, 0)
	parse()
end

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
    --[[
    if dangerEndTime > 0  then    	
    	if _G.timerRace >= dangerEndTime and not isSetColorDanger then
    		--print(script.name.." >> timer llego al dangerZone!!!")
    		CRONO:SetColor(Color.RED)
    		isSetColorDanger = true
    	end 
    end 
    ]]--
    CRONO.text =  string.format("%02d:%02d:%02d", minutes, seconds, milliseconds)
end

function endTimer(isReverse)

end 

--@params string 'code of the notification'
--@params integer 'aditional data to boxes'
--SEND STACK NOTIFICATION TO ITS AREA
function sendNotification(typeCode, data_1)
	if debugPrint then print(script.name.." Sending stack notification >>"..typeCode.." // ", data_1) end 
	 CVS_NOTIFY_API.sendNotification (typeCode, data_1)
end 

Events.Connect(CALL_EVENT_NAME,onCallTimer)