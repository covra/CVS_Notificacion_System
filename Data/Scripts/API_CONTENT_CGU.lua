local logo = {
					"********************",
					"*    |     CGU    |     *",
					"*ChatGamesUnited*",
					"****byCovra-CVS***",
					"*    |   |   |   |   |   |   *",
					"********************", }					
					
local welcomeAgainMessage = "Welcome again to CGU!"
local neverSeenBeforeMessage = "oh! Nice to meet you, here in CGU"	

local recuLine = {">> CGU >> type   /?    for avaliable commands"}
local commandTable = {	
						{ ordNum = 1, strCm = "/?", str = "Avaliable commands"}, 	---------------
						{ ordNum = 2, strCm = "/m", str = "Show CGU menu"},
						{ ordNum = 3, strCm = "/off", str = "Shut down CGU in this session"},
						{ ordNum = 4, strCm = "/silence", str = "Mute all CGU messages"},---------- 
						{ ordNum = 5, strCm = "/nosilence", str = "UnMute CGU  messages"},----------
						{ ordNum = 6, strCm = "/me", str = "Show my CGU statics"},   ---------------
						{ ordNum = 7, strCm = "/ivote", str = "Ask for new game vote"}, --------------
						{ ordNum = 8, strCm = "/cgu", str = "Show credits"},-------------------------
						{ ordNum = 9, strCm = "/who", str = "Show players online"}, -----------
						{ ordNum = 10, strCm = "/whov", str = "Show players online, sort by veteran"},---------------
						{ ordNum = 11, strCm = "/time", str = "Show since when is up the server"},
						{ ordNum = 12, strCm = "/p", str = "Show me a pill of legendary wisdom"}, ----------------
						{ ordNum = 13, strCm = "/g", str = "Show me games avaliables"},  --------------
						{ ordNum = 14, strCm = "/?b", str = "Specific help for 'BattleShip game'"},   ------------
						{ ordNum = 15, strCm = "/?w", str = "Specific help for 'Wheel of Fortune' game"},----------
						{ ordNum = 16, strCm = "/?h", str = "Specific help for 'The Hangman' game"},----------
						{ ordNum = 17, strCm = "/?t", str = "Specific help for 'Trivia' game"},----------
						
						{ ordNum = 21, strCm = "/v1", str = "Use only, when there is an active vote"},----------
						{ ordNum = 22, strCm = "/v2", str = "Use only, when there is an active vote"},----------
						{ ordNum = 23, strCm = "/v3", str = "Use only, when there is an active vote"},-----------
						{ ordNum = 24, strCm = "/v4", str = "Use only, when there is an active vote"},----------
					}

local specificHelps = { ["b"] = "  You have to sink opponent's fleet.To do this, send commands with a '/' before (/c3 to shoot on C-3), (/auto to auto-position ships) (/draw to show your board) or /?b to show this help \n",
						["w"] = "  The roulette wheel will spin in each turn and, depending on what comes out, player will multiply the hits, plus bonuses. The last person to finish the sentence wins.To show this help type /?w. To hit a letter type ie:   -a     To see the hidden sentence, type -show \n",
						["h"] = "  Guess before anyone, the hidden word before completing the body. Type ie: -a to check if 'A' is inside. Type /?h to see this help \n",
						["t"] = "  Try to answer all questions without rush. At the end of the time, the one who answer more, will win extra points.You should answer with a single word, but try to be the most accurate you can. Type ie: -pacific . To see this help, type /?t  \n",
					}

local credits = { 
				"--------------------------",
				"---••••••••CREDITS••••••••----\n",
				"Game Developer:",
				"---------------",
				"covra \n",
				"Game Designer",
				"---------------",
				"covra \n",
				"CoVrAwOrKS 2021 \n",
				}
				
local menuInitServer = {
				}		

local tableResourcesCGU = {"hasJoinedBefore", "wordies", "hoursCGU", "minCGU"}

local titles = {	{name = "word-o-noob", qty = 250},
					{name = "RegulWordnerd", qty = 500},
					{name = "Lord of wordies", qty = 1000},
					{name = "MasterWordie", qty = 5000},
					
				}
				
local badwordList = {["dang"] = true, ["darn"] = true, ["heck"] = true}

local mssgVote = {	[1] =  "Vote for next game is disabled, now is auto. Please ask Admin to change this",
					[2] = "To vote, type / v1, / v2 .. depending on the option chosen...",
					[3] = "New vote proposed by ",
					[4] = "There is a voting in progress, please vote if you wish",
					[5] = "Vote is not possible, time is over or wait to end current game",
					[6] = "Next Game will be: ",
					[7] = "Your vote doesnt match none option. Will be discarded",
					[8] = " vote for ",
				}
					


local gameList = {
					{ oN = 1,code = "WHEEL", name = "Wheel Of Fortune", dcr = "Play against other players to reveal the hidden sentence!"},
					{ oN = 2,code = "HANGMAN",  name = "The HangMan", dcr = "Play against other players to reveal the hidden word! Be the faster!"},
					{ oN = 3,code = "TRIVIA",  name = "Trivia", dcr = "Relax and find the correct answer"},
					{ oN = 4,code = "BATTLE",  name = "BattleShip", dcr = "Play against other players and destroy their fleet!"},
				}

------------------ FUNCTIONS --------------------------------------
				
local API_CONTENT_CGU = {}

function API_CONTENT_CGU.getLogo ()
	return logo
end

function API_CONTENT_CGU.getCredits()
	return credits
end

function API_CONTENT_CGU.getSpecHelp(ChIn)
	return specificHelps[ChIn]
end

function API_CONTENT_CGU.getWelcMssg (boolIn)
	local mssg = ""
	if boolIn then 
		mssg = welcomeAgainMessage
	elseif not boolIn then 
		mssg = neverSeenBeforeMessage
	end
	return mssg
end

function API_CONTENT_CGU.getCGURes ()
	return tableResourcesCGU
end

function API_CONTENT_CGU.getPlayers(sortTable)
	local index = 1
	local tblOut = {}
	local tblPlys = {}
	tblOut[index] = "\n---((----Player List----))---"
	if sortTable then 
		for _,lin in pairs (sortTable) do 
			index = index + 1
			tblOut[index]  = tostring(index-1)..". >> "..lin.ply.name.." time = "..tostring(lin.minutes)
		end
	else 
		tblPlys = Game.GetPlayers()		
		for _,pl in pairs (tblPlys) do
			index = index + 1
			tblOut[index] = tostring(index-1)..". >> "..pl.name
		end		
	end
	tblOut[index + 1] = "------->>><<<-------"
	return tblOut
end

function API_CONTENT_CGU.getNfo(playerIn)
	local tblOut = {}
	local resPl = playerIn:GetResource("wordies") 
	local hPl = playerIn:GetResource("hoursCGU")	
	local minPl = playerIn:GetResource("minCGU") 
	local tit = API_CONTENT_CGU.getTitle (resPl)
	tblOut[1] = "\n"
	tblOut[2] = "_o0 "..playerIn.name.."'s CGU 0o_"
	tblOut[3] = "-----------------------------------"
	tblOut[4] = "|||> "..tit.." <|||" 
	tblOut[5] = "-----------------------------------"
	tblOut[6] = "wordies: "..tostring(resPl)
	tblOut[7] = "time played: "..tostring(hpl)..":"..tostring(minPl)
	tblOut[8] = "-----------------------------------"
	tblOut[9] = "\n"
	return tblOut	
end

function API_CONTENT_CGU.getTitle (resIn)
	local titleOut = ""
	for _, tit in pairs (titles) do 
		if tit.qty >= resIn then 
			titleOut = tit.name
			break
		end
	end
	return titleOut
end

function API_CONTENT_CGU.vote (codeMIn)
	if codeMIn then 
		return mssgVote [codeMIn]
	end 
end


function API_CONTENT_CGU.getoNaGame (codeIn)
	for _,lin in pairs (gameList) do 
		if lin.code == codeIn then
			return lin.name
		end
	end
end

function API_CONTENT_CGU.getoNGame (codeIn)
	for _,lin in pairs (gameList) do 
		if lin.code == codeIn then
			return lin.oN
		end
	end
end

function API_CONTENT_CGU.getfullName(optionVoted)
	for _,lin in pairs (gameList) do 
		if lin.oN == optionVoted then
			return lin.name
		end
	end
end

function API_CONTENT_CGU.getDtGm (codeIn)
	for _, lin in pairs (gameList) do 
		if lin.code == codeIn then 
			return lin.name
		end
	end	
end

function API_CONTENT_CGU.getCodeGame (objIn)
	for _,lin in pairs (gameList) do
		if lin.oN == objIn then 
			return lin.code 
		end
	end
end

function API_CONTENT_CGU.getGames (gmsLoad)
	local tblOut = {}
	local index = 0
	local indexLin = 1
	tblOut[indexLin] = "-------CGU GAMES-------"
						print(">>>>>>>>>>>>>>>>>> num loaded", #gmsLoad)
	for _,gm in pairs (gmsLoad) do 
						print(">>>>>>>>>>>>>>>>>> gm", gm)	
		for _, lin in pairs (gameList) do 
			if gm == lin.code then 
				indexLin = indexLin + 1
				index = index + 1
				tblOut[indexLin] =  tostring(index).." "..lin.name
				indexLin = indexLin + 1
				tblOut[indexLin] = lin.dcr
				break
			end
		end
	end
	tblOut[indexLin + 1] = "------->>><<<-------"
	return tblOut
end

function API_CONTENT_CGU.getRecuLine ()
	return recuLine
end

function API_CONTENT_CGU.getDataCommand (strIn)
	local line = {}
	for _, tbl in pairs (commandTable) do 
		if strIn == tbl.strCm then 
			line = tbl
			break
		end
	end
	return line.ordNum, line.str
end

function API_CONTENT_CGU.listCmmnd()
	local str = "Avaliable command list \n".."--------------- \n"
	local tableOut = {}
	for _, lin in pairs (commandTable) do 
		tableOut[lin.ordNum] = tostring(lin.ordNum)..": "..lin.strCm.." >> "..lin.str
	end
	return str, tableOut
end

return API_CONTENT_CGU