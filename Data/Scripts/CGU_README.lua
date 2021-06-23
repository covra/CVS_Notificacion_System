--[[

				CVS-CoVraworkS-by Covra
				=======================
			https://discord.gg/jW6dEBu6xE

- The Template is ready to Drag&Drop to hierarchy. You will only have to 'play' with exposed parammeters in the custom properties on root folder
- All the games are played via chat. Only I had to leave outside the timer...  Please customize it!
- I have thought of this template to give it an evolution. IF you have any questions, complaints or suggestions, do not hesitate to send them to me
- There are some special features, which I have not had time to finish implementing, so, much to my regret, 
  I have left them out (such as the control routine for activating and deactivating games by events or by main game active),
  but that it won't take long to get them ready. 


* CUSTOMIZATION
---------------
The template is designed to be personalized as much as possible without interfering with the operation of the games.
You can set the USER EXPOSED PROPERTIES in the main root folder and by far, the LOADING SCRIPTS for each of the games.
You can change language, text and many parameters to create an individual experience.
	
	EDITABLE LOADING SCRIPTS:
	~~~~~~~~~~~~~~~~~~~~~~~~~
		- CGU_GAME_BATTLE
		- CGU_GAME_WHEEL
		- CGU_GAME_HANGMAN
		- CGU_GAME_PILLS
		- CGU_GAME_TRIVIA
		- API_CONTENT_CGU
		
To DEBUG the system there are a lot of 'prints' that send information to the LOG.
The variable that controls it in the server / client environment is 'debugPrint'.
It can be accessed in the server environment by the 'Custom properties' or manually in each script
 on the client side.

* PLAYER STORAGE
-----------------
 >>Property: 'savePlayerData' values =   enabled / disabled
 
 >> Tooltip: If enabled, statics and rewards  ( data type = Resources) will be saved using Core regular Storage Player Data.
 If you have a different / customized system of player data , set this to false and save data (if needed) by your own.
 Default = enabled
 
- In order to recognize previous game joinning,  CGU uses a resource called "hasJoinedBefore". If this resource is > 1, the system
will try to load player data. If this resource is < = 0, then the system will assign player new data / statics.
If 'savePlayerData' is enabled, CGU will manage all this.

- If you use a customized player data, the system will wait 'TIME_TO_STORAGE = 5' seconds to your system loads player resources.
You can  edit this value (script: 'CGU_Main_server').


			TIPS FOR MINI-GAMES
			-------------------
OVERALL
======
 >> With the '/silence' and '/nosilence' commands (I had to change them so that they did not coincide with those of Core) 
 	you can mute most of the system messages (Some games generate a large number of messages but, you will miss the fun !!; )) 

PILLS
=====
 >> The pills were created so that, at any time, the player receives a phrase of knowledge about something .. 
	 By default, they are phrases taken from the internet, of different topics, but you can put things about yourself, 
	 your social networks, your team, or your indie studio.

BATTLESHIP
==========
 >> It is difficult to find a balance between the total time to prepare the board (place your ships)
 	and the waiting time of the rest of the players. To do this, the '/auto' option was added. 
 	With it, the boats are positioned based on tables. The variety is minimal (4 options), but as you will quickly see,
 	many more tables can be created (in addition, they can be used reversibly) ... 
 	anyway, you will always have the option of putting the boats one by one ;)

THE HANGMAN // THE WHEEL OF FORTUNE
===================================
 >> If you want to add more categories, just:
 	1- create a table like already exists in CGU_GAME_HANGMAN or CGU_GAME_WHEEL scripts
 	2- add your new table in 'globalPhrases'
 >> If you want to add more words or sentences, just add them  at the 
 	end of a pre-existing table in CGU_GAME_HANGMAN or CGU_GAME_WHEEL scripts. 
 	The system will handle them

TRIVIA
=====
 >> In the internet there big quiz databases with thousands of  questions. You can use one of them or create your own one.
 	This link has one of them, you can copy / paste and with some minor adjustments, can be usable. Just remember to set properly
 	the key words, to match the answer:
	https://docs.google.com/spreadsheets/d/0Bzs-xvR-5hQ3SGdxNXpWVHFNWG8/edit#gid=973958003



PD: If you want this in SPANISH just tell me ;)






















--]]


