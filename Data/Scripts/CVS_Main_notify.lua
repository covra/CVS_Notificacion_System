--require
local CVS_NOTIFY_API = require( script:GetCustomProperty("CVS_NOTIFY_API") ) 
--custom
local ROOT = script.parent
--user exposed
local PLAYER_JOIN = ROOT:GetCustomProperty("player_Join")
local PLAYER_LEAVE = ROOT:GetCustomProperty("player_Leave")
local PLAYER_DIED = ROOT:GetCustomProperty("player_Died")
local GAME_SP_EQ = ROOT:GetCustomProperty("game_specialEquipment")
local WORLD_CUSTOM = ROOT:GetCustomProperty("world_Custom")
local WORLD_NAME_CUSTOM = ROOT:GetCustomProperty("world_NameCustom")
local PLAYER_HP = ROOT:GetCustomProperty("player_HP")
local PLAYER_CUSTOM_HP = ROOT:GetCustomProperty("player_customHP")


local debugPrint = true
----------------------------------FUNCTIONS------------------------------

function OnPlayerJoined (player)
	player.serverUserData.isSentD = false
	sendNotification("player", "join", player.name)
	player.diedEvent:Connect( function(player)
			sendNotification("player", "die", player.name)
		end )
	player.damagedEvent:Connect( function(player, damage )
			if player.hitPoints <= PLAYER_CUSTOM_HP and not player.serverUserData.isSent then 
				player.serverUserData.isSentD = true
				sendNotification("player", "hpLow", player.name)
			else 
				player.serverUserData.isSentD = false
			end
		end )

end

function OnPlayerLeft (player)
	sendNotification("player", "leaves", player.name)
end

function onEquip (eq, player)
	sendNotification("game", "customEq", player.name)
end


--@params string 'code of the notification'
--@params string 'aditional data to boxes'
--@params string 'aditional data to boxes'
--CUSTOM EVENT
function onCustomEvent (typeCode, data_1, data_2)
	print(script.name.." >> Received broadcasted data: ", typeCode, data_1, data_2)
	if type(typeCode) == "string" then 
		sendNotification(typeCode, data_1, data_2)
	end
end

--@params string 'code of the notification'
--@params string 'aditional data to boxes'
--SEND STACK NOTIFICATION TO ITS AREA
function sendNotification(typeCode, data_1, data_2)
	if debugPrint then print(script.name.." Sending to  API >>"..typeCode.." // ", data_1, data_2) end 
	Events.BroadcastToAllPlayers("notifY",typeCode, data_1, data_2)
end 


----------------------------------------VALIDATION-------------------------------
if PLAYER_JOIN then 
	Game.playerJoinedEvent:Connect(OnPlayerJoined)
end

if PLAYER_LEAVE then 
	Game.playerLeftEvent:Connect(OnPlayerLeft)
end

if PLAYER_HP then
	if PLAYER_CUSTOM_HP == nil or PLAYER_CUSTOM_HP <= 0 then 
		warn(" If player_HP is enabled, custom player Hit Points must be > 0. Set to 20")
		PLAYER_CUSTOM_HP = 20
	end
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
	local tableEvents = CVS_NOTIFY_API.getCustomEvents()
	for _, eventName in pairs (tableEvents) do 
		if eventName == nil or eventName == "" then
			warn(" If 'world_Custom' event is enabled, you should have to set a name for that event. If empty, won't work") 
		else 
			Events.Connect(eventName,onCustomEvent)
		end
	end
end