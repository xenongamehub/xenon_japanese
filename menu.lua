RegisterNetEvent('xenon_japanese:client:open', function()
    exports['qb-menu']:openMenu({
        {
            header = "Foods and drink japanese",
            isMenuHeader = true,
        },
        {
            header = "< Back",
            txt = "",
            params = {
                event = "xenon_japanese:client:close",
            }
        },
        {
            header = "Food|Sushi",
            txt = "Price: 50$",
            params = {
                event = "xenon_japanese:client:open",
            }
        },
        {
            header = "Food|Ramen",
            txt = "Price: 50$",
            params = {
                event = "xenon_japanese:client:open",
            }
        },
        {
            header = "Food|Kare Rice",
            txt = "Price: 50$",
            params = {
                event = "xenon_japanese:client:open",
            }
        },
        {
            header = "Drink|Ganmaicha",
            txt = "Price: 40$",
            params = {
                event = "xenon_japanese:client:open",
            }
        },
        {
            header = "Drink|Sakuratea",
            txt = "Price: 40$",
            params = {
                event = "xenon_japanese:client:open",
            }
        },
        {
            header = "Drink|Amazake",
            txt = "Price: 40$",
            params = {
                event = "xenon_japanese:client:open",
            }
        },
    })
end)

Citizen.CreateThread(function()
exports['qb-target']:AddBoxZone("jmenu", vector3(-171.0, 295.97, 93.09), 0.5, 0.4, {
    name="jmenu",
    debugpoly = false,
    heading=270,
}, {
        options = {
            {
                event = "xenon_japanese:client:open",
                icon = "fas fa-clipboard",
                label = "See Menu",
            },
        },
        distance = 1.5
    })
end)
