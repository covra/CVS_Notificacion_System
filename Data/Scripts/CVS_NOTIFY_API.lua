--content
local tableCodeTitles = { 
				["max"] = { preTitle = "RESOURCES", Title = "reached maximum"},
				}
				
local tableColors = {
				["READ"] = {},
				["RESOURCES"] = { head = Color.ORANGE, body = Color.ORANGE},
				["GAME"] = { head = Color.CYAN, body = Color.FromLinearHex("010618FF")},
				["WORLD"] ={ head = Color.CYAN, body = Color.FromLinearHex("010618FF")},
				["PLAYER"] = { head = Color.CYAN, body = Color.FromLinearHex("010618FF")},
				}
--custom
local SIDE_PANEL = World.FindObjectByName("UI Side Panel")	
local REF_STACK = World.FindObjectByName("stackWindow_ref")
local STACK_ID = REF_STACK.sourceTemplateId
--local
local localPlayer = Game.GetLocalPlayer()

--------------------------------------------------API--------------------------------------

local CVS_NOTIFY_API = {}

function CVS_NOTIFY_API.sendNotification (typeCode, data_1, data_2)
	print(script.name.." Sending stack notification >>"..typeCode.." // ", data_1," // ", data_2) 
	local stackWindow = World.SpawnAsset(STACK_ID,{parent = SIDE_PANEL}) 
	animStack(stackWindow)
end




return CVS_NOTIFY_API