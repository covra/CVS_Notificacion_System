

local WisPills = {
				{ "You never influence the world by trying to be like it"},
				{ "To play a wrong note is insignificant\n To play without passion is inexcusable\n Beethoven"},
				{ "Don't wait to be rich to be happy\n Hapiness is free"},
				{ "Your perception of me is a reflection of you"},
				{ "When sh!t happens, turn it into fertilizer\n Kute Blackson"},
				{ "If you think you're too small to make difference..\n try sleeping with a mosquito in the room\n Dalai Lama"},
				{ "If it doesn't open, it's not your door"},
				{ "Forget the past, remember the lesson"},
				
				}
				
local NerdPills = {
				{ "...Real Life? Never Heard of that server.."},
				{ "Superman: single\n Batman: single\n spiderMan: single\n I get it now, I'm single because I'm a superhero!"},
				{ "Keep calm\n and be an Avenger"},
				{ "You're a unit of power, Harry!\n I'm watt?"},
				{ "Don't drive and derive\n Math'ians\n Against\n Drunk\n Deriving\n Know your limits!"},
				{ "There's a fine line between a numerator and a denominator\n Only a fraction of you will understand this\n Some people will appreciate these jokes, some don't... the division is clear"},
				{ ".. + HCOONa 'matata'"},
				{ "Want to hear a joke about Sodium?\n Na"},
				{ "Dear Algebra, please stop asking us to find your X\n She's never comming back\n and don't ask y"},
				{ "Warrior: I swear I will Have my revenge for the death of my brother\n Elf: You have my bow\n Dwarf: And my axe\n Necromancer:And your brother"},
				{ "If internet explorer is brave enough to ask you to be your default browser\n You're brave enough to ask that girl out"},
				} 

local WisPillsPercent = 30


local CGU_GAME_PILLS = {}

function CGU_GAME_PILLS.giveMeOne()
	local strOut = ""
	local randS= math.random(1,100)
	if randS <= WisPillsPercent then 
		local randN = math.random (1,#WisPills)
		strOut = WisPills [randN]
	else
		local randN = math.random (1, #NerdPills)
		strOut = NerdPills [randN]
	end
	return strOut
end


return CGU_GAME_PILLS