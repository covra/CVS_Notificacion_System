Task.Wait() 
local player = Game.GetLocalPlayer()

function Tick()
    Task.Wait(0.1)
    local score = player:GetResource("Coins")
    local displayString = ""..tostring(score or 0)
    script.parent.text = displayString
end