--require
local CVS_NOTIFY_API = require( script:GetCustomProperty("CVS_NOTIFY_API") ) 
--custom
local ROOT = script.parent
--user exposed
local PLAYER_JOIN = ROOT:GetCustomProperty("player_Join")
local PLAYER_LEAVE = ROOT:GetCustomProperty("player_Leave")
local PLAYER_DIED = ROOT:GetCustomProperty("player_Died")
local GAME_SP_EQ = ROOT:GetCustomProperty("game_specialEquipment")
local WORLD_CUSTOM = script:GetCustomProperty("world_Custom")
local WORLD_NAME_CUSTOM = script:GetCustomProperty("world_NameCustom")


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
--@params string 'aditional data to boxes'
--@params string 'aditional data to boxes'
--CUSTOM EVENT
function onCustomEvent (typeCode, data_1, data_2)
	if type(typeCode) == "String" then 
		sendNotification(typeCode, data_1, data_2)
	end
end

--@params string 'code of the notification'
--@params string 'aditional data to boxes'
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

if WORLD_CUSTOM then 
	if WORLD_NAME_CUSTOM == nil or WORLD_NAME_CUSTOM == "" then
		warn(" If 'world_Custom' event is enabled, you should have to set a name for that event. If empty, won't work") 
	else 
		Events.Connect(WORLD_NAME_CUSTOM,onCustomEvent)
	end
end