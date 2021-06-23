
local UI_miniT = script:GetCustomProperty("UI_miniT"):WaitForObject()
local currentTime = 0
local isDone = false
local timeZero = 0

function Tick ()
	if _G.timeTo == nil or  isDone then return 
	else 
		currentTime = time() - timeZero
		UI_miniT.text = tostring( CoreMath.Round(currentTime, 1) )
		if currentTime  >= _G.timeTo then 
			isDone = true
			Events.Broadcast("miniT", false)
			Task.Wait()
		end		
	end
	Task.Wait()
end


timeZero = time()



