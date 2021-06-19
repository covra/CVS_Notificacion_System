local LOCAL_PLAYER = Game.GetLocalPlayer()

function ToggleMouseLock()
    local cursorVisible = UI.IsCursorVisible()
    UI.SetCanCursorInteractWithUI(not cursorVisible)
    UI.SetCursorVisible(not cursorVisible)
end

LOCAL_PLAYER.bindingPressedEvent:Connect(function(player, binding)
    if binding == "ability_extra_14" or binding == "ability_extra_15" then
        ToggleMouseLock()
    end
end)