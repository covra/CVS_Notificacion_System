--require
local CVS_NOTIFY_API = require( script:GetCustomProperty("CVS_NOTIFY_API") ) 
--custom
local CLIENT_ROOT = script.parent
_G.stacks = 0
--user exposed
--local PLAYER_JOIN = CLIENT_ROOT:GetCustomProperty("player_Join")
local propPlayer_hitPoints = CLIENT_ROOT:GetCustomProperty("player_hitPoints")
--local PLAYER_LEAVE = CLIENT_ROOT:GetCustomProperty("player_Leave")
--local PLAYER_DIED = CLIENT_ROOT:GetCustomProperty("player_Died")
local propPlayer_Damage = CLIENT_ROOT:GetCustomProperty("player_Damage")
local propGame_Purchase = CLIENT_ROOT:GetCustomProperty("game_Purchase")
local propGame_specialAbility = CLIENT_ROOT:GetCustomProperty("game_specialAbility")
--local GAME_SP_EQ = CLIENT_ROOT:GetCustomProperty("game_specialEquipment")
local propGame_Rounds = CLIENT_ROOT:GetCustomProperty("game_Rounds")

--local propWorld_Custom = CLIENT_ROOT:GetCustomProperty("world_Custom")
_G.FADEOUT_TIME = CLIENT_ROOT.parent:GetCustomProperty("fadeOut_Time")
local FADEOUT_ISENABLED = CLIENT_ROOT.parent:GetCustomProperty("fadeOut_isEnabled")
_G.SELFDESTROY_TIME = CLIENT_ROOT.parent:GetCustomProperty("selfDestroy_time")
local debugPrint = CLIENT_ROOT.parent:GetCustomProperty("debugPrint")

local localPlayer = Game.GetLocalPlayer()


----------------------------------FUNCTIONS------------------------------

--@params string 'code of the notification'
--@params integer 'aditional data to boxes'
--SEND STACK NOTIFICATION TO ITS AREA
function sendNotification(typeCode, data_1, data_2, data_3)
	if debugPrint then print(script.name .."recibiendo datos de server: ",typeCode, data_1, data_2, data_3) end
	if debugPrint then print(script.name.." Sending to API>>"..typeCode.." // ", data_1, data_2, data_3) end 
	CVS_NOTIFY_API.sendNotification (typeCode, data_1, data_2, data_3)
end 

----------------------------------------VALIDATION-------------------------------


if FADEOUT_ISENABLED then 
	if _G.FADEOUT_TIME <= 0 or _G.FADEOUT_TIME == nil then 
		warn(" If FadeOut is enabled, FadeOut time has to be > 0. Set to default = 5")
	end 
end


Events.Connect("notifY", sendNotification)

