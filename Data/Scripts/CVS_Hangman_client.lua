--require
local CGU_GAME_HANGMAN = require( script:GetCustomProperty("CGU_GAME_HANGMAN") )
--custom
local CLIENT_CONTEXT = script.parent
--user exposed 
local debugPrint = false 
--local
local localPlayer = Game.GetLocalPlayer()
local mainTask = nil
local CharIn = false
local isData = false
local ROUND_TIME = CLIENT_CONTEXT:GetCustomProperty("maxTimeRound")
local MAX_ROUNDS = CLIENT_CONTEXT:GetCustomProperty("numMaxRounds")
local currentState = {}
for i = 1, 10 do 
	currentState [i] = false
end
local globalFails = 0
local numTotChar = 0
local listHook, listState
--------------------------------------------------FUNCTIONS-------------------------

--NOTIFY CLIENT TO ACTIVATE SCRIPT
function onChangeState (playerIn, newState)
	if  playerIn == localPlayer and Object.IsValid (script) then 		
		script.clientUserData.state = newState
		script.clientUserData.player = localPlayer
		if debugPrint then print(script.name.." >> new state game for "..playerIn.name..": "..newState)	end 
	
	end	
	if newState == "game" and localPlayer == playerIn then 
		startRounds(playerIn)
	elseif newState == "endGame" and localPlayer == playerIn then 
		endGame()
	end
end

--ROUNDS START HERE
function startRounds (playerIn)
	if playerIn == localPlayer then
		if debugPrint then print(script.name.." >> "..playerIn.name.." starting time...") end
		localPlayer.clientUserData.tempCash = 0 
		script.clientUserData.player = localPlayer
		Chat.LocalMessage(CGU_GAME_HANGMAN.sysMsg (2))
		Chat.LocalMessage(CGU_GAME_HANGMAN.sysMsg (7))
		showSentence()
		Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (3))
	end
end

--CHECK RESULT NEW CHAR
function checkResult (chIn)
	local isHit, hits, hideTable = CGU_GAME_HANGMAN.checkResult(chIn, script.clientUserData.hideTableStr)
	script.clientUserData.hideTableStr = hideTable
	script.clientUserData.sentenceStr = CGU_GAME_HANGMAN.getSent (script.clientUserData.hideTableStr)
	if not isHit then 
		globalFails = globalFails + 1
		currentState [globalFails] = true
		Chat.LocalMessage (chIn..CGU_GAME_HANGMAN.sysMsg (8))	
		if globalFails >= numTotChar then  
			Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (20))
			localPlayer.clientUserData.tempCash = 0
			script.clientUserData.state = "endGame"
		end 
	elseif isHit then
		localPlayer.clientUserData.tempCash = localPlayer.clientUserData.tempCash + hits
		if numTotChar == localPlayer.clientUserData.tempCash then 
			Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (9)..localPlayer.name..CGU_GAME_HANGMAN.sysMsg (10))	
			endGame()
			return true 
		else 
		Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (11)..localPlayer.name..CGU_GAME_HANGMAN.sysMsg (13))	
		end 
	end
	CharIn = true
	showFigure()
	Chat.LocalMessage (script.clientUserData.sentenceStr)
	Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (3))
	if debugPrint then print(script.name.." >> checkResult: ", chIn, isHit, globalFails, localPlayer.clientUserData.tempCash) end 
end

--GET 1ST TIME SENTENCE AND SHOW
function showSentence()
		local frase, category = CGU_GAME_HANGMAN.getSentence()
		numTotChar = #frase
		currentCategory = category
		script.clientUserData.hideTableStr = CGU_GAME_HANGMAN.hideSentence (frase)
		script.clientUserData.sentenceStr, numTotChar = CGU_GAME_HANGMAN.getSentenceStr (script.clientUserData.hideTableStr)
		if debugPrint then print(script.name.." >> The sentence will be: "..script.clientUserData.sentenceStr) end 
		showFigure ()
		Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (14))
		Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (15))
		Chat.LocalMessage (currentCategory)
		Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (15))
		Chat.LocalMessage (script.clientUserData.sentenceStr)
		Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (12))
		Task.Wait(5)
		Chat.LocalMessage (CGU_GAME_HANGMAN.sysMsg (16))
		
		return true
end

--DRAW CURRENT HANGMAN STATE
function showFigure()
	if globalFails  ~= 0 and  globalFails ~= nil then 
		local str = CGU_GAME_HANGMAN.getGameHangman(globalFails) 
		if str ~= nil then 
			write(str)
		end 
	end 
end 

--END GAME
function endGame ()
	if script.clientUserData.player == localPlayer then 
		if script.clientUserData.state == "game" then 
			Events.BroadcastToServer("playersCalls",localPlayer, false, localPlayer.clientUserData.tempCash)
		elseif  script.clientUserData.state == "endGame" then
			Events.BroadcastToServer("playersCalls", localPlayer,true, localPlayer.clientUserData.tempCash)
		end 	
		if debugPrint then print(script.name.." >> END game, sent data: ", localPlayer, localPlayer.clientUserData.tempCash) end 
	end 
	Task.Spawn(function() if Object.IsValid (script) then  script:Destroy() end end, 5)
	listHook:Disconnect()
	listState:Disconnect()
end 

--WRITE A TEXT TABLE
function write (tableIn, params)
	local lines = #tableIn
	for _,lin in pairs (tableIn) do 
		Chat.LocalMessage (lin, params)
	end
	return true
end



--HOOK CHAT AND SEND DATA TO SERVER
function onSendM (params)
	if Object.IsValid (script) then 
		if 	script.clientUserData.state ~= "game" then return end
		local mssg = string.lower(params.message)
		local initCh = string.find(mssg,"-")						
		if initCh ~= nil and #mssg == 2 then 		
			checkResult(string.sub(mssg,2,2))
		elseif mmsg == "/?h" then 
			showHelp()
		end
	end 
end

function sendData (mssgOut)
	Events.BroadcastToServer("playersCalls",mssgOut)
end

function showHelp ()
	Chat.LocalMessage (CGU_GAME_HANGMAN.showHelp() )
end

listHook = Chat.sendMessageHook:Connect( onSendM )
listState = Events.Connect("hangState", onChangeState)
