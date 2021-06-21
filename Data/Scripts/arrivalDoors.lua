local trigger = script.parent

function OnBeginOverlap(whichTrigger, other)
	if other:IsA("Player") then
		print( other.name.." arrived to the Big Doors, notifying custom event...")
		Events.Broadcast("poolParty","
	end
end


trigger.beginOverlapEvent:Connect(OnBeginOverlap)
