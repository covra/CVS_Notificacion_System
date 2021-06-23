--require
local CGU_GAME_TRIVIA = require( script:GetCustomProperty("CGU_GAME_TRIVIA") )
--custom
local ROOT_TRIVIA = script.parent
--timer
local MINI_TIMER = script:GetCustomProperty("CVS_miniTimer")
--user exposed
local debugPrint = _G.debugPrint
--local
local CGU_RES = _G.CGU_RES
local TIME_GAME = _G.trivia_timeGame
local TriviaPlayers = {}
local winnerAns = 0
local PRIZE = _G.trivia_prizeM
local plCallsList, callList
--------------------------------- FUNCTIONS ---------------------------------------------- 

--WRITE A TEXT TABLE
function write (tableIn, params)
	local lines = #tableIn
	for _,lin in pairs (tableIn) do 
		Chat.BroadcastMessage(lin, _G.playersNoBlock)
		Task.Wait(0.1)
	end
	return true
end

--MAIN SERVER CALLS THIS GAME HERE
function onCallGame ()
	if debugPrint then print(script.name.." >> game called, starting Logics") end 
	script.serverUserData.state = "game"
	write(CGU_GAME_TRIVIA.drawTrivia())
	Task.Wait(0.1)
	Chat.BroadcastMessage( CGU_GAME_TRIVIA.showHelp(),_G.playersNoBlock )
	sortPlayers()
	Chat.BroadcastMessage( CGU_GAME_TRIVIA.sysMsg (1),_G.playersNoBlock )
	for _,ply in pairs (TriviaPlayers) do 
		Events.BroadcastToPlayer(ply,"TriviaState", ply,"game")
		Task.Wait(0.1)
	end 
	Task.Wait(3)
	_G.timeTo = TIME_GAME
	miniTList = Events.Connect("miniT",onListenMIniT)
	miniT = World.SpawnAsset(MINI_TIMER)
	if debugPrint then print(script.name.." >> timer will be spawn. Value = ", _G.timeTo) end
end


--SORT PLAYERS IN A LIST
function sortPlayers()
	local ix = 1
	for _, ply in pairs (Game.GetPlayers()) do 
		ply.serverUserData.tempCash = 0
		TriviaPlayers[ix] = ply			
		ix = ix + 1
	end
end

--RECEIVE PLAYER LOCAL DATA
function onPlayerCall (playerIn, data1, data2, data3)
	if Object.IsValid(playerIn) then 
		if playerIn == data1 then
			if data2 == nil then data2 = 0 end 
			Chat.BroadcastMessage(CGU_GAME_TRIVIA.sysMsg (2)..playerIn.name.."("..tostring(data2)..")",_G.playersNoBlock)
			Task.Wait(0.1)
			if debugPrint then print(script.name.. " >> data received on server from "..playerIn.name.." >> ", data1, data2, data3) end 
			if type(data2) == "number" and script.serverUserData.state == "endGame" then 
				playerIn.serverUserData.ansOk = data2
				payCash(playerIn, data2)
				if data2 > winnerAns then 
					if debugPrint then print(script.name.." >> New winner: "..playerIn.name.. " with: ", data2) end
					script.serverUserData.winner = playerIn
				end 
			end 
		end
	end 
end

--PAY CASH POINTS
function payCash (player, qty)
	if Object.IsValid(player) then 
		player:AddResource(CGU_RES,qty)
	end 
end 

--END GAME
function endGame ()	
	local winner = script.serverUserData.winner 
	if winner ~= nil then
		local answersOk = winner.serverUserData.ansOk
		if debugPrint then print(script.name.." >> endGame called. Winner: ",winner, answersOk) end 
		payCash(winner, answersOk * PRIZE)
		Chat.BroadcastMessage(string.upper(winner.name)..CGU_GAME_TRIVIA.sysMsg (3),_G.playersNoBlock)
		Task.Wait(0.1)
	end 
	Chat.BroadcastMessage("CLOSING GAME..")
	callList:Disconnect()
	plCallsList:Disconnect()
	Task.Spawn(function() if Object.IsValid (ROOT_TRIVIA) then  ROOT_TRIVIA:Destroy() end end, 5)
end

------------------------------------------------TIMER----------------------------------------------
--TIMER WARN HERE, TIME IS OVER
function onListenMIniT (boolIn)
	if debugPrint then print(script.name.." >> Time is over!   timerResult = ", boolIn) end
	if not boolIn then 
		if script.serverUserData.state == "game" then 
			_G.timeTo = nil
			if miniTList.isConnected then miniTList:Disconnect() end
			if Object.IsValid(miniT) then miniT:Destroy() end
			script.serverUserData.state = "endGame"
			for _,ply in pairs (TriviaPlayers) do 
				Events.BroadcastToPlayer(ply,"TriviaState", ply,"endGame")
				Task.Wait(0.1)
			end 
			Chat.BroadcastMessage(CGU_GAME_TRIVIA.sysMsg (4),_G.playersNoBlock)	
			for i =4, 1, -1 do 
				Task.Spawn(function()Chat.BroadcastMessage(tostring(i).."...",_G.playersNoBlock) end, 5-i)
			end 
			Task.Spawn(function() endGame() end, 5)
		else 
		end
	end 
end

callList = Events.Connect("TRIVIA", onCallGame)
plCallsList = Events.ConnectForPlayer("playersCalls",onPlayerCall)