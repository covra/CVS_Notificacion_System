--require
local CGU_GAME_HANGMAN = require( script:GetCustomProperty("CGU_GAME_HANGMAN") )
--custom
local ROOT_HANGMAN = script.parent
--timer
local MINI_TIMER = script:GetCustomProperty("CVS_miniTimer")
--user exposed
local debugPrint = _G.debugPrint
--local
local CGU_RES = _G.CGU_RES
local PRIZE_HANG =_G.hang_prize
local BASE_CASH = 1
local hangmanPlayers = {}
local TIME_GAME = _G.hang_timeGame
local winnerHits = 0
local plysDone = 0
--------------------------------- FUNCTIONS ---------------------------------------------- 

--WRITE A TEXT TABLE
function write (tableIn, params)
	local lines = #tableIn
	for _,lin in pairs (tableIn) do 
		Chat.BroadcastMessage(lin, params)
		Task.Wait(0.1)
	end
	return true
end

--MAIN SERVER CALLS THIS GAME HERE
function onCallGame ()
	if debugPrint then print(script.name.." >> game called, starting Logics") end 
	if Object.IsValid (script) then 
		script.serverUserData.state = "game"
		write(CGU_GAME_HANGMAN.drawHangman())
		Task.Wait(0.1)
		Chat.BroadcastMessage( CGU_GAME_HANGMAN.showHelp(), _G.playersNoBlock)
		sortPlayers()
		for _,ply in pairs (hangmanPlayers) do 
			Events.BroadcastToPlayer(ply,"hangState", ply,"game")
			Task.Wait(0.1)
		end 
		Task.Wait(3)
		_G.timeTo = TIME_GAME
		miniTList = Events.Connect("miniT",onListenMIniT)
		miniT = World.SpawnAsset(MINI_TIMER)
		if debugPrint then print(script.name.." >> timer will be spawn. Value = ", _G.timeTo) end
	end 
end

--SORT PLAYERS IN A LIST
function sortPlayers()
	local ix = 1
	for _, ply in pairs (Game.GetPlayers()) do 
		ply.serverUserData.tempCash = 0
		hangmanPlayers[ix] = ply			
		ix = ix + 1
	end
end

--RECEIVE PLAYER LOCAL DATA
function onPlayerCall (playerIn, data1, data2, data3)
	if Object.IsValid(script) then
		if playerIn == data1 then
			if data2 == false then
				script.serverUserData.winner = playerIn 
				endGame(playerIn)
			elseif data2 == true then									
				if data3 > winnerHits then
					winnerHits = data3 
					script.serverUserData.winner = playerIn
				end 
			end 
		end 
		if Object.IsValid(script) then
			if debugPrint then  print(script.name.." >> onPlayerCall: player/player  isTimeOver  hits  winner > ", playerIn, data1, data2, data3,script.serverUserData.winner) end  
		end 
	end 
end

--PAY PRIZE
function payCash (playerIn)
	if debugPrint then print(script.name.." >> paying prize to "..playerIn.name.." >> ", PRIZE_HANG) end 
	playerIn:AddResource(CGU_RES, PRIZE_HANG)
	Chat.BroadcastMessage(CGU_GAME_HANGMAN.sysMsg (17)..string.upper(playerIn.name).."!!!",_G.playersNoBlock )
	Task.Wait(0.1)
	Chat.BroadcastMessage(CGU_GAME_HANGMAN.sysMsg (18)..tostring(PRIZE_HANG).." "..CGU_RES,_G.playersNoBlock)
	Task.Wait(0.1)
	Chat.BroadcastMessage(">> CLOSING GAME.. ",_G.playersNoBlock)
	Task.Wait(5)
	return true 
end 


--END GAME
function endGame (playerIn)
	if playerIn then
		if debugPrint then print(script.name.. " >> endGame called by ", playerIn) end 
		script.serverUserData.state = "endGame"
		local isDone = payCash(playerIn)		
	else 
		if  script.serverUserData.winner == nil then 
			Chat.BroadcastMessage(CGU_GAME_HANGMAN.sysMsg (19),_G.playersNoBlock )
			Task.Wait(0.1)
		else 
			local isDone = payCash(script.serverUserData.winner)			
		end 
	end 
	_G.timeTo = nil
	if miniTList.isConnected then miniTList:Disconnect() end
	if Object.IsValid(miniT) then miniT:Destroy() end
	listCalls:Disconnect()
	listGame:Disconnect()
	Task.Spawn(function() if Object.IsValid (ROOT_HANGMAN) then ROOT_HANGMAN:Destroy() end 
		end, 8)
end 

------------------------------------------------TIMER----------------------------------------------
--TIMER WARN HERE, TIME IS OVER
function onListenMIniT (boolIn)
	if debugPrint then print(script.name.." >> Time is over!   timerResult = ", boolIn) end
	if not boolIn and Object.IsValid (script) then 
		if script.serverUserData.state == "game" then 
			_G.timeTo = nil
			if miniTList.isConnected then miniTList:Disconnect() end
			if Object.IsValid(miniT) then miniT:Destroy() end
			script.serverUserData.state = "endGame"
			for _,ply in pairs (hangmanPlayers) do 
				Events.BroadcastToPlayer(ply,"hangState", ply,"endGame")
				Task.Wait(0.1)
			end 
			endGame()
		else 
		end
	end 
end

listGame =  Events.Connect("HANGMAN", onCallGame)
listCalls = Events.ConnectForPlayer("playersCalls",onPlayerCall)