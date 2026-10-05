local ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    TriggerServerEvent('greenhudsystem:loadSettings')
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Config.HudEnabled then
            DrawHud()
        end
    end
end)

function DrawHud()
    local x, y = Config.HudPosition.x, Config.HudPosition.y
    local color = { r = Config.HudColor.r, g = Config.HudColor.g, b = Config.HudColor.b, a = Config.HudColor.a }
    local font = Config.HudFont
    local scale = Config.HudScale

    if Config.ShowPlayerId then
        DrawText('ID: ' .. PlayerData.identifier, x, y, color, font, scale)
        y = y + 0.03
    end

    if Config.ShowPlayerJob then
        DrawText('Job: ' .. PlayerData.job.label, x, y, color, font, scale)
        y = y + 0.03
    end

    if Config.ShowPlayerMoney then
        DrawText('Cash: $' .. PlayerData.money, x, y, color, font, scale)
        y = y + 0.03
    end

    if Config.ShowPlayerBank then
        DrawText('Bank: $' .. PlayerData.accounts[1].money, x, y, color, font, scale)
        y = y + 0.03
    end

    if Config.ShowServerName then
        DrawText('Server: ' .. GetConvar('sv_hostname', 'FiveM Server'), x, y, color, font, scale)
        y = y + 0.03
    end

    if Config.ShowServerPlayers then
        DrawText('Players: ' .. #GetActivePlayers(), x, y, color, font, scale)
        y = y + 0.03
    end

    if Config.ShowServerUptime then
        DrawText('Uptime: ' .. GetServerUptime(), x, y, color, font, scale)
    end
end

function DrawText(text, x, y, color, font, scale)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end

function GetServerUptime()
    local uptime = GetGameTimer() / 1000
    local hours = math.floor(uptime / 3600)
    local minutes = math.floor((uptime % 3600) / 60)
    local seconds = math.floor(uptime % 60)
    return string.format('%02d:%02d:%02d', hours, minutes, seconds)
end

RegisterNetEvent('greenhudsystem:updateSettings')
AddEventHandler('greenhudsystem:updateSettings', function(settings)
    Config.HudEnabled = settings.hud_enabled
    Config.HudPosition = { x = settings.hud_position_x, y = settings.hud_position_y }
    Config.HudColor = { r = settings.hud_color_r, g = settings.hud_color_g, b = settings.hud_color_b, a = settings.hud_color_a }
    Config.HudFont = settings.hud_font
    Config.HudScale = settings.hud_scale
end)