print("Xenon japanese resturant - Made by Aladin ")
Config = {}

Config.NewCore = true

Config.GaragePed = "u_m_m_bikehire_01"

Config.PedLocation = vector4(-179.2, 315.21, 96.91, 85.04)
                                                                
Config.VehicleSpawn = vector4(-181.76, 314.99, 97.8, 181.13)

Config.Vehicle = 'rumpo2'


HungerFill = { -- How much they fill your hunger
    ["sushi"] = math.random(35, 45),
    ["ramen"] = math.random(35, 45),
    ["kare"] = math.random(35, 45),
}

ThirstFill = { -- How much they fill your thirst.
    ["ganmaicha"] = math.random(35, 45),
    ["sakuratea"] = math.random(35, 45),
    ["amazake"] = math.random(35, 45),
}

Config.Zones = {
    [1] = { coords = vector3(-163.18, 293.11, 94.59), radius = 1.55, icon = "far fa-clipboard", event = "xenon_japanese:client:frontTray", label = "Food Tray", }, 
    [2] = { coords = vector3(-176.61, 310.41, 97.99), radius = 1.00, icon = "far fa-clipboard", event = "xenon_japanese:client:drinkStation", label = "Make Drinks", job = "japanese" }, 
    [3] = { coords = vector3(-172.64, 301.4, 97.46), radius = 1.55, icon = "far fa-clipboard", event = "xenon_japanese:client:food", label = "Make Food", job = "japanese" }, 
    [5] = { coords = vector3(-176.59, 307.52, 97.99), radius = 1.55, icon = "far fa-clipboard", event = "xenon_japanese:client:ingredientStore", label = "Ingredients", job = "japanese" },
    [6] = { coords = vector3(-1207.18, -892.06, 14.6), radius = 1.55, icon = "far fa-clipboard", event = "qb-bossmenu:client:OpenMenu", label = "Manage Business", job = {['japanese'] = 4} },
    [7] = { coords = vector3(-178.92, 305.78, 97.46), radius = 1.15, icon = "far fa-clipboard", event = "xenon_japanese:client:jobFridge", label = "Fridge", job = "japanese" },
    [8] = { coords = vector3(-170.17, 304.97, 93.76), radius = 1.55, icon = "far fa-clipboard", event = "xenon_japanese:client:passThrough", label = "Big Tray", job = "japanese" },
    [9] = { coords = vector3(-170.31, 290.31, 94.65), radius = 1.55, icon = "fa-solid fa-clock", event = "xenon_japanese:clientToggleDuty", label = "Clock In/Out", job = "japanese" },
    [10] = { coords = vector3(-170.98, 294.22, 93.15), radius = 1.55, icon = "fa-brands fa-cc-visa", event = "xenon_japanese:bill", label = "Bill Customer", job = "japanese" },
    -- [11] = { coords = vector3(-1195.98, -891.22, 14.0), radius = 1.55, icon = "fa-brands fa-cc-visa", event = "xenon_japanese:bill", label = "Bill Customer", job = "japanese" }, 
    -- [12] = { coords = vector3(-1195.31, -892.2, 13.65), radius = 1.55, icon = "far fa-clipboard", event = "xenon_japanese:client:frontTray2", label = "Counter", },    
}

Config.Items = {
label = "Shop",
    slots = 11,
    items = {
        [1] = {
            name = "fish",
            price = 1,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "wasabi",
            price = 1,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "milk",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "rice",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "noodles",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "butter",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "broth",
            price = 1,
            amount = 500,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "sugar",
            price = 1,
            amount = 500,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "chicken",
            price = 1,
            amount = 500,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "tea",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "sakura",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 11,
        },
    }
}
