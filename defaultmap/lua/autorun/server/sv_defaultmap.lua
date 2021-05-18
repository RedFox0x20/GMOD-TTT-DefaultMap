--[[ 
	sv_defaultmap.lua by RedFox0x20

	For use on TTT servers that want to have a default map to switch back to
	when player activity has reduced.

	When a player disconnects from the server, check to see if any players are
	online. If there are no players or all players are spectators then change
	to the default map.

	We only want this script to run for TTT servers
]]--
hook.Add("PostGamemodeLoaded", "defaultmap_postgamemode", function()		

	if (gmod.GetGamemode().Name ~= "Trouble in Terrorist Town") then
		print("[defaultmap] Not running! Gamemode is not TTT")
		return
	end

	--[[
		Config
	--]]
	rf_ttt_defaultmap = {}
	rf_ttt_defaultmap.map = "ttt_minecraft_b5"

	--[[
		Change to the default map as named in rf_ttt_defaultmap.map.
	]]--
	function defaultmap_ChangeMap()

		--[[
			We only want to changelevel if the current map is not the default map 
		]]--
		if (game.GetMap() ~= rf_ttt_defaultmap.map) then
			print("[defaultmap] Changing map to " .. rf_ttt_defaultmap.map)
			RunConsoleCommand("changelevel", rf_ttt_defaultmap.map)
		end
	end

	--[[
		Perform any checks before we switch the map, called by the
		PlayerDisconnected hook.
	]]--
	function defaultmap_playerdisconnect(dc_ply)

		local rf = RecipientFilter()
		rf:AddAllPlayers()
		rf:RemovePlayer(dc_ply)

		--[[
			Check if players are on the server.
			If players are on the server, check to see if they are all spectators.
			If a player is not spectating then we shouldn't switch to the default
			map.
		]]--
		if (rf:GetCount() ~= 0) then
			for _, ply in ipairs(player.GetAll()) do
				if (not ply:IsSpec()) then
					return
				end
			end
		end

		--[[
			No players or all spectators, switch to the default map.
		]]--
		defaultmap_ChangeMap()
	end

	--[[
		Check on disconnect
	]]--
	hook.Add(
			"PlayerDisconnected",
			"defaultmap_disconnect",
			defaultmap_playerdisconnect)
end)
