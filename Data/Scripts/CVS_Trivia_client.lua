--require
local CGU_GAME_TRIVIA = require( script:GetCustomProperty("CGU_GAME_TRIVIA") )
--custom
local CLIENT_CONTEXT = script.parent
--local
local localPlayer = Game.GetLocalPlayer()
local debugPrint = false 
local mainTask = nil
local questionDone = false
local currentCuestion = {}
local listHook, listState
-------------------------------------------------- FUNCTIONS -------------------------

--NOTIFY CLIENT TO ACTIVATE SCRIPT
function onChangeState (playerIn, newState)
	if  playerIn == localPlayer then 		
		script.clientUserData.state = newState
		script.clientUserData.player = localPlayer
		if debugPrint then print(script.name.." >> new state game for "..playerIn.name..": "..newState)	end 
	
	end	
	if newState == "game" and localPlayer == playerIn then 
		script.clientUserData.quizTable = CGU_GAME_TRIVIA.buildTable()
		localPlayer.clientUserData.tempCash = 0
		startTrivia(playerIn)
	elseif newState == "endGame" and localPlayer == playerIn then 
		endGame()
	end
end

--START MAIN BUCLE
function startTrivia (playerIn)
	mainTask = Task.Spawn(function()
		while script.clientUserData.state == "game" do 
			questionDone = false
			currentCuestion = CGU_GAME_TRIVIA.giveMeQuestion(script.clientUserData.quizTable)
			if currentCuestion == false then 
				Chat.LocalMessage(CGU_GAME_TRIVIA.sysMsg (5))
				script.clientUserData.state = "endGame" 
			else 
				Chat.LocalMessage(CGU_GAME_TRIVIA.sysMsg (6))
				Chat.LocalMessage(currentCuestion.q)
			end
			while not questionDone and script.clientUserData.state == "game" do 
				Task.Wait()
			end 
		end 
		if debugPrint then print(script.name.." >> endGame state on client, game will end for "..localPlayer.name) end 
	end)
end 

--WRITE A TEXT TABLE
function write (tableIn, params)
	local lines = #tableIn
	for _,lin in pairs (tableIn) do 
		Chat.LocalMessage (lin, params)
	end
	return true
end

--CHECK RESULTS
function checkResult (mssgIn)	
	local isOk = CGU_GAME_TRIVIA.checkResult(mssgIn, currentCuestion.k)
	Chat.LocalMessage(CGU_GAME_TRIVIA.sysMsg (7)..string.upper(mssgIn))
	if isOk then 		
		localPlayer.clientUserData.tempCash = localPlayer.clientUserData.tempCash + 1		
		Chat.LocalMessage(CGU_GAME_TRIVIA.sysMsg (8))
	else		
		Chat.LocalMessage(CGU_GAME_TRIVIA.sysMsg (9))
	end 
	if debugPrint then print(script.name.." >> checkResult: ", mssgIn, isOk) end
	questionDone = true
end 

--HOOK CHAT AND SEND DATA TO SERVER
function onSendM (params)
	if 	script.clientUserData.state ~= "game" then return end
		local mssg = string.lower(params.message)
		local initCh = string.find(mssg,"-")						
		if initCh ~= nil then 
			checkResult(string.sub(mssg,2,-1))
		end 
		if mssg == "/?t" then 
			Chat.LocalMessage (CGU_GAME_TRIVIA.showHelp() )
		end 
end

--END GAME
function endGame ()
	if script.clientUserData.player == localPlayer then 
		Events.BroadcastToServer("playersCalls",localPlayer, localPlayer.clientUserData.tempCash)
	end 
	Task.Spawn(function() if Object.IsValid (script) then  script:Destroy() end end, 5)
	listHook:Disconnect()
	listState:Disconnect()
end 


listHook = Chat.sendMessageHook:Connect( onSendM )
listState = Events.Connect("TriviaState", onChangeState)