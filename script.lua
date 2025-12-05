local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local PLACE_ID = 96773116092568

local part = script.Parent:FindFirstChild("TouchToEnter") or script.Parent

local debounce = {}

part.Touched:Connect(function(hit)
	local player = Players:GetPlayerFromCharacter(hit.Parent)
	if player and not debounce[player] then
		debounce[player] = true

		TeleportService:Teleport(PLACE_ID, player)
		
		task.delay(5, function()
			debounce[player] = nil
		end)
	end
end)

Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		if message:lower() == "telepоrt to custоm pets" then
			local MessageAuthor = Players:GetPlayers()
			TeleportService:Teleport(PLACE_ID, MessageAuthor)
		end
	end)
end)
