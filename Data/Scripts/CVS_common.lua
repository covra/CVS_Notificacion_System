--require
local CVS_NOTIFY_API = require( script:GetCustomProperty("CVS_NOTIFY_API") ) 
--custom
local CLIENT_ROOT = script.parent
local propPlayer_Join = CLIENT_ROOT:GetCustomProperty("player_Join")
local propPlayer_hitPoints = CLIENT_ROOT:GetCustomProperty("player_hitPoints")
local propPlayer_Leave = CLIENT_ROOT:GetCustomProperty("player_Leave")
local propPlayer_Died = CLIENT_ROOT:GetCustomProperty("player_Died")
local propPlayer_Damage = CLIENT_ROOT:GetCustomProperty("player_Damage")
local propGame_Purchase = CLIENT_ROOT:GetCustomProperty("game_Purchase")
local propGame_specialAbility = CLIENT_ROOT:GetCustomProperty("game_specialAbility")
local propGame_specialEquipment = CLIENT_ROOT:GetCustomProperty("game_specialEquipment")
local propGame_Rounds = CLIENT_ROOT:GetCustomProperty("game_Rounds")
local propWorld_Trigger = CLIENT_ROOT:GetCustomProperty("world_Trigger")
local propWorld_Custom = CLIENT_ROOT:GetCustomProperty("world_Custom")
local debugPrint = CLIENT_ROOT:GetCustomProperty("debugPrint")

function OnPlayerJoined (player)
	sendNotification("player", " JOINS")
end 

function OnPlayerLeft (player)
	sendNotification("player", " LEAVES")
end

--@params string 'code of the notification'
--@params integer 'aditional data to boxes'
--SEND STACK NOTIFICATION TO ITS AREA
function sendNotification(typeCode, data_1)
	if debugPrint then print(script.name.." Sending stack notification >>"..typeCode.." // ", data_1) end 
	 CVS_NOTIFY_API.sendNotification (typeCode, data_1)
end 

Game.playerJoinedEvent:Connect(OnPlayerJoined)
Game.playerLeftEvent:Connect(OnPlayerLeft)