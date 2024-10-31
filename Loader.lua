local SupportedGames = {
    [17310566965] = {
        Name = "Unwavering Soul",
        Version = "1.0.0"
    }
}

local LocalPlayer = game.Players.LocalPlayer
local CurrentGameID = game.PlaceId
local CurrentGame = SupportedGames[CurrentGameID]

if CurrentGame then
    local CurrentVersion = "1.0.0"

    if CurrentVersion == CurrentGame.Version then
        print("You are using the latest cheat version for " .. CurrentGame.Name)

        if getgenv().Key == "uWUk1gJI2OlWmm7AHSuoS6daTqQvEnCH" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LunarClientScript/Lunar/refs/heads/main/Lunar.lua"))()
        else
            print("You are using the old key")
        end
    else
        LocalPlayer:Kick("A newer cheat version for " ..  CurrentGame.Name .. " is available.")
    end
else
    LocalPlayer:Kick("This game is not supported.")
end
