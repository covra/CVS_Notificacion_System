--require
local CGU_GAME_WHEEL = require( script:GetCustomProperty("CGU_GAME_WHEEL") )
--custom
local ROOT_WHEEL = script.parent
--timer
local MINI_TIMER = script:GetCustomProperty("CVS_miniTimer")
--user exposed 
local debugPrint = _G.debugPrint
--local
local CGU_RES = _G.CGU_RES
local BASE_CASH = 1
local wheelPlayers = {}
local globalRounds = 0
local MAX_ROUNDS = _G.wheel_maxRounds
local ROUND_TIME = _G.wheel_roundTime
_G.ownerRound = nil
local rndStr = RandomStream.New()
local slotsWheel 
local currentCategory = ""
local wheelStop = nil
local isPaid = false
local indexTime = 0
local listGame, listCalls
--------------------------------------  FUNCTIONS ------------------------------------------------

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
	sortPlayers()
	slotsWheel =  CGU_GAME_WHEEL.getSlotsW ()
	script.serverUserData.state = "game"
	write(CGU_GAME_WHEEL.drawWheel())
	Task.Wait(0.1)
	Chat.BroadcastMessage( CGU_GAME_WHEEL.showHelp(),_G.playersNoBlock )
	Task.Wait(3)
	startRounds()
end

--MAIN ROUNDS GAME
function startRounds ()
	_G.WHEEL_mainTask = Task.Spawn (function()
		local written = writeAsentence()
		while script.serverUserData.state == "game" and globalRounds <= MAX_ROUNDS do
			for i=1,#wheelPlayers do 
				if Object.IsValid(wheelPlayers[i]) then 
					_G.ownerRound = wheelPlayers[i]
					_G.ratioMultiplier = 1
				end
				if debugPrint then print(script.name.." >> Next player will be: ", _G.ownerRound.name)	end
				Events.BroadcastToPlayer(_G.ownerRound,"yourTurn",_G.ownerRound,true)
				Chat.BroadcastMessage( "\n")
				isStop, wheelStop = makeWheelSpin()
				Chat.BroadcastMessage (CGU_GAME_WHEEL.sysMsg (1)..tostring(globalRounds).. "/"..tostring(MAX_ROUNDS),_G.playersNoBlock)
				showCurrentStr ()
				if Object.IsValid (_G.ownerRound) then 
					Task.Wait(0.1)
					Chat.BroadcastMessage( CGU_GAME_WHEEL.sysMsg (2)..string.upper(_G.ownerRound.name),_G.playersNoBlock)
					Task.Wait(0.1)
					Chat.BroadcastMessage( CGU_GAME_WHEEL.sysMsg (3),{players = _G.ownerRound})
					
					if Object.IsValid(wheelStop.xtra) then 
						if wheelStop.xtra == 1 then   
							Chat.BroadcastMessage(CGU_GAME_WHEEL.sysMsg (11))
							Events.BroadcastToPlayer(_G.ownerRound,"yourTurn",_G.ownerRound,false)
							Task.Wait()
							 _G.ownerRound = nil
						elseif wheelStop.xtra == 2 then 
							bankruptcy (_G.ownerRound)
							manageTempFounds (_G.ownerRound, true, "broke")
							Chat.BroadcastMessage()
							Events.BroadcastToPlayer(_G.ownerRound,"yourTurn",_G.ownerRound,false)
							Task.Wait()
							 _G.ownerRound = nil
						end
					elseif  Object.IsValid(wheelStop.prize)and  wheelStop.qty == CGU_GAME_WHEEL.getPrize (true) then 					
						Chat.BroadcastMessage( CGU_GAME_WHEEL.sysMsg (8)..tostring(wheelStop.qty),_G.playersNoBlock)
						manageTempFounds (_G.ownerRound, true, "jack")
					elseif  Object.IsValid(wheelStop.prize)and  wheelStop.qty == CGU_GAME_WHEEL.getPrize (false) then 					
						Chat.BroadcastMessage( CGU_GAME_WHEEL.sysMsg (9)..tostring(wheelStop.qty),_G.playersNoBlock)
						manageTempFounds (_G.ownerRound, true, "prize")
					else
						Task.Wait(0.1)
						Chat.BroadcastMessage("You will play with x"..tostring(wheelStop.qty),{players = _G.ownerRound})
						_G.ratioMultiplier = wheelStop.qty
					end
				end 
				Task.Wait(3)
				indexTime = 0
				local chkTm = 0.5
				local timeIsOver = false
				while _G.ownerRound ~= nil and not timeIsOver do
					Task.Wait(chkTm)
					indexTime = indexTime + 1
					if indexTime >= (ROUND_TIME /chkTm) then
						timeIsOver = true
					end
				end
				Task.Wait(2)
				if debugPrint then print(script.name..">>  new spin: ",script.serverUserData.state, _G.ownerRound, timeIsOver, indexTime, globalRounds) end 
			end
			globalRounds = globalRounds + 1
		end
		if globalRounds >= MAX_ROUNDS then 
			endGame()
		end 
	end) 
end

--END GAME
function endGame (playerIn)
	if debugPrint then print(script.name.. " >> endGame called by ", playerIn) end 
	script.serverUserData.state = "endGame"
	local isDone = payCash(playerIn)
	Chat.BroadcastMessage(">> CLOSING GAME.. ")
	for _,pl in pairs (Game.GetPlayers()) do 
		Events.BroadcastToPlayer(pl,"yourTurn",pl,nil, true)
		Task.Wait()
	end 
	listCalls:Disconnect()
	listGame:Disconnect()
	Task.Spawn(function()
		if Object.IsValid(ROOT_WHEEL) then 	ROOT_WHEEL:Destroy() end 
	end, 5)
end 

--ROULETE SPIN
function makeWheelSpin ()
	local wheelSlot 
	local maxNum = rndStr:GetInteger(slotsWheel, slotsWheel * 2)
	local timeSpinOver = false
	local isSpinning = true
	local indexSpin = 1
	local indexT = 1
	while isSpinning or not timeSpinOver do	
		Task.Wait(0.1)
		wheelSlot = CGU_GAME_WHEEL.getSwheel (indexSpin) --prize
		indexSpin = indexSpin + 1
		indexT = indexT + 1
		if indexSpin >= slotsWheel then indexSpin = 1 end		
		if indexT >= maxNum then
			timeSpinOver = true
				isSpinning = false 
		elseif indexT >= (maxNum - 7) then 
			Task.Wait(0.4)
		elseif indexT >= (maxNum - 3) then 
			Task.Wait(0.7)
		end		
		Chat.BroadcastMessage(wheelSlot.name,{players = _G.ownerRound})
	end	
	if debugPrint then print(script.name.." >> wheel end spinning: ", isSpinning, timeIsOver, " >>Slot: "..wheelSlot.name) end 
	return true, wheelSlot
end

--SHOW CURRENT SENTENCE
function showCurrentStr ()
	Chat.BroadcastMessage( "  >> "..currentCategory.." : " ,_G.playersNoBlock)
	Chat.BroadcastMessage( "------------------------------------",_G.playersNoBlock )
	Chat.BroadcastMessage( script.serverUserData.sentenceStr,_G.playersNoBlock )
end

--SHOW NEW SENTENCE
function writeAsentence (isNew)
		local frase, category = CGU_GAME_WHEEL.getSentence()
		Chat.BroadcastMessage( CGU_GAME_WHEEL.sysMsg (4))
		currentCategory = category
		script.serverUserData.hideTableStr = CGU_GAME_WHEEL.hideSentence (frase)
		script.serverUserData.sentenceStr = CGU_GAME_WHEEL.getSentenceStr (script.serverUserData.hideTableStr)
		if debugPrint then print(script.name.." >> The sentence will be: "..script.serverUserData.sentenceStr) end 
		showCurrentStr ()
		Chat.BroadcastMessage("\n",_G.playersNoBlock)
		Task.Wait(0.1)
		Chat.BroadcastMessage(CGU_GAME_WHEEL.sysMsg (12),_G.playersNoBlock)
		Task.Wait(5)
		return true
end



--CHECK LETTER IN PANEL
function checkResult (playerIn, mssgIn)
	local ltr = string.sub(mssgIn, 2,2)
	local isHit, hits, hideTable = CGU_GAME_WHEEL.checkResult (ltr, script.serverUserData.sentenceStr, script.serverUserData.hideTableStr)
	script.serverUserData.hideTableStr = hideTable
	script.serverUserData.sentenceStr = CGU_GAME_WHEEL.getSent (script.serverUserData.hideTableStr)
	showCurrentStr ()	
	if debugPrint then print(script.name.." >> "..playerIn.name.." check result: ", isHit, hits, script.serverUserData.sentenceStr) end 
	if isHit then 
		indexTime = 0
		_G.ratioMultiplier = _G.ratioMultiplier * hits		
		manageTempFounds (playerIn, false)
		local isFInishedSentence = CGU_GAME_WHEEL.checkIsFull (script.serverUserData.hideTableStr)
		if isFInishedSentence  then 
			if debugPrint then print(script.name.." >> "..playerIn.name.." finish the sentence ", isFInishedSentence) end 
			Chat.BroadcastMessage(CGU_GAME_WHEEL.sysMsg (5), {players = playerIn})
			Events.BroadcastToPlayer(_G.ownerRound,"yourTurn",_G.ownerRound,false)
			Task.Wait()
			endGame (playerIn)
			_G.ownerRound = nil
		else 
			Chat.BroadcastMessage(CGU_GAME_WHEEL.sysMsg (6), {players = playerIn})
		end		
	elseif not isHit then 		
		Events.BroadcastToPlayer(_G.ownerRound,"yourTurn",_G.ownerRound,false)
		Task.Wait()
		Chat.BroadcastMessage(CGU_GAME_WHEEL.sysMsg (13), {players = playerIn})
		Task.Wait()
		_G.ownerRound = nil 
	end		
end

--PAY FINAL CASH
function payCash(player)
	if not isPaid then
		if Object.IsValid(player) then
			player:AddResource(CGU_RES,math.tointeger( player.serverUserData.tempCash))
			Chat.BroadcastMessage(">>"..string.upper(player.name).. " WINS!!!  >>>>".. tostring(player.serverUserData.tempCash).." "..CGU_RES,_G.playersNoBlock)
		else 
			if debugPrint then print(script.name.." >> player is missing / not valid, .... New winner..->") end 
			Chat.BroadcastMessage(CGU_GAME_WHEEL.sysMsg (7),_G.playersNoBlock)
			Task.Wait(1)
			Chat.BroadcastMessage(" ...   ",_G.playersNoBlock)
			Task.Wait(1)
			Chat.BroadcastMessage(" ..   ",_G.playersNoBlock)
			Task.Wait(1)
			Chat.BroadcastMessage(" .   ",_G.playersNoBlock)
			Task.Wait(1)
			local playerList = Game.GetPlayers()
			local randSlot = math.random(1,#playerList)
			local tempWinner = playerList [randSlot]		
			tempWinner:AddResource(CGU_RES,math.tointeger( tempWinner.serverUserData.tempCash))
			Chat.BroadcastMessage(">>"..string.upper(tempWinner.name).. " WINS!!!  >>>>".. tostring(tempWinner.serverUserData.tempCash).." "..CGU_RES,_G.playersNoBlock)
		end
	end
	Task.Wait(3)
	isPaid = true
	return true
end

--MANAGE TEMPORARY CASH
function manageTempFounds (player, isXtra, data)
	if isXtra then
		if data ==  "broke" then
			player.serverUserData.tempCash = 0
		elseif data == "prize" then 
			player.serverUserData.tempCash = player.serverUserData.tempCash + CGU_GAME_WHEEL.getPrize (false)
		elseif data == "jack" then 
			player.serverUserData.tempCash = player.serverUserData.tempCash + CGU_GAME_WHEEL.getPrize (true)
		end 
	elseif not isXtra then
		player.serverUserData.tempCash = player.serverUserData.tempCash + (_G.ratioMultiplier * BASE_CASH)
	end
	if debugPrint then print(script.name.." >> "..player.name.." tempCash: "..tostring(player.serverUserData.tempCash) ) end 
end

--RECEIVE PLAYER LOCAL DATA
function onPlayerCall (playerIn, data1, data2, data3)
	if playerIn == _G.ownerRound then 
		if script.serverUserData.state == "game" then
			if data1 == "-show" then 
				Chat.BroadcastMessage( script.serverUserData.sentenceStr.."\n", {players = playerIn} )
			else 
				checkResult (playerIn, data1)
			end
		end
	end
end

--SORT PLAYERS IN A LIST
function sortPlayers()
	local ix = 1
	for _, ply in pairs (Game.GetPlayers()) do 
		ply.serverUserData.tempCash = 0
		wheelPlayers[ix] = ply			
		ix = ix + 1
	end
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
			isSentState = false
		else 
		end
	end 
end

listGame = Events.Connect("WHEEL", onCallGame)
listCalls = Events.ConnectForPlayer("playersCalls",onPlayerCall)