--[[

				CVS-CoVraworkS-by Covra
				=======================
			https://discord.gg/jW6dEBu6xE
						covra#6258


INSTRUCTIONS
--------------
- The Template is ready to Drag&Drop to hierarchy. You will only have to 'play' with exposed parammeters in root folders

- At the content you can find:
			- CVS_MAIN_NOTIFY : main folder , has to be in the hierarchy
			- CVS_Timer Notifier : a simple UI chrono scripted (normal and backwards), animated and  working with the notification system
			- CVS_Resource Notifier_1: a UI resource scripted, animated and  working with the notification system
			- CVS_Resource Notifier_2:  a sencond example of UI resource scripted, animated and working with the notification system
			- CVS Simple Player HUD: a simple player HUD (image profile, hitpoint bar and total players in game)
			- CVS_LockUnlock_Cursor: an utility to lock and unlock cursor with 'ALT' key (to interact with stack windows)
			- CVS TEST NOTIFICATIONS: a set of 'mini-games' to allow you to try maybe, understand better how works the system
			
TIPS
-----
- There are 2 models of UI resources, both send notifications to the API according to exposed properties (play with them!)
- You can add to the game,  those resource templates, as much as you want, or resources you need (apples, coins, iron, wood, points, lifes, ....)
- I have added also a simple chrono. This works normal or backwards, The UI chrono template has all scripts to work with the notification system
- I tried to do the most flexible as i could, but the quantity of events and objects involved made this hard. 
- I'd added a lot of 'warnings' to validate as much as i could  possible errors
- I'd added tooltips in every user exposed custom properties to explain how they work
- Watch the CVS_NOTIFY_API file, all the names of the  customized events have to match. There, also,  you can customize names and texts
- You can customize the stack_window of notifications watching they have to have  UIText called 'bodyText'  and a UIText called 'Title',
	to the system will be able to write properly the notifications
- Any suggestion, doubt, improve or whatever , please DM me



>> Special thanks to CardinalZebra for CC 'Universal UI Kit'.It's the base for most of UI
>> Also used the CC 'Cave/Mountain' template  from Staypunny to setup a part of the 'test scenario'


EXAMPLES
-------
- You want to track the quantity of apples the player has
	1. Use the CVS_Resource Notifier_1 template and add it to the hierarchy
	2. Customize how looks like or size or colors...
	3. Customize in user exposed custom properties:
		- resource name
		- animation
		- how the bar grows
		- if you want notifications when arrives at a predeterminated quantity
		-...
	-You can see the example inside the folder CVS TEST NOTIFICATIONS > CVS_Resource_Giver
	
	
- You have a special equipment and when a player equip it, you want to show a notification:
	1. Place the equipment in the game
	2. Open the CVS_NOTIFY_API script
	3. Add the name in the table 'tableGame', inside the name table (in the example you can find one called : "Advanced Staff"
	-You can see the example inside the folder CVS TEST NOTIFICATIONS > CVS powerStaff equipment
	

- You want to notify all players when one of them arrives to a predeterminated place:	
	1. Open the  CVS_NOTIFY_API script
	2. Look for  table 'WORLD-custom' inside 'tableGame'
	3. Add a new event name to be connected by the system, ie: [4] = "heaven's door"
	4. Create the place and include a trigger
	5. When the trigger is activated , Broadcast the event: Events.Broadcast(EventName,"WORLD",EventName,player)
	-You can see the example inside the folder CVS TEST NOTIFICATIONS > CVS Custom Events
	
	
	where you can find  equipment and custom events:
	
					typeCode      data_1	Names of the objects the system need to find
					----------   ------   ----------------------------------------------
local tableGame = {	["GAME"] = { ["eq"] = { "Advanced Staff"}}, --The system will look for a equipment in the hierarchy called:     Advanced Staff      
					["WORLD"] = {["custom"] = {
											[1] = "poolParty", --The system will connect these events 
											[2] = "doorTrigg",
											[3] = "bridge",
	

 If you want this in spanish, just tell me ;)
]]--