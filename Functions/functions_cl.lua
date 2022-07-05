-- Declarating Functions Index
ZSK = {}
ZSK.Functions = {}
-- Starting with Functions

-- Start Custom Notifications
ZSK.Functions.CustomNotification = function(text)
    -- Add here the code for your custom notifications
end
-- End Of Custom Notifications
-- Start Reset Worlds
ZSK.Functions.ResetWorlds = function()
    local uId = PlayerId()
    TriggerServerEvent('zsk:core:resetWorld', {
        userid = uId
    })
    TriggerEvent('zsk:core:setCurrentWorld', {
        current = 1
    })
end
-- End of Reset Worlds
-- Start Show Worlds Menu
ZSK.Functions.ShowMenu = function()
    TriggerEvent('zsk:core:showWorldsMenu', Worlds.Data)
end