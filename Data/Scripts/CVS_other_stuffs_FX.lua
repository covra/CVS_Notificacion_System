local trigger = script.parent
local propFx = script:GetCustomProperty("fx")


function OnBeginOverlap(whichTrigger, other)
	if other:IsA("Player") then
	 	World.SpawnAsset(propFx,{position = trigger:GetWorldPosition()})
	end
end


trigger.beginOverlapEvent:Connect(OnBeginOverlap)