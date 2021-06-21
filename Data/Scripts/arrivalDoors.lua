local trigger = script.parent
local EventName = trigger:GetCustomProperty("eventName")

function OnBeginOverlap(whichTrigger, other)
	if other:IsA("Player") then
		print( other.name.." found the party!, notifying custom event...")
		Events.Broadcast(EventName,"WORLD",EventName,other)
	end
end


trigger.beginOverlapEvent:Connect(OnBeginOverlap)
