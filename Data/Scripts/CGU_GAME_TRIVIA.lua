
local Trivia = {
				"▒▒▒▒▒▒▒",
				"▒            ▒",
				"▒▒         ▒",
				"          ▒",
				"        ▒",
				"      ▒",
				"   ▒",
				"   ▒   ",
				"     ",
				"  ▒▒   ",
				"         ",
				"TRIVIA¬░┤ QUIZ® ",
				"├─┼├─┼├─┼├─┼├─┼"
				
				}

local helpStr = " Try to answer all questions without rush. At the end of the time, the one who answer more, will win extra points.You should answer with a single word, but try to be the most accurate you can. Type ie: -pacific . To see this help, type /?t  \n"					
local sysMssg =  {
					[1] = "Welcome to Trivia___.o0|╔╦╩ \n", 		
					[2] = ">> Receiving data from ", 
					[3] = " was the player who answered more questions. Is the WINNER \n", 
					[4] = "Receiving data from players, please wait...", 
					[5] = "No more single questions on the DB, game will end ", 
					[6] = "Next question: ", 
					[7] = "------>>> ", 
					[8] = "The answer is CORRECT!! ", 
					[9] = "The answer DOESN'T MATCH with the keywords...maybe next time", 
					[10] = " >> TIME is OVER << \n", 
					[11] = "", 
					[12] = "", 				
				}

local questions = {
					{q = "7-Eleven stores were temporarily converted into Kwik E-marts to promote the release of what movie?", k = {"SIMPSONS","SIMPSON"} },
					{q ="Famous for their work on modernist furniture design, Charles and Ray Eames were related how?", k = {"HUSBAND","WIFE"} },
{q ="A 1952 episode of “I Love Lucy was titled “Lucy Is Enceinte” because what English word was censored?", k ={ "PREGNANT"} },
{q ="A 1960s TV character played by Al Lewis, Count Vladimir Dracula is better known by what name?", k = {"GRANDPA","MUNSTER"} },
{q ="A 1985 North Atlantic expedition led by Robert Ballard discovered the wreck of what famous ship 73 years after it sank?", k = {"TITANIC"}},
{q ="A 1995 documentary subtitled “Hollywood Madam” examines the rise and fall of what scandalous figure?", k = {"HEIDI","FLEISS"}},
{q ="A 2006 study of phone conversations found that which statement was meant sarcastically 23 percent of the time?", k = {"YEAH","RIGHT"}},
{q ="A 2008 study in “Reference Services Review” found which of these websites to be about 80% accurate?", k = {"WIKIPEDIA"}},
{q ="A 2009 New York Times article coined the term “Ralph Kramden” to refer to what physical trait?", k = {"POT","BELLY"}},
{q ="A 2010 Billboard hit,”Dog Days are Over” is a song by the British band “Florence and the” what?", k = {"MACHINE"}},
{q ="A 2010 study by dating Web site Badoo.com found which of these nation’s women to be most flirtatious online?", k = {"SPAIN"}},
{q ="A 2010 study found that nearly 70% of what imported item failed to live up to its claims of being “extra virgin”?", k = {"OLIVE","OIL"}},
{q ="A 2010 Time magazine article debunks the myth that what group of people are “spoiled,selfish,solitary misfits”?", k = {"ONLY","CHILDREN"}},
{q ="A 2011 box set celebrates the 13-film collaboration between composer Danny Elfman and what film director?", k = {"TIM","BURTON"}},
{q ="A 2011 New York Times obituary for the late Peter Falk discussed the actor’s 30-plus year gig as what TV character?", k = {"COLUMBO"}},
{q ="A 20th-century fashion icon, Gabrielle Chanel was better known by what nickname?", k = {"COCO"}},
{q ="A bill of fare is more commonly known as a what?", k = {"MENU"}},
{q ="A bit in a gossip column that doesn’t mention any names is often called a what?", k = {"BLIND", "ITEM"}},
{q ="A bit of folk wisdom warns that when you point a finger at someone, how many fingers are pointing back at you?",k = {"THREE"}},
{q ="A blacksmith works primarily with what metal?", k = {"IRON"}},
{q ="A blanket or shawl made of colored squares sewn or crocheted together is called a what?", k = {"AFGHAN"}},
{q ="A book about fashion and gay culture “Don We Now Our Gay Apparel” takes its title from what Christmas carol?", k = {"DECK","HALLS"}},
{q ="A Boston native,what late night host’s sister made her film debut as one of the Eklund sisters in “The Fighter”?", k = {"CONAN", "BRIEN"}},
{q ="A breakthrough in fashion,”jeggings” are leggings designed to look like what?", k = {"JEANS"}},
{q ="A bushel is a standard unit originally used to measure the weight of what?", k = {"GRAIN"}},
{q ="A caprese salad traditionally includes which of these ingredients?", k = {"MOZZARELLA"}},
{q ="A caramel candy brand since 1903,Werther’s Original is named after a town in the Westphalia region of what country?", k = {"GERMANY"}},
{q ="A cast member of the AMC series “Hell On Wheels,” rapper/actor Lonnie Lynn, Jr. is better known by what stage name?", k = {"COMMON"}},
{q ="A chemical compound known as DHA is a common active ingredient in what beauty product?", k = {"SELF","TANNER"}},
{q ="A child starting kindergarten in September 2010 will ordinarily graduate from high school in what year?", k = {"2023"}},
{q ="A child starting kindergarten in September of 2010 will ordinarily graduate from high school in what year?", k = {"2023"}},
{q ="A clarsach–a traditional Irish musical instrument–is a kind of what?", k = {"HARP"}},
{q ="A classic 1969 work by poet Maya Angelou is titled “I Know Why The Caged Bird” what?", k = {"SINGS"}},
{q ="A classic 1976 song by Blue Oyster Cult features the advice “Don’t Fear The” what?", k = {"REAPER"}},
{q ="A classic 1984 Super Bowl commercial titled “1984” introduced what product to the public?", k = {"MACINTOSH"}},
{q ="A close friend of her Greek actor father,Telly Savalas was the godfather of which of these movie stars?", k = {"ANISTON"}},
{q ="A collection of Sanskrit hymns and verses known as the Vedas are sacred texts in what religion?", k = {"HINDUISM"}},
{q ="A college graduate who participates in an ROTC program graduates with a what?", k = {"MILITARY","COMMISSION"}},
{q ="A common ailment,dyspepsia gets its name from Greek roots meaning “bad” what?", k = {"DIGESTION"}},
{q ="A common ingredient in ice cream and toothpaste, carrageenan is an extract of what?", k = {"SEAWEED"}},
{q ="A common Italian expression, “dolce far niente” means “the sweetness of” what?", k = {"DOING","NOTHING"}},
{q ="A common palindrome begins “A man,a plan,a canal” and ends with what country’s name?", k = {"PANAMA"}},
{q ="A common pose in yoga,the “plank” position closely resembles which of these routine exercises?", k = {"PUSH","UPS"}},
{q ="A common problem during childhood, nocturnal enuresis is a medical term better known as what?", k = {"BED","WETTING"}},
{q ="A common site for piercings, the auricle is a cartilaginous region located where on the body?", k = {"EAR"}},
{q ="A company known for its atlases and maps was born when William Rand went into business with whom?", k = {"ANDRE","MCNALLY"}},
{q ="A contestant on the 2012 season of “Celebrity Apprentice,” Dee Snider won fame as frontman for what ’80s band?", k = {"TWISTED","SISTER"}},
{q ="A contestant on the Fall 2011 season of “Dancing With The Stars,” Carson Kressley first gained fame on what reality show?", k = {"QUEER","EYE"}},
					}


------------------------------------------- FUNCTIONS --------------------------------------
local CGU_GAME_TRIVIA = {}

function CGU_GAME_TRIVIA.showHelp() 
	return helpStr
end

function CGU_GAME_TRIVIA.drawTrivia()
	return Trivia
end

function CGU_GAME_TRIVIA.buildTable()
	return questions
end

function CGU_GAME_TRIVIA.sysMsg (codMsg)
	return  sysMssg [codMsg]
end

function CGU_GAME_TRIVIA.giveMeQuestion(tblIn)
	if #tblIn ~= nil then  
		local randQ = math.random(1,#tblIn)
		local lineQ = tblIn [randQ]
		table.remove(tblIn,randQ)
		return lineQ
	else 
		return false 
	end
end

function CGU_GAME_TRIVIA.checkResult(mssgIn, tableAnswIn)
	mssgIn = string.upper(mssgIn)
	local isOk = false
	for _,keyWord in pairs (tableAnswIn) do 
		if keyWord == mssgIn then 
			isOk = true	
			break
		else 
			isOk = false 
		end 
	end
	return isOk
end

return CGU_GAME_TRIVIA
