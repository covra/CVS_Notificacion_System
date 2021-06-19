--custom
local CLIENT_ROOT = script.parent
local UI_CONTAINER = World.FindObjectByName("CVS UI Notify Container")
if UI_CONTAINER == nil then error (" You have to set properly the name of the UI container in the script") end
local SIDE_PANEL = UI_CONTAINER:FindDescendantByName("UI Side Panel")
if SIDE_PANEL == nil then error (" You have to set properly the name of the Side Panel in the script") end
local STACK_WIDTH = CLIENT_ROOT:GetCustomProperty("stack_Width")
local STACK_HEIGHT = CLIENT_ROOT:GetCustomProperty("stack_Height")


function Tick ()
	local SCREEN_SIZE = UI.GetScreenSize()
	_G.dynamicWidth = math.tointeger(CoreMath.Round((SCREEN_SIZE.x * STACK_WIDTH)/100, 0))
	_G.dynamicHeight = math.tointeger(CoreMath.Round((SCREEN_SIZE.y * STACK_HEIGHT)/100, 0))
	SIDE_PANEL.width = _G.dynamicWidth
	SIDE_PANEL.height = _G.dynamicHeight
end 