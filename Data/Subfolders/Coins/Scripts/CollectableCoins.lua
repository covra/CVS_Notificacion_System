function OnPlayerJoined(player)
	print("player joined: " .. player.name)

	-- Load server variables
	local data = Storage.GetPlayerData(player)

	local coins = data["Coins"] or 500

	-- Set local variables
	player:SetResource ("Coins", coins)
end

function OnPlayerLeft(player)
	print("player left: " .. player.name)

	OnDataSave(player) -- Save XP when player quits

end

function OnDataSave(player)

	local data = Storage.GetPlayerData(player)

	local coins = player:GetResource("Coins")

	data["Coins"] = coins

	Storage.SetPlayerData(player, data)

end

-- on player joined/left functions need to be defined before calling event:Connect()
Game.playerJoinedEvent:Connect(OnPlayerJoined)
Game.playerLeftEvent:Connect(OnPlayerLeft)