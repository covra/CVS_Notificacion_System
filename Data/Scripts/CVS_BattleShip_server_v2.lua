--require
local CGU_GAME_BATTLE = require( script:GetCustomProperty("CGU_GAME_BATTLE") )
--custom
local ROOT_BATTLE = script.parent
local ROUND_TIME = _G.battle_roundTime
local TIME_TO_SET_SHIPS = _G.battle_setTime
local CGU_RES = _G.CGU_RES
local QTY_HIT = _G.battle_HitPoints
local QTY_SINK = _G.battle_SinkPoint
local MAX_ROUNDS = _G.battle_maxRounds
local WIN_RATIO = _G.battle_winnerRatio 
local debugPrint = _G.debugPrint
--timer
local MINI_TIMER = script:GetCustomProperty("CVS_miniTimer")
--local
local TOTAL_HITS = CGU_GAME_BATTLE.getTotalHits ()
local fleetsSunk = 0
local indexRound = 0
local miniTList = nil
local miniT = nil
local gameTables = {}
local listenerBattle, listenerCalls
local _,nilTable = CGU_GAME_BATTLE.buildBoard ()

--CALL AND START GAME
function onCallGame ()
	for i = 1, 14 do 
		Chat.BroadcastMessage( CGU_GAME_BATTLE.sysMsg (i),_G.playersNoBlock)
		Task.Wait(0.2)
	end
	script.serverUserData.state = "setShips"
	for _,ply in pairs (Game.GetPlayers()) do 
		local doneBoard, board = CGU_GAME_BATTLE.buildBoard ()
		ply.serverUserData.board = board	
		ply.serverUserData.tempCash = 0
		Events.BroadcastToPlayer(ply,"battleState", ply, "setShips")
		Task.Wait(0.1)
	end 	
	Task.Spawn(function()
		Task.Wait(0.1)
		Chat.BroadcastMessage( CGU_GAME_BATTLE.sysMsg (32)..tostring(TIME_TO_SET_SHIPS).."secs. \n" )
		_G.timeTo = TIME_TO_SET_SHIPS
		miniTList = Events.Connect("miniT",onListenMIniT)
		miniT = World.SpawnAsset(MINI_TIMER)
	end)
end

--START GAME ROUNDS
function startRounds ()
	if debugPrint then print(script.name.." >> Rounds will start now") end 
	indexRound = 1
	Task.Spawn(function()
		while #gameTables > 1 and indexRound < MAX_ROUNDS do 
		--repeat 
			if debugPrint then print(script.name.." >> Round num", indexRound) end 
		    Chat.BroadcastMessage( CGU_GAME_BATTLE.sysMsg (17)..tostring(indexRound),_G.playersNoBlock)
			for _, lin in pairs (gameTables) do 
				local playerTurn = lin.ply
				Chat.BroadcastMessage( CGU_GAME_BATTLE.sysMsg (18)..lin.ply.name..CGU_GAME_BATTLE.sysMsg (19),_G.playersNoBlock)
				_G.timeTo = ROUND_TIME
				miniTList = Events.Connect("miniT",onListenMIniT)
				_G.ownerRound = playerTurn
				_G.ownerRound.serverUserData.repeatShoot = false
				endTimeShoot = true
				local indexTime = 0
				local chkTm = 0.5
				while _G.ownerRound ~= nil or not endTimeShoot do
					Task.Wait(chkTm)
					indexTime = indexTime + 1
					if indexTime >= (ROUND_TIME /chkTm) then
						_G.ownerRound = nil						
					end 
				end				
			end
			indexRound = indexRound + 1
		for _,line in pairs (gameTables) do 
			if line.hits >= TOTAL_HITS then 
				fleetsSunk = fleetsSunk + 1
				if (fleetsSunk +1) == #(Game.GetPlayers()) then indexRound = MAX_ROUNDS end 
			end 
		end 
		end 
		script.serverUserData.state = "endGame"
		Events.BroadcastToAllPlayers("battleState", ply, "endGame")
		Task.Wait()
		endGame()
	end)
end
			

--RECEIVE DATA FROM PLAYERS
function onPlayerCall (player, dataIn, dataIn2, dataIn3, dataIn4)
	if debugPrint then print(script.name.." >> onPlayerCall received from "..player.name, dataIn) end 
	if Object.IsValid (_G.ownerRound) then print("OwnerRound: ".._G.ownerRound.name) end
	if dataIn == "/auto" and  script.serverUserData.state ==  "setShips" and player == dataIn4 then 
		local localTable = CGU_GAME_BATTLE.buildAutoBoard (player.serverUserData.board, dataIn2, dataIn3)
		table.insert(gameTables, {ply = player, board = localTable,  hits = 0})
		Chat.BroadcastMessage( CGU_GAME_BATTLE.sysMsg (16), {players = player})
		checkAllPlayers()		
		
	elseif dataIn == "endB" then
		table.insert(gameTables, {ply = player, board =  player.serverUserData.board, hits = 0})
		Chat.BroadcastMessage( CGU_GAME_BATTLE.sysMsg (16), {players = player})
		checkAllPlayers()
		
	elseif script.serverUserData.state ==  "setShips" and dataIn ~= nil then
		local mY = dataIn.lt
		local mX = dataIn.num
		local codeIn = dataIn.code 
		local alignIn = dataIn.align 
		local localBoard = player.serverUserData.board
		local isOkSet, errCode	
		isOkSet, errCode, localBoard = CGU_GAME_BATTLE.setShip (mY, mX, codeIn, alignIn, localBoard)
		player.serverUserData.board = localBoard
		CGU_GAME_BATTLE.printBoard (player.serverUserData.board)
					
	elseif script.serverUserData.state ==  "game" then 
		local mY = dataIn.lt
		local mX = dataIn.num
		Chat.BroadcastMessage( CGU_GAME_BATTLE.sysMsg (20)..mY.."--"..tostring(mX),_G.playersNoBlock)
		mY = (CGU_GAME_BATTLE.convert (string.upper(mY)) )
		local isDone = checkHitResult (mY,mX)
		if _G.ownerRound.serverUserData.repeatShoot then
			_G.ownerRound = _G.ownerRound
			Chat.BroadcastMessage( _G.ownerRound.name..CGU_GAME_BATTLE.sysMsg (24),_G.playersNoBlock )
		else 			
			Chat.BroadcastMessage( _G.ownerRound.name..CGU_GAME_BATTLE.sysMsg (22),_G.playersNoBlock )
			_G.ownerRound = nil 
		end
		endTimeShoot = true
	end
end

--CHECK COMMANDS IN ROUNDS
function checkHitResult(ltIn, numIn)
	for _,line in pairs (gameTables) do 
		if line.ply == _G.ownerRound then 
		else
			local isOk, isHit, codeOut, err = CGU_GAME_BATTLE.getResult (ltIn, numIn,line.board)
			if isHit then 
				if debugPrint then print(_G.ownerRound.name.." shoot and  HIT ", isOk, isHit, codeOut, err) end 
				Chat.BroadcastMessage( CGU_GAME_BATTLE.sysMsg (21).." a "..CGU_GAME_BATTLE.getDataShip (codeOut, "name").." from "..line.ply.name,_G.playersNoBlock)
				Task.Wait(0.1)
				Chat.BroadcastMessage( _G.ownerRound.name.." will earn "..tostring(QTY_HIT).." "..CGU_RES,_G.playersNoBlock)
				CGU_GAME_BATTLE.setSimpleSlot (line.board, ltIn, numIn, NIL)
				line.hits = line.hits + 1
				_G.ownerRound:AddResource(CGU_RES,QTY_HIT)
				_G.ownerRound.serverUserData.repeatShoot = true
			elseif not isHit then
				_G.ownerRound.serverUserData.repeatShoot = false
			end
		end
	end
end


--CHECK IF ALL BOARDS ARE RECEIVED, IF TIME IS OVER COMPLETE BOARDS
function checkAllPlayers ()
	if #gameTables ==  #(Game.GetPlayers()) then 
		if debugPrint then print(script.name.." >> No more players have to send boards, game can start = ", #gameTables) end 
		_G.timeTo = nil
		if miniTList.isConnected then miniTList:Disconnect() end
		if Object.IsValid(miniT) then miniT:Destroy() end
		script.serverUserData.state = "game"
		for _,lin in pairs (gameTables) do 
			if lin.hits == TOTAL_HITS then 
				Events.BroadcastToPlayer(lin.ply,"battleState",lin.ply, "endGame")
					Task.Wait(0.1)
			else 
				Events.BroadcastToPlayer(lin.ply,"battleState",lin.ply, "game")
					Task.Wait(0.1)
			end 
		end 
		Chat.BroadcastMessage(CGU_GAME_BATTLE.sysMsg (30),_G.playersNoBlock)
		Task.Wait(5)
		startRounds()
	else 
		if script.serverUserData.state == "timeSetShipsOver" then 						
			for _, player in pairs (Game.GetPlayers()) do
				local isIn = false 
				for _,lin in pairs (gameTables) do 
					if player == lin.ply then 
						isIn = true
					end 
	 			end 
	 			if not isIn then 
	 				table.insert(gameTables, {ply = player, board = nilTable,  hits = TOTAL_HITS})
	 			end 
	 		end 	 		
	 		checkAllPlayers()
	 		Task.Wait()
		end 
	end
end

--END GAME
function endGame()
	local  LowHits =  CGU_GAME_BATTLE.getTotalHits ()
	local lowPlayerHits = nil 
	for _,lin in pairs (gameTables) do 
		if lin.hits < TOTAL_HITS then 
			Chat.BroadcastMessage(string.upper(lin.ply.name)..CGU_GAME_BATTLE.sysMsg (26)..tostring(QTY_SINK).." x"..tostring(WIN_RATIO).." "..CGU_RES,_G.playersNoBlock)
			lin.ply:AddResource(CGU_RES, QTY_SINK * WIN_RATIO)
			if lin.hits <= LowHits then	LowHits = lin.hits  lowPlayerHits = lin.ply	end 
		elseif lin.hits == TOTAL_HITS then 
			Chat.BroadcastMessage(string.upper(lin.ply.name)..CGU_GAME_BATTLE.sysMsg (25), {players = lin.ply})
		end 
	end
	if lowPlayerHits == nil then 
		Task.Wait(0.1)
		Chat.BroadcastMessage(CGU_GAME_BATTLE.sysMsg (28)..CGU_GAME_BATTLE.sysMsg (28),_G.playersNoBlock)
	else
		Task.Wait(0.1)
		Chat.BroadcastMessage(lowPlayerHits.name..CGU_GAME_BATTLE.sysMsg (27)..tostring(LowHits).." ,will earn: "..tostring(QTY_SINK).." x"..tostring(WIN_RATIO).." "..CGU_RES,_G.playersNoBlock)
		Task.Wait(0.1)
		Chat.BroadcastMessage(CGU_GAME_BATTLE.sysMsg (29),_G.playersNoBlock)
	end 
	listenerBattle:Disconnect()
	listenerCalls:Disconnect()	
    miniTList:Disconnect()
	Task.Spawn(function() if  Object.IsValid(ROOT_BATTLE) then ROOT_BATTLE:Destroy() end end, 5) 			
end 

------------------------------------------------TIMER----------------------------------------------
--TIMER WARN HERE, TIME IS OVER
function onListenMIniT (boolIn)	
	if Object.IsValid (script) then 
		if debugPrint then print(script.name.." >> Time is over!   timerResult = ", boolIn) end
		if not boolIn then 
			if script.serverUserData.state == "setShips" then 				
				_G.timeTo = nil
				if miniTList.isConnected then miniTList:Disconnect() end
				if Object.IsValid(miniT) then miniT:Destroy() end	
				 script.serverUserData.state = "timeSetShipsOver"
				 checkAllPlayers()
			end
		end 
	end
end

listenerBattle = Events.Connect("BATTLE", onCallGame)
listenerCalls = Events.ConnectForPlayer("playersCalls",onPlayerCall)