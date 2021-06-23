

local Hangman = {
					"  ^^^^^^^^^^^",
					"(|  _    _   |)",
					"(|  ♥  ♥ |)",
					"  \\         //",
					"    \\ ○ //",
					"     ||||",
					" |▒▒▒▒▒▒▒▒▒▒▒|",
					" |           |",
					" |  SAVE ME! |",

				}
				
local gameHangman = { 	
						[1] = {	"════════════════",
										"        V",
										"        |"}, 
										
										
						[2] = {"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |•   •|",
									  	"      |▒▒▒|",} , 
									  	
									  	
						[3] = {"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |•   •|",
									  	"      |▒▒▒|" , 
										"         ▒  "}, 
						
						
						[4] = {"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |•   •|",
									  	"      |▒▒▒|" , 
										"         ▒  ", 						
										"      --▒▒▒--",
										"        ▒▒▒  "},
										
										
						[5] = {"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |•   •|",
									  	"      |▒▒▒|" , 
										"         ▒  ", 
						
										"     ▒--▒▒▒--",
										"     ▒  ▒▒▒  "},
						
																				
										
						[6] = {	"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |•   •|",
									  	"      |▒▒▒|" , 
										"         ▒  ", 						
										"    ▒--▒▒▒--▒",
										"    ▒  ▒▒▒  ▒"},
						
										
										
						[7] = {	"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |•   •|",
									  	"      |▒▒▒|" , 
										"         ▒  ", 						
										"    ▒--▒▒▒--▒",
										"    ▒  ▒▒▒  ▒",
										"		 ▒",
										"        ▒"}, 
										
										
						[8] = {		"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |•   •|",
									  	"      |▒▒▒|" , 
										"         ▒  ", 						
										"    ▒--▒▒▒--▒",
										"    ▒  ▒▒▒  ▒",
										"		▒ ▒",
										"       ▒  ▒"},
						[9] = {		"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |•   •|",
									  	"      |▒▒▒|" , 
										"         ▒  ", 						
										"    ▒--▒▒▒--▒",
										"    ▒  ▒▒▒  ▒",
										"		▒ ▒",
										"       ▒  ▒",
										"  		   ╚"}, 
						
						[10] = {	"════════════════",
										"        V",
										"        |",
										"      |^^^|",
							 		  	"      |+   +|",
									  	"      |▒O▒|" , 
										"         ▒  ", 						
										"    ▒--▒▒▒--▒",
										"    ▒  ▒▒▒  ▒",
										"		▒ ▒",
										"       ▒  ▒",
										"  	    ╝ ╚",}, 						

						}


local sentences_cat1 = { cat = "Star Wars Characters" ,frss =  {
				"Obi-Wan Kenobi",		
				"Luke Skywalker",
				"Han Solo",
				"Anakin Skywalker",
				"Shmi Skywalker",
				"Ben Solo",
				"Padme Amidala",
				"Bail Organa",
				"Boba Fett",
				"Lando Calrissian",
				"Yoda Grandmaster",}
				}

local sentences_cat2 = { cat = "Top videoGames", frss = {
				"Call of Duty",		
				"Battlefield 2",
				"Metal Gear Solid",
				"Final Fantasy XII",
				"The Legend of Zelda",
				"The Last of Us",
				"Grand Turismo",
				"Mario Bros",
				"Red Dead Redemption",
				"Grand Theft Auto ",
				"Half-Life ",}
				}

local sentences_cat3 = { cat = "Major Constellations", frss = {
				"Hydra",		
				"Virgo",
				"Ursa Major",
				"Hercules",
				"Pegasus",
				"Eridanus",
				"Centaurus",
				"Sagittarius",
				"Gemini",
				"Taurus",}
				}

local globalPhrases = { sentences_cat1, sentences_cat2, sentences_cat3 }

local specialChars = {" ", "-","'", ",", ".", "!", "?"}					
local helpStr = " Guess before anyone, the hidden word before completing the body. Type ie: -a to check if 'A' is inside. Type /?h to see this help \n"					
local sysMssg =  {
					[1] = "Welcome to The Hangman", 				 
					[2] = "This will be your sentence/word: ",
					[3] = "Type a letter to match, ie: -w",
					[4] = "-----The Hangman-----","The sentence to discover will be:",
					[5] = " You saved the Hangman! ",
					[6] = " You can try again! ",
					[7] = "____________.o0o._____________",
					[8] = " is not in the sentence, try another",
					[9] = "You did it ",
					[10] = "!, Let's finish!",
					[11] = "Good job ",
					[12] = " 5 seconds , and we will START...",
					[13] = "!, try another",
					[14] = "The category will be: ",
					[15] = "-------------------->",
					[16] = "...Time is running! Be the first! \n",
					[17] = "WINNER is .... ",
					[18] = "Paying prize of ",
					[19] = ">> No one match a letter! shame!! ",
					[20] = "Oh No! You loose!",
					[21] = "",
					}
local errorCodes =  {
					[1] = {""},
					}
-----------------------------------------FUNCTIONS-------------------------------------------

local CGU_GAME_HANGMAN = {}

function CGU_GAME_HANGMAN.sysMsg (codMsg)
	return  sysMssg [codMsg]
end

function CGU_GAME_HANGMAN.errMssg (codMsg)
	return errorCodes [codMsg]
end

function CGU_GAME_HANGMAN.drawHangman()
	return Hangman
end


function CGU_GAME_HANGMAN.showHelp()
	return helpStr
end

function CGU_GAME_HANGMAN.getGameHangman (partIn)
	return gameHangman [partIn]
end

function CGU_GAME_HANGMAN.getSentence()
	local str = ""
	local currentCat = globalPhrases [math.random (1,#globalPhrases)]
	local strC = currentCat.cat
	local strF = currentCat.frss [math.random (1, #currentCat.frss)]
	print(script.name.." >> [Debug] new hangman: ", strC, strF)
	return strF, strC
end

function CGU_GAME_HANGMAN.checkIsFull (hideTable)
	local isFull = false
	for i=1, #hideTable do 	
		if  hideTable [i].vis == false then 
			isFull = false 
			break
		else  isFull = true
		end
	end
	return isFull
end

function CGU_GAME_HANGMAN.hideSentence (fraseIn)
	local tableHide = {}
	local charNum = string.len(fraseIn)
	for i = 1, charNum do 
		local currentChar = string.sub(fraseIn, i,i)
		tableHide [i] = {char = currentChar, vis = false }
	end
	return tableHide
end

function CGU_GAME_HANGMAN.getSentenceStr (hiddenTable)
	local str = "" 
	local numHits = 0
	for i = 1, #hiddenTable do
			local charOut = hiddenTable [i].char     
		hiddenTable [i].vis = CGU_GAME_HANGMAN.checkSpcl (charOut)
		if hiddenTable [i].vis == false  then 
			charOut = "█"
			numHits = numHits + 1
		elseif hiddenTable [i].vis == true then 	
			charOut =  hiddenTable [i].char			
		end
		str = str..charOut
	end
	return str, numHits
end

function CGU_GAME_HANGMAN.getSent (tableIn)
	local str = ""
	for i = 1 , #tableIn do 
		local chOut = tableIn[i].char
		if tableIn[i].vis == true then 
			str = str..chOut 
		elseif tableIn[i].vis == false then 
			str = str.."█"
		end	
	end
	return str 
end


function CGU_GAME_HANGMAN.checkSpcl (charIn)
	local vis = false
	for _,ch in pairs (specialChars) do 
		if ch == charIn then 
			vis = true
		end
	end
	
	return vis
end

function  CGU_GAME_HANGMAN.checkResult (lt, hidTbl)
	local isHit = false 
	local hits = 0
	local hideTable = {}
	local capsOn = false
	lt = string.lower(lt)	
	for nCh = 1, #hidTbl do 
		capsOn = false
		local charN = hidTbl [nCh].char
		local charn = string.lower(hidTbl [nCh].char)
		if  charN ~= charn then capsOn = true end
		local i,j = string.find(charn,lt)
		if i then 
			hits = hits + 1
			hidTbl [nCh].vis = true
			isHit = true
		end
		if capsOn then 
			hidTbl [nCh].char = charN 
		end 
		hideTable = hidTbl
	end	
	return isHit, hits, hideTable 
end

return CGU_GAME_HANGMAN