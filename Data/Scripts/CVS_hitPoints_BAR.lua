--custom
local BAR = script.parent
local imgC = script:GetCustomProperty("Chrysanthemum")
BAR:SetBackgroundImage(imgC)
local PANEL_ROOT = BAR.parent
local localPlayer = Game.GetLocalPlayer()
local playerTxt = PANEL_ROOT:FindChildByName("Player Name")
playerTxt.text = localPlayer.name
local playerImg = PANEL_ROOT:FindChildByName("Player Portrait")
playerImg:SetPlayerProfile(localPlayer)
--local
local oldHp = 0

function Tick ()
	local hp = localPlayer.hitPoints
	if hp ~= oldHp then 
		oldHp = hp
		updateBar(hp)
	end
end


function updateBar (hpIn)
	local maxHp = localPlayer.maxHitPoints
	local danger1 = maxHp - math.tointeger( CoreMath.Round(((maxHp *65)/100), 0) )
	local danger2 = maxHp - math.tointeger( CoreMath.Round(((maxHp *85)/100), 0) )
	BAR.progress = hpIn / maxHp
	if hpIn <= danger1 and hpIn > danger2 then 
		BAR:SetFillColor(Color.ORANGE)
	elseif hpIn <= danger2 then 
		BAR:SetFillColor(Color.RED)
	else
		BAR:SetFillColor(Color.GREEN)
	end
end