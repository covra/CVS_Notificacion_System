--require
local CGU_GAME_WHEEL = require( script:GetCustomProperty("CGU_GAME_WHEEL") )
--local
local localPlayer = Game.GetLocalPlayer()
local listHook, listState

------------------------------------------ FUNCTION --------------------------------

--RECEIVE SERVER STATES
function onTurn (playerIn , boolIn, endGame)
	if endGame then 
		Task.Spawn(function() if Object.IsValid (script) then  script:Destroy() end end, 5)
		listHook:Disconnect()
		listState:Disconnect()
	end 
	if playerIn == localPlayer then
		script.clientUserData.isMyTurn = boolIn
		script.clientUserData.player = localPlayer
	end
end

--HOOK MESSAGES
function onSendM (params)
	local mssg = string.lower(params.message)
	local initCh = string.find(mssg,"-")
						
	if initCh ~= nil and #mssg == 2 then 		
		sendData (mssg)	
	elseif mssg == "-show" then					
		sendData (mssg)
	elseif mmsg == "/?w" then 
		showHelp()
	end
end

--BROADCAST MESSAGES TO SERVER
function sendData (mssgOut)
	if script.clientUserData.player == localPlayer then 
		Events.BroadcastToServer("playersCalls",mssgOut)
	end 
end

function showHelp ()
	Chat.LocalMessage (CGU_GAME_WHEEL.showHelp() )
end

listHook =  Chat.sendMessageHook:Connect( onSendM )
listState =  Events.Connect("yourTurn", onTurn)
