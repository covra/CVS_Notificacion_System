--require
local EaseUI = require( script:GetCustomProperty("EaseUI") )
--custom
local NUM = script:GetCustomProperty("Numbers"):WaitForObject()
local OBJ = script:GetCustomProperty("IconOutline"):WaitForObject()
local TIME_ANIM = 0.3
--local
local localPlayer = Game.GetLocalPlayer()
local origW = OBJ.width
local origH = OBJ.height

function onJoin (player)
	NUM.text = tostring(#Game.GetPlayers())
	anim()
end

function anim ()
	EaseUI.EaseWidth(OBJ, origW * 2, TIME_ANIM, EaseUI.EasingEquation.ELASTIC,EaseUI.EasingDirection.IN)
	EaseUI.EaseHeight(OBJ, origH * 2,TIME_ANIM, EaseUI.EasingEquation.ELASTIC, EaseUI.EasingDirection.OUT)
	Task.Wait(TIME_ANIM)
	EaseUI.EaseWidth(OBJ, origW, TIME_ANIM, EaseUI.EasingEquation.ELASTIC,EaseUI.EasingDirection.IN)
	EaseUI.EaseHeight(OBJ, origH,TIME_ANIM, EaseUI.EasingEquation.ELASTIC, EaseUI.EasingDirection.OUT)
end



Game.playerJoinedEvent:Connect( onJoin )
