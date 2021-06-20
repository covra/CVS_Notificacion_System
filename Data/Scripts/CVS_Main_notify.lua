--require
local CVS_NOTIFY_API = require( script:GetCustomProperty("CVS_NOTIFY_API") ) 
--custom
local ROOT = script.parent
--user exposed
local PLAYER_JOIN = ROOT:GetCustomProperty("player_Join")
local PLAYER_LEAVE = ROOT:GetCustomProperty("player_Leave")
local PLAYER_DIED = ROOT:GetCustomProperty("player_Died")
local GAME_SP_EQ = ROOT:GetCustomProperty("game_specialEquipment")


local debugPrint = true
----------------------------------FUNCTIONS------------------------------

function OnPlayerJoined (player)
	sendNotification("player", "join", player.name)
	player.diedEvent:Connect( function()
			sendNotification("player", "die", player.name)
		end )
end

function OnPlayerLeft (player)
	sendNotification("player", "leaves", player.name)
end

function onEquip (eq, player)
	sendNotification("game", "eq", player.name)
end

--@params string 'code of the notification'
--@params integer 'aditional data to boxes'
--SEND STACK NOTIFICATION TO ITS AREA
function sendNotification(typeCode, data_1, data_2)
	if debugPrint then print(script.name.." Sending stack notification >>"..typeCode.." // ", data_1, data_2) end 
	Events.BroadcastToAllPlayers("notifY",typeCode, data_1, data_2)
end 


----------------------------------------VALIDATION-------------------------------
if PLAYER_JOIN then 
	Game.playerJoinedEvent:Connect(OnPlayerJoined)
end

if PLAYER_LEAVE then 
	Game.playerLeftEvent:Connect(OnPlayerLeft)
end

if GAME_SP_EQ then 
	local SPECIAL_EQ = CVS_NOTIFY_API.getSpecialEquips()
	for _,sEq in pairs (SPECIAL_EQ) do 
		local tableEq = World.FindObjectsByName(sEq)
		for _,eq in pairs (tableEq) do 
			if Object.IsValid (eq) then 
				print(script.name.." >> Special Equipments Found: ",eq, eq.name)
			local listEq = eq.equippedEvent:Connect( onEquip )
			eq.unequippedEvent:Connect( function()  listEq:Disconnect() end )
			end
		end
	end 
end