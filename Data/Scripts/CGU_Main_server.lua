--require
local API_CONTENT_CGU = require( script:GetCustomProperty("API_CONTENT_CGU") )
--custom
local ROOT = script.parent
--Assets
local BATTLE_GAME = script:GetCustomProperty("CGU_BattleShip")
local WHEEL_GAME = script:GetCustomProperty("CGU_WheelOfFortune")
local HANGMAN_GAME = script:GetCustomProperty("CGU_TheHangman")
local TRIVIA_GAME = script:GetCustomProperty("CGU_Trivia")
--user exposed
local debugPrint = ROOT:GetCustomProperty("debugPrint")
_G.debugPrint = debugPrint
local ONLY_END_ROUND = ROOT:GetCustomProperty("onlyWhenRoundEnds")
local ACTIVATE_BY_EVENT = ROOT:GetCustomProperty("activateByEvent")
local EVENT_NAME = ROOT:GetCustomProperty("eventName")
local IS_USING_CORE_STORAGE = ROOT:GetCustomProperty("savePlayerData")
local CGU_RES = ROOT:GetCustomProperty("customResourceName")
_G.CGU_RES = CGU_RES
local QTY_JOIN = ROOT:GetCustomProperty("numResWhenJoin")
local TITLES_ENABLED = ROOT:GetCustomProperty("useChatTitles")
local VOTE_NEXT = ROOT:GetCustomProperty("isGameVoted")
local TIME_VOTE = ROOT:GetCustomProperty("timeToVote")
_G.gamesLoaded = {}
local LOAD_SAPIENS = ROOT:GetCustomProperty("loadSapiensPills")
if LOAD_SAPIENS then 
	CGU_GAME_PILLS = require( ROOT:GetCustomProperty("CGU_GAME_PILLS") )	
	table.insert(_G.gamesLoaded, "PILLS")
end
local LOAD_HANGMAN = ROOT:GetCustomProperty("loadHangmanGame")
if LOAD_HANGMAN then 
	CGU_GAME_HANGMAN = require( ROOT:GetCustomProperty("CGU_GAME_HANGMAN") )
	table.insert(_G.gamesLoaded, "HANGMAN")
end
local LOAD_WHEEL = ROOT:GetCustomProperty("loadWheelOfFortune")
if LOAD_WHEEL then 
	CGU_GAME_WHEEL = require( ROOT:GetCustomProperty("CGU_GAME_WHEEL") )
	table.insert(_G.gamesLoaded, "WHEEL")
end
local LOAD_TRIVIA = ROOT:GetCustomProperty("loadTrivia")
if LOAD_TRIVIA then 
	CGU_GAME_TRIVIA = require( ROOT:GetCustomProperty("CGU_GAME_TRIVIA") )
	table.insert(_G.gamesLoaded, "TRIVIA")
end
local LOAD_BATTLE = require( ROOT:GetCustomProperty("CGU_GAME_BATTLE") )
if LOAD_BATTLE then 
	CGU_GAME_BATTLE = require( ROOT:GetCustomProperty("CGU_GAME_BATTLE") )
	table.insert(_G.gamesLoaded, "BATTLE")
end
_G.battle_roundTime = ROOT:GetCustomProperty("battleShip_roundTime")
_G.battle_setTime = ROOT:GetCustomProperty("battleShip_setTime")
_G.battle_HitPoints = ROOT:GetCustomProperty("battleShip_HitPoints")
_G.battle_SinkPoint = ROOT:GetCustomProperty("battleShip_SinkPoints")
_G.battle_maxRounds = ROOT:GetCustomProperty("battleShip_numMaxRounds")
_G.battle_winnerRatio = ROOT:GetCustomProperty("battleShip_ratioWinner")
_G.wheel_maxRounds = ROOT:GetCustomProperty("wheel_maxRounds")
_G.wheel_roundTime = ROOT:GetCustomProperty("wheel_roundTime")
_G.hang_timeGame = ROOT:GetCustomProperty("hang_timeGame")
_G.hang_prize = ROOT:GetCustomProperty("hang_prize")
_G.trivia_timeGame = ROOT:GetCustomProperty("trivia_timeGame")
_G.trivia_prizeM = ROOT:GetCustomProperty("trivia_prizeM")
--local
local TIME_TO_STORAGE = 5
local MINI_TIMER = script:GetCustomProperty("CVS_miniTimer")
local voteList = nil
local miniTList = nil
local miniT = nil
_G.isVoting = false
_G.isGameActive = false
_G.arrayPlys = {}
local	resultVote = {
		[1]={code= 0, votes= 0},
		[2]={code= 0, votes= 0},
		[3]={code= 0, votes= 0},
		[4]={code= 0, votes= 0},
		}
script.serverUserData.winnerOpt = {code = "",votes = 0}
---------------------------------- FUNCTIONS ----------------------------------------------

function startVotedGame ()
	_G.isGameActive = true
	Events.BroadcastToAllPlayers("setState", 0, "gameAc", true)
	Task.Wait(0.2)	
	Events.BroadcastToAllPlayers("setState", 0, "vote", false)
	Task.Wait()	
	local nameOfGame =  API_CONTENT_CGU.getoNaGame (script.serverUserData.winnerOpt.code)	
	print(script.name.." >> voted game: ", script.serverUserData.winnerOpt.code, script.serverUserData.winnerOpt.votes)
	Chat.BroadcastMessage(API_CONTENT_CGU.vote (6)..nameOfGame.. " with "..tostring( script.serverUserData.winnerOpt.votes).. " votes",_G.playersNoBlock)
	local codeStr
	buildVoteT(false)	
	local codeGame = script.serverUserData.winnerOpt.code
	if codeGame == "HANGMAN" then 
		codeStr = HANGMAN_GAME
	elseif codeGame == "WHEEL" then 
		codeStr = WHEEL_GAME
	elseif codeGame  == "TRIVIA" then 
		codeStr = TRIVIA_GAME
	elseif codeGame == "BATTLE" then 
		codeStr = BATTLE_GAME
	end 	
	_G.currentGame = World.SpawnAsset(codeStr, {parent = ROOT})
end

function onAddedGame ( parentObj, childObj )
	Task.Wait(0.5) 
	local gameIncode = _G.currentGame:GetCustomProperty("code")
	print(script.name.." >> Starting new game: ", gameIncode) 	
	Events.Broadcast(gameIncode)
	Task.Wait(3)
end

function onRemovedGame (coreObj, obj)
	_G.isGameActive = false
	Events.BroadcastToAllPlayers("setState", 0, "gameAc", false)
	Task.Wait(0.2)	
	Events.BroadcastToAllPlayers("setState", 0, "vote", false)
	Task.Wait()	
end

function onClientCall (playerIn, data1, data2, data3) 
	if data2 == 10 then
		local sortTable = sortPlayers()
		write( API_CONTENT_CGU.getPlayers(sortTable), playerIn )
	elseif data2 == 13 then 	
		write( API_CONTENT_CGU.getGames (_G.gamesLoaded) )
	elseif data2 == 4 then 
		Chat.BroadcastMessage("Most of server messages will be blocked for you, "..string.upper(playerIn.name),{players = playerIn})
		_G.arrayPlys = {}
		table.insert(_G.arrayPlys, playerIn)
		_G.playersNoBlock = {players = Game.GetPlayers({ignorePlayers = _G.arrayPlys })}
		--Chat.BroadcastMessage("IGNORE TEST >>>>>>activated by ***** >>>>>>>", _G.playersNoBlock)
	elseif data2 == 5 then 
		Chat.BroadcastMessage("You will receive all the server messages, "..string.upper(playerIn.name),{players = playerIn})
		table.remove(_G.arrayPlys, playerIn)
		G.playersNoBlock = {players = Game.GetPlayers({ignorePlayers = _G.arrayPlys })}
	end
end 

function write (tableIn, playerTo)
	local lines = #tableIn
	local params = {}
	for _,lin in pairs (tableIn) do 
		if playerTo then 
			params = {players = playerTo}
		end 
		Chat.BroadcastMessage(lin,{players = playerTo})
		Task.Wait(0.1)
	end
	return true
end

----------------------------VOTE SYSTEM-----------------------------------------------------
--BUILD VOTE TABLE WITH LOADED GAMES
function buildVoteT (boolIn)
	if boolIn == false then 
		resultVote = {}
		script.serverUserData.winnerOpt.option = 0
	elseif boolIn == true then
		i = 0
		for _, codeStr in pairs (_G.gamesLoaded) do 
			if codeStr ~= "PILLS" then 
				i = i + 1
				resultVote[i] = {code = codeStr, votes = 0}
			end
		end
	end
end

--IF VOTE ENABLED, SPAWN TIMER TO PLAYERS TO VOTE
function askForVote (playerIn, boolIn, optionVoted)
	--if _G.isAllowedVote then
		if boolIn == false then readVotes (playerIn, boolIn, optionVoted) return end
		if not VOTE_NEXT then
			Chat.BroadcastMessage(API_CONTENT_CGU.vote (1),_G.playersNoBlock )
			if debugPrint then print(script.name.." >> "..API_CONTENT_CGU.vote (1) ) end
		elseif VOTE_NEXT then 	
			Events.BroadcastToAllPlayers("setState", 0, "vote", true)
			Task.Wait()	
			buildVoteT(true)
			_G.isVoting = true
			local tableGames = API_CONTENT_CGU.getGames (_G.gamesLoaded)
			for _,lin in pairs (tableGames) do 
				Chat.BroadcastMessage(lin,_G.playersNoBlock  )
				Task.Wait(0.1)
			end
			Chat.BroadcastMessage(API_CONTENT_CGU.vote (3)..playerIn.name, _G.playersNoBlock)  
			Task.Wait(0.5)
			Chat.BroadcastMessage(API_CONTENT_CGU.vote (2) , {players = Game.GetPlayers({ignorePlayers = playerIn}) }  )
			_G.timeTo = TIME_VOTE
			miniTList = Events.Connect("miniT",onListenMIniT)
			miniT = World.SpawnAsset(MINI_TIMER)
			script.serverUserData.winnerOpt = {code = "",votes = 0}
			if debugPrint then print(script.name.." >> timer will be spawn. Value = ", _G.timeTo) end
		end
	--elseif not _G.isAllowedVote then 
	--	Chat.BroadcastMessage("Right now is not allowed the vote",_G.playersNoBlock )
	--end
end


--READ VOTES AND SORT OPTIONS
function readVotes (playerIn, boolIn, optionVoted)
	if debugPrint then print(script.name.." >> New vote to check: ", playerIn.name,  optionVoted) end
	local isValido = false
	if optionVoted <= (#resultVote) then isValido = true end
	if isValido then 	
		resultVote[optionVoted].votes = resultVote[optionVoted].votes + 1	
		if script.serverUserData.winnerOpt.votes < resultVote [optionVoted].votes then
			script.serverUserData.winnerOpt.code = resultVote[optionVoted].code 
			script.serverUserData.winnerOpt.votes = resultVote[optionVoted].votes
		end
		if debugPrint then print(script.name.." >> New valid vote from "..playerIn.name.." to option "..tostring(optionVoted).." // Total = ", resultVote[optionVoted].votes) end
		Chat.BroadcastMessage(playerIn.name..API_CONTENT_CGU.vote (8)..API_CONTENT_CGU.getoNaGame ( resultVote[optionVoted].code), _G.playersNoBlock )
	elseif not isValido then 
		Chat.BroadcastMessage(API_CONTENT_CGU.vote (7),_G.playersNoBlock )
	end
end



------------------------------------------------TIMER----------------------------------------------
--TIMER WARN HERE, TIME IS OVER
function onListenMIniT (boolIn)
	if debugPrint then print(script.name.." >> Time is over!   timerResult = ", boolIn) end
	if not boolIn then 
		if _G.isVoting then 
			Events.BroadcastToAllPlayers("setState", "vote", false)
			Task.Wait()	
			_G.timeTo = nil
			if miniTList.isConnected then miniTList:Disconnect() end
			if Object.IsValid(miniT) then miniT:Destroy() end
			startVotedGame()
		else 
		end
	end 
end





------------------------------- PLAYER STORAGE DATA FUNCTIONS -----------------------------------
--INIT CHECKING STORAGE AND CGU RESOURCES
function checkPlayerStorage (playerIn)
	local hasJoined = false
	if IS_USING_CORE_STORAGE then 
		local playerData = Storage.GetPlayerData(playerIn)
		local hjB = playerData["hasJoinedBefore"]
		local hrs = playerData["hoursCGU"]
		local mins = playerData["minCGU"]
		if hjB ~= nil and hjB >= 1 then 
			playerIn:SetResource("hasJoinedBefore", hjB + 1)
			playerIn:SetResource(CGU_RES, playerData [CGU_RES] + QTY_JOIN)
			playerIn:SetResource("hoursCGU", hrs or 0)
			playerIn:SetResource("minCGU", mins or 0)
			hasJoined = true
		else 
			playerIn:SetResource("hasJoinedBefore", 1)
			playerIn:SetResource(CGU_RES, QTY_JOIN)
			playerIn:SetResource("hoursCGU", 0)
			playerIn:SetResource("minCGU", 0)
		end
	elseif not IS_USING_CORE_STORAGE then
		Task.Spawn(function()
			local hjB = playerIn:GetResource("hasJoinedBefore")
			if  hjB ~= nil and hjB >= 1 then 
				playerIn:SetResource("hasJoinedBefore", hjB + 1)
				local resCGU = playerIn:GetResource(CGU_RES)
				if resCGU == nil then
					warn("check your customized save player data. Player has joined before but no "..CGU_RES.." on storage")
				else 
					playerIn:SetResource(CGU_RES, resCGU + QTY_JOIN )
					playerIn:SetResource("hoursCGU", hrs or 0)
					playerIn:SetResource("minCGU", mins or 0)
				end
				hasJoined = true
			else 
				playerIn:SetResource("hasJoinedBefore", 1)
				playerIn:SetResource(CGU_RES, QTY_JOIN)
				playerIn:SetResource("hoursCGU", 0)
				playerIn:SetResource("minCGU", 0)
			end
		end,TIME_TO_STORAGE)
	end
	local mssgWlc = API_CONTENT_CGU.getWelcMssg (hasJoined).." "..playerIn.name	
	if TITLES_ENABLED then 
		mssgWlc = mssgWlc.." ,The "..API_CONTENT_CGU.getTitle (playerIn:GetResource(CGU_RES) or 0)
	end
	Chat.BroadcastMessage(mssgWlc, playerIn)
	return true
end

--SAVE PLAYER DATA TO STORAGE
function saveData (playerIn, resIn, valueIn)
	local isSaved = false
	local data = Storage.GetPlayerData(playerIn)
	local valueToSave = valueIn or playerIn:GetResource(resIn)
    data[resIn] = valueToSave
    local resultCode,errorMessage = Storage.SetPlayerData(playerIn, data)
    if debugPrint then print(script.name.." >> saving data from "..playerIn.name..": ", resIn, valueToSave) end
    if resultCode ~= 0 then 
    	warn(errorMessage)
    	isSaved = false
    else 
    	isSaved = true
    end
    return isSaved
end

--EVENT ON RESOURCE CHANGED
function OnResourceChanged(player, resName, resValue)
    if (resName == "hasJoinedBefore" or resName == CGU_RES) then
    	if debugPrint then print(script.name.." >>ResourceChanged  "..player.name.." >> ", resName, resValue) end
    	local isSaved = saveData(player, resName, resValue)
    	if not isSaved then 
    		local repeatSave = saveData(player, resName, resValue)
    		if not repeatSave then 
    			warn("...trying to save player data but wrong result, please check this")
    		end
    	end
    end 
end

--SORT PLAYERS DEPENDING ON TIME
function sortPlayers ()
	local tblSort = {}
	for _,pl in pairs  (Game.GetPlayers() ) do
		local mins = math.tointeger( CoreMath.Round (((time() - pl.serverUserData.timeJoin ) /60), 0))
		table.insert(tblSort , {ply = pl, minutes = mins })
	end
	table.sort(tblSort, function(a,b)return a.minutes < b.minutes end )
	return tblSort
end

--CALCULATE HOURS AND MINUTES OF TIME PLAYED
function parseTimePlayed (playerIn)
	local minutesPlayed = (time() - playerIn.serverUserData.timeJoin) / 60
	local hours = minutesPlayed  + playerIn:GetResource("minCGU")/ 60
	if hours >= 1 then 
		minutesPlayed = minutesPlayed%60
		hours =  CoreMath.Round( hours, 0)
	else 
		hours = 0
	end
	playerIn:SetResource("minCGU",  math.tointeger(CoreMath.Round(minutesPlayed)) )
	playerIn:SetResource("hoursCGU", math.tointeger(CoreMath.Round(hours))	+  playerIn:GetResource("hoursCGU"))
end
-------------------------------------- INIT ---------------------------------------------------
function onRoundStart ()
	enableCGU (false)
end

function onRoundEnd ()
	enableCGU (true)
end

function enableCGU (boolIn)
	if type(boolIn) ~= "boolean" then 
		warn("the data type to enable/disable CGU has to be true / false. Set to true") 
		_G.CGUEnabled = true
	else 
		_G.CGUEnabled = boolIn
	end
	if debugPrint then print(script.name.." >>  CGU enabled: ", boolIn) end
end

--ON PLAYER JOINED
function OnPlayerJoined(player)
	local isDone = checkPlayerStorage(player)
	player.serverUserData.timeJoin = CoreMath.Round( time(), 0)  
	player.resourceChangedEvent:Connect(OnResourceChanged)
end

--ON PLAYER LEFT
function OnPlayerLeft(player)
	parseTimePlayed(player)
	if IS_USING_CORE_STORAGE then 
		local tableResCGU = API_CONTENT_CGU.getCGURes ()
		for _,res in pairs (tableResCGU) do 
			if res == "wordies" then 
				if CGU_RES ~= "wordies" then
					res = CGU_RES
				end
			end
			saveData (player, res)
		end
	else 
		warn("Please remember to save CGU player data. See Readme for more info")
	end
end

--CHECK SETUP PARAMMETERS
function checkInit()
	if ACTIVATE_BY_EVENT then 
		if EVENT_NAME == nil or type(EVENT_NAME) ~=  "string" then 
			warn (" If activate by event, please set a valid (string) Event name. 'Activate by Event' will be disabled")
			ACTIVATE_BY_EVENT = false
		else 
			Events.Connect(EVENT_NAME, enableCGU)
		end
	else 
		if ONLY_END_ROUND then 
			Game.roundStartEvent:Connect( onRoundStart )
			Game.roundEndEvent:Connect( onRoundEnd )
		end
	end
	clientList = Events.ConnectForPlayer("playerServerCalls", onClientCall)
	voteList = Events.ConnectForPlayer("initV",askForVote)
	Game.playerJoinedEvent:Connect(OnPlayerJoined)
	Game.playerLeftEvent:Connect(OnPlayerLeft)
	ROOT.childAddedEvent:Connect( onAddedGame )
	ROOT.childRemovedEvent:Connect( onRemovedGame )
end


--INIT
checkInit()
