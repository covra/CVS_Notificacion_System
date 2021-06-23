local objB = {
				{code = "B", name = "Battleship", slots = 5, max = 1},
				{code = "C", name = "Aircraft Carrier", slots = 4, max = 2},
				{code = "D", name = "Destroyer", slots = 3, max = 3},
				{code = "S", name = "Submarine", slots = 2, max = 4},
			}
local totalHits = 30
local NIL = "O"
local ALL = "B"
local reverseBoard_1 = {
					{lt = 1, num = 1, code = "S", align = "h"},
					{lt = 2, num = 3, code = "B", align = "h"},
					{lt = 2, num = 9, code = "D", align = "v"},
					{lt = 4, num = 4, code = "S", align = "h"},
					{lt = 5, num = 2, code = "D", align = "h"},
					{lt = 5, num = 7, code = "C", align = "v"},
					{lt = 6, num = 8, code = "S", align = "h"},
					{lt = 6, num = 3, code = "S", align = "h"},
					{lt = 9, num = 2, code = "C", align = "h"},
					{lt = 8, num = 9, code = "D", align = "v"},					
					}
local reverseBoard_2 = {
					{lt = 1, num = 3, code = "S", align = "v"},
					{lt = 1, num = 5, code = "C", align = "v"},
					{lt = 3, num = 7, code = "D", align = "h"},
					{lt = 3, num = 2, code = "B", align = "v"},
					{lt = 5, num = 4, code = "S", align = "v"},
					{lt = 5, num = 7, code = "C", align = "h"},
					{lt = 6, num = 5, code = "D", align = "h"},
					{lt = 6, num = 9, code = "S", align = "v"},
					{lt = 9, num = 2, code = "S", align = "v"},
					{lt = 10, num = 4, code = "D", align = "h"},					
					}

local matrixY = {
				[1] ="A",
				[2] ="B",
				[3] ="C",
				[4] ="D",
				[5] ="E",
				[6] ="F",
				[7] ="G",
				[8] ="H",
				[9] ="I",
				[10] ="J",
				}
local matrixX = #matrixY
local board = {}

local helpStr = "You have to sink opponent's fleet.To do this, send commands with a '/' before (/c3 to shoot on C-3), (/auto to auto-position ships) (/draw to show your board) or /?b to show this help \n"


local errorCodes = {
					[0] = "Succesfully",
					[1] = "Number too high or too low",
					[2] = "Letter is not in the board",
					[3] = "Ship reference is incorrect",
					[4] = "Ship doesn´t fit in board , try repositioning it again",
					[5] = "The ship's slots cross another , try repositioning it again",
					[6] = "3rd letter has to be 'v' for vertical or 'h' for horizontal",
					[7] = "[debug] check data to convert",
				}
local sysMessges = {
					[1] = "\n",
					[2] = "----------------- BATTLESHIP------------------------",
					[3] = "Time to set Ships: send its code and position",
					[4] = "              <||>",
					[5] = "              _TT__________^^__",
					[6] = "____t___       |--ooTo[]-To-\\             __t____",
					[7] = " \\.o.\\___t___|---o---------\\----___|___/-o--/",
					[8] = "  \\__________________________________________/",
					[9] = " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
					[10] = "i.e: If you want to put a vertical ship at A6 you will have to type: /a6v",
					[11] = "i.e: If you want to put a horizontal ship at C3 you will have to type: /c3h",
					[12] = "If you need VISUAL support, type: /draw",
					[13] = "If you like to AUTO set positions, type: /auto",
					[14] = "---------------------------------------------------------- \n",
					[15] = "Next ship to position: ",
					[16] = "All ships positionated properly!, waiting for other players...",
					[17] = " >>> ROUND ",
					[18] = "It is the turn of: ",
					[19] = " >> Type write and number in this format: /b6 ",
					[20] = " >> New Shoot on: ",
					[21] = "HIT! ",
					[22] = " miss the shot ",
					[23] = " has defeat  ",
					[24] = " can shoot another time!  ",
					[25] = ": Your fleet didn't survive",
					[26] = " fleet's survived and will earn ",
					[27] = " is the overall winner with ",
					[28] = "No winner, ",
					[29] = "CLOSING GAME",
					[30] = "The rounds will start in 5 secs",
					[31] = "You didn't send the board. ENDGAME",
					[32] = "TIME to set ships manually: ",
				}
------------------------------------------FUNCTIONS----------------------------
local CGU_GAME_BATTLE = {}

function CGU_GAME_BATTLE.sysMsg (codMsg)
	return  sysMessges [codMsg]
end

function CGU_GAME_BATTLE.errMssg (codMsg)
	return errorCodes [codMsg]
end

function CGU_GAME_BATTLE.showHelp()
	return helpStr
end

function CGU_GAME_BATTLE.printBoard (boardIn)
	print(script.name.." >> printing local board...")	
	for k,v in pairs (boardIn) do
		local lt = (CGU_GAME_BATTLE.convert (k) )
		local lineStr = ""
		for j,w in pairs (v) do 
			lineStr = lineStr..	w
		end
		print (lt, lineStr)
	end
	return true
end

function CGU_GAME_BATTLE.listShipData ()
	print(script.name.." >>\n List Ship Data")
	print("___________________________")
	for _,lin in pairs (objB) do 
		print(lin.code, lin.name, lin.slots, lin.max)
	end
	print("\n")
	return objB
end

function CGU_GAME_BATTLE.getTotalHits ()
	return totalHits
end

function CGU_GAME_BATTLE.getDataShip (codeIn, keyStr)
	for _,lin in pairs (objB) do 
		if lin.code == codeIn then 
			return lin [keyStr]
		end
	end
end 

function CGU_GAME_BATTLE.convert (data)	
	local dataOut = nil 
	if type(data) == "string" then 
		data = string.upper(data) 
		 for i = 1, matrixX do 
		 	if matrixY [i] == data then  dataOut = i end
		 end
	elseif type (data) == "number" then 
		dataOut = matrixY [data]
	end
	return dataOut
end

function CGU_GAME_BATTLE.buildBoard ()
	local board = {}
	for i=1, matrixX, 1 do 
		board[i] = {}
		for j=1, matrixX ,1 do 			
			board [i][j] = NIL
		end
	end
	return true, board
end

function CGU_GAME_BATTLE.buildAutoBoard (boardIn, r1, r2)
	local randomNum = math.random (1,100)
	if r1 then randomNum = r1 end
	local boardRef = {}
	if randomNum <= 50 then
		boardRef = reverseBoard_1
	else 
		boardRef = reverseBoard_2
	end
	local randomNum2 = math.random (1,100)
	if r2 then randomNum2 = r2 end
	for _,line in pairs (boardRef) do
		if randomNum2 <= 50 then 
			local reverseLt = line.lt
			line.lt = line.num
			line.num = reverseLt
		end
		isDone, error, boardIn = CGU_GAME_BATTLE.setShip (line.lt, line.num, line.code, line.align, boardIn)
	end 
	CGU_GAME_BATTLE.printBoard(boardIn)	
	return boardIn, randomNum, randomNum2
end

function CGU_GAME_BATTLE.setSimpleSlot (boardIn, ltIn, numIn, codeIn)
	boardIn [ltIn][numIn] = codeIn
	return boardIn
end


function CGU_GAME_BATTLE.getSlot(ltIn, numIn)
	ltIn = CGU_GAME_BATTLE.convert(ltIn)
	return board [ltIn] [numIn]
end

function CGU_GAME_BATTLE.getResult (ltIn, numIn, boardIn)
	--print(script.name.." >> GetResult for: ", ltIn, numIn, boardIn)
	if type(ltIn) == "string" then 
		ltIn = CGU_GAME_BATTLE.convert(ltIn)
	end
	local isOk, errCode = CGU_GAME_BATTLE.checkData(ltIn, numIn, ALL)
	if isOk then 
		local isHit = false
		local codeOut = boardIn [ltIn][numIn]
		if boardIn [ltIn][numIn] ~= NIL then
			--print(script.name.." >> Hitted! >> typeSHIP: "..boardIn [ltIn][numIn])
			isHit = true		
			boardIn [ltIn][numIn] = NIL
		else 
			isHit = false
			--print(script.name.." >> not Hitted!")
		end
		return isOk, isHit, codeOut, 0
	else 
		return isOk, false, NIL, errCode
	end
end


function CGU_GAME_BATTLE.setSlot (ltIn, numIn, codeIn, localBoard)
	if type(ltIn) == "string" then mY = CGU_GAME_BATTLE.convert(ltIn) end
	local isOk, errCode = CGU_GAME_BATTLE.checkData(ltIn, numIn, codeIn)
	if isOk then 
		localBoard [ltIn][numIn] = codeIn
	else 
	end
	--print(">>>> setSlot return:",isOk, errCode, localBoard)
	return isOk, errCode, localBoard
end

function CGU_GAME_BATTLE.checkData (ltIn, numIn, codeIn)	
	--print(script.name.." >> checking data: ", ltIn, numIn, codeIn)
	if ltIn == nil or numIn == nil or codeIn == nil then return false,7 end
	if type(ltIn)~= "string" then
		ltIn = CGU_GAME_BATTLE.convert(ltIn)
	end
	if numIn <= 0 or numIn >= matrixX then return false,1 end
	local isOk = false
	for _,lt in ipairs (matrixY) do 
		if lt == ltIn then  isOk = true break end
		
	end
	if isOk == false then return false,2 end
	isOk = false
	for _,linGI in pairs(objB) do 
		if linGI.code == codeIn then isOk = true  break end		
	end
	if isOk == false then
		return false,3
	else return true, 0 
	end
end

function CGU_GAME_BATTLE.checkAlign (mY, mX, codeIn, alignIn, localBoard)
	--print(script.name.." >> checking align: ", mY, mX, codeIn, alignIn)
	if type(mY) == "string" then
		mY = CGU_GAME_BATTLE.convert(mY) end
	local isOk = false
	local ship = {}
	local currentShipPos = {}
	if alignIn == "h" or alignIn == "v" then
		isOk = true
	else return nil, false, 6 end 
	
	local numSlots = CGU_GAME_BATTLE.getDataShip (codeIn, "slots")
	local newDataShip = {}
	newDataShip.codeType = codeIn
	newDataShip.name = CGU_GAME_BATTLE.getDataShip (codeIn, "name")
	newDataShip.numS = numSlots
	newDataShip.pos = {}
	
	if alignIn == "v" then 
		print(">> posicionando en V:", mY, mX, codeIn, alignIn)
		if mY + numSlots  > (matrixX + 1) then return nil, false, 4 end
		for i = 1, numSlots do 
			currentShipPos [i] = {lt = mY + (i-1),num = mX}
			local isOk, isHit = CGU_GAME_BATTLE.getResult (currentShipPos [i].lt, currentShipPos [i].num, localBoard)
			if isHit then return nil, false, 5 end
		end
		newDataShip.pos = currentShipPos
		
	elseif alignIn == "h" then 
		print(">> posicionando en H:", mY, mX, codeIn, alignIn)
		if mX + numSlots  > (matrixX + 1) then return nil, false, 4 end
		for i = 1, numSlots do 
				currentShipPos [i] = {lt = mY ,num = mX + (i-1)}	
			local isOk, isHit = CGU_GAME_BATTLE.getResult ( currentShipPos [i].lt, currentShipPos [i].num, localBoard)
			if isHit then return nil, false, 5 end
		end
		newDataShip.pos = currentShipPos
	end	
	return newDataShip, true, 0
end

function CGU_GAME_BATTLE.setShip (mY, mX, codeIn, alignIn, localBoard)
	print(script.name.." >> setShip Input data:",mY, mX, codeIn, alignIn, localBoard)
	local ship = {}
	local isOk = false
	local isOkm = false
	local isOk, errCode = CGU_GAME_BATTLE.checkData(1, 1, codeIn)
	if isOk then
		ship, isOkm, errCode =  CGU_GAME_BATTLE.checkAlign (mY, mX, codeIn, alignIn, localBoard)
		if isOkm then 
			local isOkSet = false
			for _, newPos in pairs (ship.pos) do 
				mY = newPos.lt 
				mX = newPos.num 
				isOkSet, errCode, localBoard  =  CGU_GAME_BATTLE.setSlot (mY, mX, ship.codeType, localBoard)
			end
			return isOkSet, errCode, localBoard
		else 
			return false, errCode, localBoard 
		end
	else 
		return false, errCode, localBoard 
	end
	
end

return CGU_GAME_BATTLE