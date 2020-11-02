// Client Lua File.

if discord_loaded then return end
discord_loaded = true

hook.Add('Initialize', 'UpdateDiscordStatus', function()

timer.Simple(1, function()
    local loaded = pcall(require,"discord_rpc")
    if not loaded then return end

    local discord_id = '' // Discord Developer Bot ID
    local discord_start = discord_start or -1

    function DiscordUpdate()
        local ip = game.GetIPAddress()
        ip = string.Replace(ip, ':27015', '')

        local maxplayers = game.MaxPlayers() 
        if game.SinglePlayer() then maxplayers = 0 end

        discord.updatePresence({
            details = "On Ship",
            state = "Venator",
            startTimestamp = discord_start,
            smallImageKey = "logo",
            smallImageText = ip,
            largeImageKey = game.GetMap(),
            largeImageText = game.GetMap(),
        })
    end

    discord_start = os.time()
    discord.init(discord_id) // Once init, you cannot change its values until map change / rejoin.
    DiscordUpdate()
end)

end)