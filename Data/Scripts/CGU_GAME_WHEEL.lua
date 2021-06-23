

local sentences_cat1 = { cat = "Movie quotes" ,frss =  {
				"Elementary, my dear Watson",		
				"Houston, we have a problem",
				"May the Force be with you",
				"To be or not to be, that is the question",
				"Whatever you are, be a good one",
				"You talkin' to me?",
				"I'm gonna make him an offer he can't refuse",
				"Just keep swimming",
				"A million dollars isn't cool. You know what's cool? A billion dollars.",
				"I am Groot",}
				}

local sentences_cat2 = { cat = "Sayings", frss = {
				"Don’t count your chickens before they are hatched",		
				"Barking dogs never bite",
				"Better the devil you know than the devil you don't know",
				"God tempers the wind to the shorn lamb",
				"Monkey see, monkey do",
				"He who laughs last, laughs best",
				"In the country of the blind, the one-eyed man is king",
				"The shoemaker’s son always goes barefoot",
				"If you run after two hares you will catch neither",
				"Early to bed, early to rise, makes the man healthy, wealthy and wise",}
				}

local sentences_cat3 = { cat = "World Food", frss = {
				"Buttered popcorn, United States",		
				"Masala dosa, India",
				"Parma ham, Italy",
				"Seafood paella, Spain",
				"Som tam, Thailand",
				"Chicken rice, Singapore",
				"Poutine, Canada",
				"Tacos, Mexico",
				"Buttered toast with Marmite, UK",
				" Marzipan, Germany",}
				}

local globalPhrases = { sentences_cat1, sentences_cat2, sentences_cat3 }

local helpStr = "The roulette wheel will spin in each turn and, depending on what comes out, player will multiply the hits, plus bonuses. The last person to finish the sentence wins.To show this help type /?w. To hit a letter type ie:   -a     To see the hidden sentence, type -show \n"

local drawWheel = {
					"\n",
					"------OOOO------",
					"----OOO  OOO-----",
					"---OOO    OOO----",
					"----OOO  OOO-----",
					"------OOOO-------",
					"                 ",
					"___.o WHEEL OF FORTUNE.o___",
					"\n",
					}					


local specialChars = {" ", "'", ",", ".", "!", "?"}					
					
local sysMssg =  {
					[1] = "Welcome to Wheel Of Fortune!", 				 
					[2] = "Next turn to >>  ",
					[3] = "Type a letter>>     ie: -r",
					[4] = "-----Wheel of Fortune-----","The sentence to discover will be:",
					[5] = " You finished the sentence! ",
					[6] = " You can try again! ",
					[7] = " Winner player is missing!! CASH will go to....   ",
					[8] = " JACKPOT!!! :",
					[9] = " PRIZE!!",
					[10] = " oooOooOOOOo!!! Bankruptcy! \n ",
					[11] = " LOOSE TURN! \n ",
					[12] = " 5 seconds , and we will START...",
					[13] = "you MISS that letter! pass turn.",
					}
local errorCodes =  {
					[1] = {""},
					}

local roulette = {
					[1] = {name = "JackPot !!!",qty = 20, prize = 500  },
					[2] = {name = "* Loose Turn *",qty = 0 , xtra = 1},
					[3] = {name = "Bankruptcy",qty = 10, xtra = 2 },
					[4] = {name = "Prize",qty = 10, prize = 100 },
					[5] = {name = "x5",qty = 5 },
					[6] = {name = "x3",qty = 3  },
					[7] = {name = "...0...!",qty = 0 },
					[8] = {name = "x2",qty = 2 },
					[9] = {name = "Prize!",qty = 10, prize = 100  },
					[10] = {name = "x5",qty = 5 },
					[11] = {name = "x2",qty = 2 },
					[12] = {name = "x1" ,qty = 1 },
					[13] = {name = "...0...!",qty = 0 },
					[14] = {name = "x2",qty = 2 },
					[15] = {name = "Prize",qty = 10, prize = 100  },
					[16] = {name = "x5",qty = 5 },
					[17] = {name = "* Loose Turn *",qty = 0, xtra = 1 },
					[18] = {name = "x2",qty = 2 },
					[19] = {name = "x1" ,qty = 1 },
					[20] = {name = "x2" ,qty = 2 },
					}
---------------------------------------------FUNCTIONS-----------------------------------

local CGU_GAME_WHEEL = {}

function CGU_GAME_WHEEL.drawWheel()
	return drawWheel
end

function CGU_GAME_WHEEL.sysMsg (codMsg)
	return  sysMssg [codMsg]
end

function CGU_GAME_WHEEL.errMssg (codMsg)
	return errorCodes [codMsg]
end

function CGU_GAME_WHEEL.getSwheel (numIn)
	return roulette[numIn]
end

function CGU_GAME_WHEEL.getSlotsW ()
	return #roulette
end

function CGU_GAME_WHEEL.getPrize (isJack)
	if isJack then
		return roulette[1].prize
	else 
		return roulette[4].prize
	end
end

function CGU_GAME_WHEEL.showHelp()
	return helpStr
end

function CGU_GAME_WHEEL.getSentence()
	local str = ""
	local currentCat = globalPhrases [math.random (1,#globalPhrases)]
	local strC = currentCat.cat
	local strF = currentCat.frss [math.random (1, #currentCat.frss)]
	print(script.name.." >> [Debug] new sentence: ", strC, strF)
	return strF, strC
end

function CGU_GAME_WHEEL.checkIsFull (hideTable)
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

function CGU_GAME_WHEEL.hideSentence (fraseIn)
	local tableHide = {}
	local charNum = string.len(fraseIn)
	for i = 1, charNum do 
		local currentChar = string.sub(fraseIn, i,i)
		tableHide [i] = {char = currentChar, vis = false }
	end
	return tableHide
end

function CGU_GAME_WHEEL.getSentenceStr (hiddenTable)
	local str = ""  --out leible string
	for i = 1, #hiddenTable do
			local charOut = hiddenTable [i].char     
		hiddenTable [i].vis = CGU_GAME_WHEEL.checkSpcl (charOut)
		if hiddenTable [i].vis == false  then 
			charOut = "█"
		elseif hiddenTable [i].vis == true then 	
			charOut =  hiddenTable [i].char			
		end
		str = str..charOut
	end
	return str
end

function CGU_GAME_WHEEL.getSent (tableIn)
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


function CGU_GAME_WHEEL.checkSpcl (charIn)
	local vis = false
	for _,ch in pairs (specialChars) do 
		if ch == charIn then 
			vis = true
		end
	end
	
	return vis
end

function  CGU_GAME_WHEEL.checkResult (lt, strf, hidTbl)
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



return CGU_GAME_WHEEL