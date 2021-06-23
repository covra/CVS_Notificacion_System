local trigger = script.parent
local taskDamage = nil
local  BASE_DMG = 1
function OnBeginOverlap(whichTrigger, other)
	if other:IsA("Player") then
		local player = other
		player.maxWalkSpeed = player.maxWalkSpeed / 3
		taskDamage = Task.Spawn(function()
			local dmg = Damage.New(BASE_DMG)
			while true do 
				dmg.amount = dmg.amount + 1
				player:ApplyDamage(dmg)
				Task.Wait(1)
			end 
		end)
		--Events.Broadcast(EventName,"WORLD",EventName,other)
	end
end

function onEndOverlap (trigg, other)
	if other:IsA("Player") then
		local player = other
		player.maxWalkSpeed = player.maxWalkSpeed * 3
		taskDamage:Cancel()
		BASE_DMG = 1
	end 
end 



trigger.beginOverlapEvent:Connect(OnBeginOverlap)
trigger.endOverlapEvent:Connect( onEndOverlap )
