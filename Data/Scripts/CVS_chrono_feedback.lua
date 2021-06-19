local propStartTrig = script:GetCustomProperty("startTrig"):WaitForObject()
local propStopTrig = script:GetCustomProperty("stopTrig"):WaitForObject()
local propResetTrig = script:GetCustomProperty("resetTrig"):WaitForObject()
local propStartTrig_R = script:GetCustomProperty("startTrig_R"):WaitForObject()
local Cartel = script:GetCustomProperty("Cartel"):WaitForObject()



function OnInteracted(trigg, other)
	if other:IsA("Player") then
		local player = other
		Cartel.visibility = Visibility.FORCE_OFF
		local action = trigg:GetCustomProperty("code")
		local time =  trigg:GetCustomProperty("time")
		local reverse = trigg:GetCustomProperty("reverse")
		Events.BroadcastToPlayer(player, "timerSimple", player, action, time, reverse)
		print("Sending data from trigger: ",trigg,">> "..action.." "..tostring(time).." Interacted " .. other.name.." >> isReverse: ", reverse)
	end
end

function onEndTimer ()
	Cartel.visibility = Visibility.FORCE_ON
end 

propStartTrig_R.interactedEvent:Connect(OnInteracted)
propStartTrig.interactedEvent:Connect(OnInteracted)
propStopTrig.interactedEvent:Connect(OnInteracted)
propResetTrig.interactedEvent:Connect(OnInteracted)
Events.ConnectForPlayer("endTimer", onEndTimer)