--custom
local ROOT = script.parent
local trigger = script:GetCustomProperty("Trigger"):WaitForObject()
local trig_res_op1 = script:GetCustomProperty("trig_res_op1"):WaitForObject()
local trig_res_op2 = script:GetCustomProperty("trig_res_op2"):WaitForObject()
--user exposed
local tickEnabled = ROOT:GetCustomProperty("tick_Enabled")
local velocidadDacion = ROOT:GetCustomProperty("vDador")
local resName = ROOT:GetCustomProperty("resourceName")
local eventname = ROOT:GetCustomProperty("eventName")

if velocidadDacion <= 0.3 then velocidadDacion = 0.3 end 



function OnBeginOverlap(whichTrigger, other)
	if other:IsA("Player") then
		local player = other
		script.serverUserData.owner = player
		player.serverUserData.isInTrigg = true	
		player.serverUserData.option  = whichTrigger.parent:GetCustomProperty("option")
		print(script.name.." >> "..player.name.." in option: "..player.serverUserData.option )
	end
end

function OnEndOverlap(whichTrigger, other)
	if other:IsA("Player") then
		local player = other
		script.serverUserData.owner = player
		player.serverUserData.res = 0
		player.serverUserData.isInTrigg = false
		print ("isInside ",player.serverUserData.isInTrigg)
	end
end

function OnInteracted(whichTrigger, other)
	if other:IsA("Player") then
		local player = other
		script.serverUserData.owner = player
		if player.serverUserData.option == "core" then 
			print("adding 1 "..resName)
			player:AddResource (resName,1)
		elseif player.serverUserData.option == "event" then 
			print("Sending Event ...")
			Events.BroadcastToPlayer(player,eventname,player,1)
		end
	end
end

function Tick ()
	if not tickEnabled then return end
	if Object.IsValid (script.serverUserData.owner ) then
		local player = script.serverUserData.owner
		if player.serverUserData.isInTrigg then 
			player:AddResource (resName,1)
		end 
		Task.Wait(velocidadDacion)
	end 
end 

trigger.interactedEvent:Connect(OnInteracted)
trig_res_op1.beginOverlapEvent:Connect(OnBeginOverlap)
trig_res_op2.beginOverlapEvent:Connect(OnBeginOverlap)
trig_res_op1.endOverlapEvent:Connect(OnEndOverlap)
trig_res_op2.endOverlapEvent:Connect(OnEndOverlap)
