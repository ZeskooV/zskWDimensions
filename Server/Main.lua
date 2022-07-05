--[[ ESX, QBus, Other = nil, nil, nil
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
                message = "The specified framework '" . Config.Framework . "' is not available in this script.",
                sendlog = Config.Enable.Debug
            })
            Wait(100)
            Other = true
        end
    end
end)]]
RegisterNetEvent('zsk:core:sendError')
AddEventHandler('zsk:core:sendError', function(data)
    print('[^2ZsKooV^7] ERROR of ' . data.type . ', throwing this error.')
    print('[^2ZsKooV^7] ERROR - ' . data.message)
    local errCode = nil
    if (data.type == "notifications") then
        errCode = 132
    elseif (data.type == "framework") then
        errCode = 133
    elseif (data.type == "showNotify") then
        errCode = 134
    else
    
    end
    print('[^2ZsKooV^7] This error with code ' . errCode . ', Check the error code list in my Discord to know the error type')
end)
RegisterNetEvent('zsk:core:changeWorld')
AddEventHandler('zsk:core:changeWorld', function(data)
    for k, v in pairs(data.worlds) do
        if (v.id == data.id) then
            print(GetPlayerIdentifiers(source)[1] . ', Is changing the #'.data.current.', to the #' . data.id . ' world named: ' . v.name)
            SetPlayerRoutingBucket(data.userid, data.id)
        else
            print("Skipping world with id " . v.id . ", because is not appeared to be valid.")
        end
    end
end)
RegisterNetEvent('zsk:core:resetWorld')
AddEventHandler('zsk:core:resetWorld', function(data)
    local playerId = data.userid
    SetPlayerRoutingBucket(playerId, 1)
    TriggerClientEvent('zsk:core:showNotification', {
        type = "worldChanged"
    })
end)