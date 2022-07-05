ESX, QBCore, Other = nil, nil, nil
Citizen.CreateThread(function()
    if (Config.Framework == 'esx') then
        while ESX == nil do
            ESX = exports['es_extended']:getSharedObject()
            Wait(100)
        end
    elseif Config.Framework == 'qbus' then
        while QBCore == nil do
            QBCore = exports['qb-core']:GetCoreObject()
            Wait(100)
        end
    else
        while Other == nil do
            TriggerServerEvent('zsk:core:sendError', {
                type = "framework",
                message = "The specified framework '" . Config.Framework . "' is not available in this script."
            })
            Wait(100)
            Other = true
        end
    end
end)
AddEventHandler('playerSpawned', function(spawn)
    if (Config.Enable.AtFirstSpawn) then
        if (Config.Framework == 'esx') then
            TriggerEvent('zsk:core:setCoords', {
                x = Config.Positions.Default.x,
                y = Config.Positions.Default.y,
                z = Config.Positions.Default.z,
            })
            if (Config.Notifications == 'custom') then
                ZSK.Functions.CustomNotification(Config.Texts[Config.Locale]['thanks_for_joining'])
            elseif (Config.Notifications == 'qbus') then
                TriggerServerEvent('zsk:core:sendError', {
                    type = "notifications",
                    message = "You Can't use the '" . Config.Framework . "' framework to send a notification in ESX."
                })
            elseif (Config.Notifications == 'esx') then
                ESX.ShowNotification(Config.Texts[Config.Locale]['thanks_for_joining'])
            elseif (Config.Notifications == 'pNotify') then
                exports[Config.Notifications]:SendNotification({
                    text = Config.Texts[Config.Locale]['thanks_for_joining'],
                    type = "info",
                    timeout = 5000
                })
            elseif (Config.Notifications == 'mythic_new') then
                exports['mythic_notify']:SendAlert('inform', Config.Texts[Config.Locale]['thanks_for_joining'], {
                    ['background-color'] = '#ffffff',
                    ['color'] = '#000000'
                })
            elseif (Config.Notifications == 'mythic_old') then
                exports['mythic_notify']:DoCustomHudText('inform', Config.Texts[Config.Locale]['thanks_for_joining'], 5000)
            else
                TriggerServerEvent('zsk:core:sendError', {
                    type = "notifications",
                    message = "This notifications script are not supported, please to add custom notifications in the functions file add your lines."
                })
            end
        elseif (Config.Framework == 'qbus') then
            if (Config.Notifications == 'custom') then
                ZSK.Functions.CustomNotification(Config.Texts[Config.Locale]['thanks_for_joining'])
            elseif (Config.Notifications == 'qbus') then
                QBCore.Functions.Notify(Config.Texts[Config.Locale]['thanks_for_joining'])
            elseif (Config.Notifications == 'esx') then
                TriggerServerEvent('zsk:core:sendError', {
                    type = "notifications",
                    message = "You Can't use the '" . Config.Framework . "' framework to send a notification in QBus."
                })
            elseif (Config.Notifications == 'pNotify') then
                exports[Config.Notifications]:SendNotification({
                    text = Config.Texts[Config.Locale]['thanks_for_joining'],
                    type = "info",
                    timeout = 5000
                })
            elseif (Config.Notifications == 'mythic_new') then
                exports['mythic_notify']:SendAlert('inform', Config.Texts[Config.Locale]['thanks_for_joining'], {
                    ['background-color'] = '#ffffff',
                    ['color'] = '#000000'
                })
            elseif (Config.Notifications == 'mythic_old') then
                exports['mythic_notify']:DoCustomHudText('inform', Config.Texts[Config.Locale]['thanks_for_joining'], 5000)
            else
                TriggerServerEvent('zsk:core:sendError', {
                    type = "notifications",
                    message = "This notifications script are not supported, please to add custom notifications in the functions file add your lines."
                })
            end
        else
            TriggerServerEvent('zsk:core:sendError', {
                type = "notifications",
                message = "The " . Config.Framework . " Framework actually doesn't works in your script."
            })
        end
    end
end)
local currentWorld = 1;
RegisterNetEvent('zsk:core:sendWorld')
AddEventHandler('zsk:core:sendWorld', function(data)
    local usuarioId = PlayerId()
    local WorldsData = Worlds.Data;
    TriggerServerEvent('zsk:core:changeWorld', {
        id = data.id,
        userid = usuarioId,
        worlds = WorldsData,
        current = currentWorld
    })
    currentWorld = worldid;
end)
RegisterNetEvent('zsk:core:setCurrentWorld')
AddEventHandler('zsk:core:setCurrentWorld', function(data)
    currentWorld = data.current;
end)
RegisterNetEvent('zsk:core:showNotification')
AddEventHandler('zsk:core:showNotification', function(data)
    if (data.type == "worldChanged") then
        if (Config.Framework == 'esx') then
            if (Config.Notifications == 'custom') then
                ZSK.Functions.CustomNotification(Config.Texts[Config.Locale]['thanks_for_changing'])
            elseif (Config.Notifications == 'qbus') then
                TriggerServerEvent('zsk:core:sendError', {
                    type = "notifications",
                    message = "You Can't use the '" . Config.Framework . "' framework to send a notification in ESX."
                })
            elseif (Config.Notifications == 'esx') then
                ESX.ShowNotification(Config.Texts[Config.Locale]['thanks_for_changing'])
            elseif (Config.Notifications == 'pNotify') then
                exports[Config.Notifications]:SendNotification({
                    text = Config.Texts[Config.Locale]['thanks_for_changing'],
                    type = "info",
                    timeout = 5000
                })
            elseif (Config.Notifications == 'mythic_new') then
                exports['mythic_notify']:SendAlert('inform', Config.Texts[Config.Locale]['thanks_for_changing'], {
                    ['background-color'] = '#ffffff',
                    ['color'] = '#000000'
                })
            elseif (Config.Notifications == 'mythic_old') then
                exports['mythic_notify']:DoCustomHudText('inform', Config.Texts[Config.Locale]['thanks_for_changing'], 5000)
            else
                TriggerServerEvent('zsk:core:sendError', {
                    type = "notifications",
                    message = "This notifications script are not supported, please to add custom notifications in the functions file add your lines."
                })
            end
        elseif (Config.Framework == 'qbus') then
            if (Config.Notifications == 'custom') then
                ZSK.Functions.CustomNotification(Config.Texts[Config.Locale]['thanks_for_changing'])
            elseif (Config.Notifications == 'qbus') then
                QBCore.Functions.Notify(Config.Texts[Config.Locale]['thanks_for_changing'])
            elseif (Config.Notifications == 'esx') then
                TriggerServerEvent('zsk:core:sendError', {
                    type = "notifications",
                    message = "You Can't use the '" . Config.Framework . "' framework to send a notification in QBus."
                })
            elseif (Config.Notifications == 'pNotify') then
                exports[Config.Notifications]:SendNotification({
                    text = Config.Texts[Config.Locale]['thanks_for_changing'],
                    type = "info",
                    timeout = 5000
                })
            elseif (Config.Notifications == 'mythic_new') then
                exports['mythic_notify']:SendAlert('inform', Config.Texts[Config.Locale]['thanks_for_changing'], {
                    ['background-color'] = '#ffffff',
                    ['color'] = '#000000'
                })
            elseif (Config.Notifications == 'mythic_old') then
                exports['mythic_notify']:DoCustomHudText('inform', Config.Texts[Config.Locale]['thanks_for_changing'], 5000)
            else
                TriggerServerEvent('zsk:core:sendError', {
                    type = "notifications",
                    message = "This notifications script are not supported, please to add custom notifications in the functions file add your lines."
                })
            end
        else
            TriggerServerEvent('zsk:core:sendError', {
                type = "notifications",
                message = "The " . Config.Framework . " Framework actually doesn't works in your script."
            })
        end
    else
        TriggerServerEvent('zsk:core:sendError', {
            type = "showNotify",
            message = "The type of Notification called: " . data.type . ", is not valid or is not declared in data file."
        })
    end
end)
RegisterNetEvent('zsk:core:showWorldsMenu')
AddEventHandler('zsk:core:showWorldsMenu', function(data)
    if (Config.Framework == 'esx') then
        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'zskworldmenu',
            {
                title = Config.Texts[Config.Locale]['change_world_menu_title'],
                elements = data
            },
            function (ar, menu)
                TriggerEvent('zsk:core:sendWorld', {
                    id = ar.current.id
                })
            end,
            function(ar, menu)
                menu.close()
            end
        )
    end
end)
RegisterNetEvent('zsk:core:setCoords')
AddEventHandler('zsk:core:setCoords', function(data)
    local x, y, z = data.x, data.y, data.z
    local p = PlayerPedId()
    SetEntityCoords(p, x, y, z, false, false, false, true)
end)