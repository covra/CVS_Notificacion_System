--require
local CGU_GAME_BATTLE = require( script:GetCustomProperty("CGU_GAME_BATTLE") )
--local
local localPlayer = Game.GetLocalPlayer()
local TaskForShips = nil
localPlayer.clientUserData.battleGame = false
_G.currentShip = false
local done, localBoard = CGU_GAME_BATTLE.buildBoard ()
localPlayer.clientUserData.isAutoBoard = false
local listHook, listState

---------------------------------------------- FUNCTIONS -------------------------------------------------

--RECEIVE SERVER STATES
function onChangeState (playerIn, stateIn)
	if playerIn == localPlayer then	
		print(script.name.." >> new state to "..playerIn.name.." >> ", stateIn)
		script.clientUserData.stateClient = stateIn
		script.clientUserData.owner = playerIn
		if stateIn == "setShips" then 	
			askForShips()
		elseif stateIn == "game" then 
		elseif stateIn == "endGame" then 
			if localPlayer.clientUserData.isAutoBoard  == false then 
				print(TaskForShips:GetStatus() )
				TaskForShips:Cancel()
				_G.currentShip = nil
				Chat.LocalMessage(CGU_GAME_BATTLE.sysMsg (31))
			end 
			listHook:Disconnect()
			listState:Disconnect()
			Task.Wait(5)
			if Object.IsValid(script) then  script:Destroy() end 
		end 
	end 
	if stateIn == "endGame" then
		Task.Spawn(function() 	
			listHook:Disconnect()
			listState:Disconnect()
			if  Object.IsValid(script) then 
				script:Destroy()
			end
		end,5 )
	end
end


--HOOK MESSAGES
function onSendM(params)
	local mssg = string.lower(params.message)
	local initCh = string.find(mssg,"/")
	if Object.IsValid (script) then 
		if initCh ~= nil then 	
			if mssg == "/auto" and script.clientUserData.stateClient == "setShips"then  
				localPlayer.clientUserData.isAutoBoard = true
				TaskForShips:Cancel()
				_G.currentShip = nil
				local r1, r2
				localBoard, r1, r2 = CGU_GAME_BATTLE.buildAutoBoard (localBoard)
				tellServerBoard (mssg,r1,r2)
			elseif mssg == "/draw" then
				CGU_GAME_BATTLE.printBoard (localBoard)
				Chat.LocalMessage("#-1  2  3  4  5  6  7  8  9  10")	
				for k,v in pairs (localBoard) do
					local lt = (CGU_GAME_BATTLE.convert (k) )
					local lineStr = ""
					for j,w in pairs (v) do 
						lineStr = lineStr.."_"..w
					end
					Chat.LocalMessage(lt.."--"..lineStr)			
				end
			elseif mssg == "/?b" then 
				Chat.LocalMessage(CGU_GAME_BATTLE.showHelp())
			elseif #mssg == 4 and script.clientUserData.stateClient == "setShips" then
				local tblCmdOut = parseData(mssg)					
				Task.Spawn(function()
					local isOkShip = false
					local errorShip = 0		
					isOkShip, errorShip, localBoard = CGU_GAME_BATTLE.setShip (tblCmdOut.lt, tblCmdOut.num, _G.currentShip, tblCmdOut.align, localBoard)				
					if isOkShip then 
						local codeShip = _G.currentShip
						_G.currentShip = nil
						sendDataServer(tblCmdOut.lt, tblCmdOut.num, codeShip,tblCmdOut.align)
					else 
						Chat.LocalMessage(CGU_GAME_BATTLE.errMssg (errorShip) )
					end		
				end)
			elseif #mssg == 3 and script.clientUserData.stateClient == "game" then
				local tblCmdOut = parseData(mssg)
				sendDataServer(tblCmdOut.lt, tblCmdOut.num)
			end
		end	
	end 
end

--BROADCAST MESSAGES TO SERVER
function sendDataServer (ltIn,numIn,codeIn,alignIn)
	if  script.clientUserData.owner == localPlayer then
		if debugPrint then print("sending CODES from localPlayer:" ,ltIn,numIn,codeIn,alignIn,localPlayer.name) end 
	 	Events.BroadcastToServer("playersCalls",{lt = ltIn, num = numIn, code = codeIn, align = alignIn})
	end 
end

--TELL SERVER SAME AUTOBOARD THAT CLIENT
function tellServerBoard (mssg,r1,r2)
	if  script.clientUserData.owner == localPlayer then 
		if r1 ~= nil then
			Task.Spawn(function() Events.BroadcastToServer("playersCalls",mssg, r1, r2, localPlayer) Task.Wait() end)
		end
	end 
end 

--PARSE DATA TO SEND TO BE READABLE BY SERVER
function parseData(mssgIn)
	local parseMsg = { lt = "", num  = 1}
	parseMsg.lt= string.upper(string.sub(mssgIn,2,2))
	local ltMays = parseMsg.lt
	parseMsg.lt = CGU_GAME_BATTLE.convert (parseMsg.lt )	
	parseMsg.num = tonumber(string.sub(mssgIn,3,3))
	if script.clientUserData.stateClient == "game" then 
		parseMsg.lt = ltMays
	elseif script.clientUserData.stateClient == "setShips" then
		parseMsg = { lt = parseMsg.lt, num  = parseMsg.num, align = "h"}
		parseMsg["align"] = string.sub(mssgIn,4,4)		
	end
	return parseMsg 
end

--SET ONE BY ONE, EACH SHIP
function askForShips ()
	if  script.clientUserData.owner == localPlayer then 
		print("asking for ships to: ", localPlayer.name)
		TaskForShips = Task.Spawn(function()
			for _,lin in pairs ( CGU_GAME_BATTLE.listShipData ()) do 
				for i=1, lin.max do	
					_G.currentShip = lin.code
					Chat.LocalMessage(CGU_GAME_BATTLE.sysMsg (15)..lin.name.."("..lin.slots..") slots")
					repeat				
					Task.Wait()		
					until _G.currentShip ~= lin.code			
				end
			end
			Chat.LocalMessage(CGU_GAME_BATTLE.sysMsg (16) )	
			Events.BroadcastToServer("playersCalls","endB")
		end)		
	end
end


listHook = Chat.sendMessageHook:Connect( onSendM )
listState = Events.Connect("battleState", onChangeState)