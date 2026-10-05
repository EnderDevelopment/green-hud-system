local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('greenhudsystem:loadSettings', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchAll('SELECT * FROM player_hud_settings WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result[1] then
            cb(result[1])
        else
            MySQL.Async.execute('INSERT INTO player_hud_settings (identifier) VALUES (@identifier)', {
                ['@identifier'] = identifier
            }, function()
                cb({
                    hud_enabled = true,
                    hud_position_x = 0.01,
                    hud_position_y = 0.01,
                    hud_color_r = 0,
                    hud_color_g = 255,
                    hud_color_b = 0,
                    hud_color_a = 200,
                    hud_font = 4,
                    hud_scale = 0.4
                })
            end)
        end
    end)
end)

RegisterNetEvent('greenhudsystem:saveSettings')
AddEventHandler('greenhudsystem:saveSettings', function(settings)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.execute('UPDATE player_hud_settings SET hud_enabled = @hud_enabled, hud_position_x = @hud_position_x, hud_position_y = @hud_position_y, hud_color_r = @hud_color_r, hud_color_g = @hud_color_g, hud_color_b = @hud_color_b, hud_color_a = @hud_color_a, hud_font = @hud_font, hud_scale = @hud_scale WHERE identifier = @identifier', {
        ['@identifier'] = identifier,
        ['@hud_enabled'] = settings.hud_enabled,
        ['@hud_position_x'] = settings.hud_position_x,
        ['@hud_position_y'] = settings.hud_position_y,
        ['@hud_color_r'] = settings.hud_color_r,
        ['@hud_color_g'] = settings.hud_color_g,
        ['@hud_color_b'] = settings.hud_color_b,
        ['@hud_color_a'] = settings.hud_color_a,
        ['@hud_font'] = settings.hud_font,
        ['@hud_scale'] = settings.hud_scale
    })
end)