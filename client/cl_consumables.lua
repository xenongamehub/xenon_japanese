local QBCore = exports['qb-core']:GetCoreObject()   

RegisterNetEvent('xenon_japanese:client:Eat', function(itemName)
    if itemName == "burger-fries" then
        TriggerEvent('animations:client:EmoteCommandStart', {"fries"})
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    end
    QBCore.Functions.Progressbar("eat_something", "Munching..", 5000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        end
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)

RegisterNetEvent('xenon_japanese:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"bsdrink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        end
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)


-- PRODUCTION EVENTS --          

RegisterNetEvent('xenon_japanese:server:sushi', function()
	local ingredients = QBCore.Functions.HasItem({'fish', 'rice',  'wasabi'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Making a Sushi..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("xenon_japanese:server:sushi")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fish"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rice"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["wasabi"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sushi"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('xenon_japanese:client:food')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('xenon_japanese:client:food')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('xenon_japanese:server:makeramen', function()
	local ingredients = QBCore.Functions.HasItem({"chicken", "noodles", "broth"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Making a ramen..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("xenon_japanese:server:makeramen")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["noodles"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["broth"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ramen"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('xenon_japanese:client:food')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('xenon_japanese:client:food')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('xenon_japanese:server:makekare', function()
	local ingredients = QBCore.Functions.HasItem({"chicken", "rice", "broth"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"fbbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("bs_stuff", "Making a kare..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("xenon_japanese:server:makekare")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rice"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["broth"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kare"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('xenon_japanese:client:food')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('xenon_japanese:client:food')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)
RegisterNetEvent('xenon_japanese:server:makeganmaicha', function()
	local ingredients = QBCore.Functions.HasItem({"tea", "sakura", "sugar"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("bs_stuff", "Making Drinks..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("xenon_japanese:server:makeganmaicha")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tea"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sakura"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ganmaicha"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('xenon_japanese:client:food')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('xenon_japanese:client:food')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)
RegisterNetEvent('xenon_japanese:server:makesakuratea', function()
	local ingredients = QBCore.Functions.HasItem({"tea", "sakura", "sugar"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("bs_stuff", "Making Drinks..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("xenon_japanese:server:makesakuratea")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tea"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sakura"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sakuratea"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('xenon_japanese:client:food')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('xenon_japanese:client:food')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)
RegisterNetEvent('xenon_japanese:server:makeamazake', function()
	local ingredients = QBCore.Functions.HasItem({"tea", "sakura", "sugar"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("bs_stuff", "Making Drinks..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("xenon_japanese:server:makeamazake")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tea"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sakura"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["amazake"], "add")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('xenon_japanese:client:food')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('xenon_japanese:client:food')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)




-- MENUS --     

RegisterNetEvent('xenon_japanese:closemenu', function()
    ClearPedTasksImmediately(PlayerPedId())
    TriggerEvent("qb-menu:closeMenu")
end)

RegisterNetEvent('xenon_japanese:client:food', function()
    exports['qb-menu']:openMenu({
        {
            header = "Stove",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Shushi",
            txt = "Requires:</p>Fish|Rice|wasabi",
            icon = "far fa-clipboard",
            params = {
                event = "xenon_japanese:server:sushi",
            }
        },
        {
            header = "Ramen",
            txt = "Requires:</p>broth|Chicken|noodles",
            icon = "far fa-clipboard",
            params = {
                event = "xenon_japanese:server:makeramen",
            }
        },
        {
            header = "Kare",
            txt = "Requires:</p>broth|Chicken|Rice",
            icon = "far fa-clipboard",
            params = {
                event = "xenon_japanese:server:makekare",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "xenon_japanese:closemenu"
            }
        },
    })
end)

RegisterNetEvent('xenon_japanese:client:drinkStation', function()
    exports['qb-menu']:openMenu({
        {
            header = "Drink Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Ganmaicha",
            txt = "Requires:</p>Sakura|Suger|tea",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "xenon_japanese:server:makeganmaicha",
            }
        },
        {
            header = "Sakuratea",
            txt = "Requires:</p>Sakura|Suger|tea",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "xenon_japanese:server:makesakuratea",
            }
        },
        {
            header = "Amazake",
            txt = "Requires:</p>Sakura|Suger|tea",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "xenon_japanese:server:makeamazake",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "xenon_japanese:closemenu"
            }
        },
    })
end)
