local obj = script.parent
obj.clientUserData.isSet = false
obj.clientUserData.pos = 1

function Tick ()
	if not obj.clientUserData.isSet  then return end 
	obj.y = _G.dynamicHeight - (obj.height * (_G.numStacks - obj.clientUserData.pos))
end 