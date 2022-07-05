Config = {
    Framework = 'esx', -- Available Frameworks: 'esx' & 'qbus'.
    Notifications = 'esx', -- Available Notifications Systems: 'esx', 'qbus', 'pNotify', 'mythic_new', 'mythic_old', 'custom' (For Custom notifications go to, Functions folder and edit 'functions_cl.lua' changing the code of ZSK.Functions.CustomNotifications)
    Positions = {
        Default = {
            x = 1, -- Change this value!
            y = 1, -- Change this value!
            z = 1, -- Change this value!
        }
    },
    Enable = {
        AtFirstSpawn = true, -- This will allow to spawn in a specific site every time that connects to the server every person.
        JoinNotification = true, -- This will show to the player an notification all the times that connects to the server.
    },
    Locale = 'en',
    Texts = {
        ['en'] = {
            ['thanks_for_joining'] = 'Thanks for joining to our server!',
            ['thanks_for_changing'] = 'You have just changed the world!',
            ['change_world_menu_title'] = 'Change World'
        }
    }
}