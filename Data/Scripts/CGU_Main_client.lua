--require
local API_CONTENT_CGU = require( script:GetCustomProperty("API_CONTENT_CGU") )
local CGU_GAME_PILLS
--custom
local CLIENT_CONTEXT = script.parent
local ROOT = CLIENT_CONTEXT.parent
--user exposed
local debugPrint = true
local ONLY_END_ROUND = ROOT:GetCustomProperty("onlyWhenRoundEnds")
local ACTIVATE_BY_EVENT = ROOT:GetCustomProperty("activateByEvent")
local EVENT_NAME = ROOT:GetCustomProperty("eventName")
local IS_USING_CORE_STORAGE = ROOT:GetCustomProperty("savePlayerData")
local VOTE_NEXT = ROOT:GetCustomProperty("isGameVoted")
local LOAD_SAPIENS = ROOT:GetCustomProperty("loadSapiensPills")
local TITLES_ENABLED = ROOT:GetCustomProperty("useChatTitles")
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
local LOAD_BATTLE = ROOT:GetCustomProperty("loadBattleship") 
if LOAD_BATTLE then 
	CGU_GAME_BATTLE = require( ROOT:GetCustomProperty("CGU_GAME_BATTLE") )
	table.insert(_G.gamesLoaded, "BATTLE")
end
--local
local localPlayer = Game.GetLocalPlayer()
_G.isVoting = false
_G.isGameActive = false

-------------------------------------------------------------------------------------------------
function setState (plyrIn, strIn, boolIn)
	if plyrIn == 0 then
		plyrIn = localPlayer
	end
	if plyrIn == localPlayer then 
		if strIn == "vote" then
			_G.isVoting = boolIn
		elseif strIn == "gameAc" then
			_G.isGameActive = boolIn
			if boolIn == false then 
				 write (API_CONTENT_CGU.getLogo ())	
				 write (API_CONTENT_CGU.getRecuLine ())
			end
		end
		if debugPrint then print(script.name.." >>"..localPlayer.name.." new state in "..strIn.." = ", boolIn) end
	end
end




-----------------------------------------------------------------------------------------------
function write (tableIn)
	local lines = #tableIn
	for _,lin in pairs (tableIn) do 
													print(lin)
		Chat.LocalMessage(lin)
	end
	return true
end

function onSendM (params)
	if localPlayer.clientUserData.shutdown then 
	elseif not localPlayer.clientUserData.shutdown then 
		local mssg = string.lower(params.message)
		local ord, dataCmm = API_CONTENT_CGU.getDataCommand (mssg)
		if debugPrint then print(script.name.." >> HookData from API: ",mssg, ord, dataCmm) end
		local str = ""
		if ord == nil then 
		elseif ord == 1 then 
			 write (API_CONTENT_CGU.getLogo ())	
			 str, tableIn = API_CONTENT_CGU.listCmmnd() 
			 Chat.LocalMessage (str)
			 write(tableIn)
		elseif ord == 4  or ord == 5 then 
			Events.BroadcastToServer("playerServerCalls", localPlayer, ord)
		elseif ord == 6 then 
			write (API_CONTENT_CGU.getNfo(localPlayer) )
		elseif ord == 7 then 
			if not _G.isVoting then 
				_G.isVoting = true			
				Chat.LocalMessage (API_CONTENT_CGU.vote (2))
				Events.BroadcastToServer("initV", true)
			elseif _G.isVoting then 
				Chat.LocalMessage (API_CONTENT_CGU.vote (4))
			elseif _G.isGameActive then
				Chat.LocalMessage (API_CONTENT_CGU.vote (5))
			end	
		elseif ord == 8 then
			write (API_CONTENT_CGU.getCredits())
		elseif ord == 9 then 
			write (API_CONTENT_CGU.getPlayers(nil) ) 
		elseif ord == 10 then 
			Events.BroadcastToServer("playerServerCalls", localPlayer, ord)
		elseif ord == 12 then 
			if LOAD_SAPIENS then 
			write( CGU_GAME_PILLS.giveMeOne() )
			end
		elseif ord == 13 then 
			Events.BroadcastToServer("playerServerCalls", localPlayer, ord)
		elseif ord == 14 or ord == 15 or ord == 16 or ord == 17 then 			
			Chat.LocalMessage (API_CONTENT_CGU.getSpecHelp(string.sub(mssg,3,3)) )
		elseif ord == 21 or ord == 22 or ord == 23 or  ord == 24 then
			if  _G.isVoting and not  _G.isGameActive  then
				local code = ord - 20
				Events.BroadcastToServer("initV", false, code)
			else 
				Chat.LocalMessage (API_CONTENT_CGU.vote (5))
			end
		elseif ord > 1 then
			str =">> DEBUG ".. tostring(ord)..". "..dataCmm
			Chat.LocalMessage (str)
		end
	end
end

function onReceiveM (speaker, params)
	local mssg = string.lower(params.message)
end

function sortPlayers ()
	local tblSort = {}
	for _,pl in pairs  (Game.GetPlayers() ) do
		local mins = math.tointeger( CoreMath.Round (((time() - pl.clientUserData.timeJoin ) /60), 0))
		table.insert(tblSort , {ply = pl, minutes = mins })
	end
	table.sort(tblSort, function(a,b)return a.minutes < b.minutes end )
	return tblSort
end

function Init()
	Task.Spawn(function()
		write(API_CONTENT_CGU.getLogo ())
		Task.Wait(1)
		write(API_CONTENT_CGU.getRecuLine ())
	end, 1)
	Task.Spawn(function()
		Chat.receiveMessageHook:Connect( onReceiveM )
		Chat.sendMessageHook:Connect( onSendM )
	end,1)
	Game.GetLocalPlayer().clientUserData.timeJoin = CoreMath.Round( time(), 0) 				
	Game.GetLocalPlayer().clientUserData.shutdown = false
	Events.Connect("setState", setState)
end

Init()