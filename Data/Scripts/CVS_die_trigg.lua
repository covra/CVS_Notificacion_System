local trigger = script.parent
local fxFolder = (trigger:FindChildByName("fx")):GetChildren()

function OnBeginOverlap(whichTrigger, other)
	if other:IsA("Player") then
		for _,fxi in pairs (fxFolder) do 
			fxi:Play()
			other:Die()
		end
	end
end

trigger.beginOverlapEvent:Connect(OnBeginOverlap)