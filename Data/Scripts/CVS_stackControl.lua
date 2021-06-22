--require
local CVS_NOTIFY_API = require( script:GetCustomProperty("CVS_NOTIFY_API") )
--custom
local ROOT_W= script.parent
local BT_BODY = script:GetCustomProperty("bodyTextBt"):WaitForObject()
local BT_CLOSE = script:GetCustomProperty("closeBt"):WaitForObject()
local origW = ROOT_W.width
local origH = ROOT_W.height
local WIN_REF = ROOT_W:GetReference()
--local
local localPlayer = Game.GetLocalPlayer()
local list1 = nil
local list2 = nil
local isClose = true 

function onClick (btn)
	if btn == BT_BODY then
		isClose = not isClose
		if not isClose then
			CVS_NOTIFY_API.animWindow(WIN_REF, true)
		else 
			CVS_NOTIFY_API.animWindow(WIN_REF, false)
		end 
	elseif btn == BT_CLOSE then 
		CVS_NOTIFY_API.closeWindow(ROOT_W)
	end 
end

list1 = BT_BODY.clickedEvent:Connect( onClick )
list2 = BT_CLOSE.clickedEvent:Connect( onClick )
list3 = script.destroyEvent:Connect( function(obj) 
									list1:Disconnect()
									list2:Disconnect()
									end )