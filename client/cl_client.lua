local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

CreateThread(function()
    japanese = AddBlipForCoord(-165.63, 294.85, 93.76)
    SetBlipSprite (japanese, 483)
    SetBlipDisplay(japanese, 6)
    SetBlipScale  (japanese, 0.8)
    SetBlipAsShortRange(japanese, true)
    SetBlipColour(japanese, 46)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("japanese")
    EndTextCommandSetBlipName(japanese)
end) 

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        BurgerZones()
    end
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        for k, v in pairs(Config.Zones) do
            exports['qb-target']:RemoveZone("japanese"..k)
        end
        DeletePed(jobPed)
    end 
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    BurgerZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:RemoveZone("japanese"..k)
    end
    DeletePed(jobPed)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

function BurgerZones()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:AddCircleZone("japanese"..k, v.coords, v.radius, {
            name = "japanese"..k,
            debugPoly = false,
            useZ=true,
        }, {
            options = {
                {
                    type = "client",
                    event = v.event,
                    icon = v.icon,
                    label = v.label,
                    job = v.job,
                },
            },
            distance = 1.5
        })
    end
    if not DoesEntityExist(jobPed) then

	RequestModel(Config.GaragePed) while not HasModelLoaded(Config.GaragePed) do Wait(0) end

	jobPed = CreatePed(0, Config.GaragePed, Config.PedLocation, false, false)

	SetEntityAsMissionEntity(jobPed, true, true)
	SetPedFleeAttributes(jobPed, 0, 0)
	SetBlockingOfNonTemporaryEvents(jobPed, true)
	SetEntityInvincible(jobPed, true)
	FreezeEntityPosition(jobPed, true)
	loadAnimDict("amb@world_human_leaning@female@wall@back@holding_elbow@idle_a")        
	TaskPlayAnim(jobPed, "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", 8.0, 1.0, -1, 01, 0, 0, 0, 0)

	exports['qb-target']:AddTargetEntity(jobPed, { 
	    options = {
		{ 
		    type = "client",
		    event = "xenon_japanese:client:jobGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Garage",
		    job = "japanese"
		},
		{ 
		    type = "client",
		    event = "xenon_japanese:client:storeGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Store Vehicle",
		    job = "japanese"
		},
	    }, 
	    distance = 1.5, 
	})
    end
end

CreateThread(function()
    DecorRegister("js_vehicle", 1)
end)

RegisterNetEvent('xenon_japanese:client:jobGarage', function(vehicle)
    local vehicle = Config.Vehicle
    local coords = Config.VehicleSpawn
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "BURG"..tostring(math.random(1000, 9999)))
        DecorSetFloat(veh, "js_vehicle", 1)
        SetEntityAsMissionEntity(veh, true, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = QBCore.Functions.GetPlate(veh)
        SetVehicleFuelLevel(veh, 100.0)
    end, coords, true)
end)

RegisterNetEvent('xenon_japanese:client:storeGarage', function()
    local veh = QBCore.Functions.GetClosestVehicle()
    if DecorExistOn((veh), "js_vehicle") then
        QBCore.Functions.DeleteVehicle(veh)
        QBCore.Functions.Notify("You returned the vehicle.", "success")
    else
        QBCore.Functions.Notify("This is not a work vehicle.", "error")
    end
end)
    
RegisterNetEvent("xenon_japanese:client:frontTray", function()
    TriggerEvent("inventory:client:SetCurrentStash", "foodtray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "foodtray", {
        maxweight = 30000,
        slots = 12,
    })
end)

RegisterNetEvent("xenon_japanese:client:frontTray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "foodtray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "foodtray2", {
        maxweight = 30000,
        slots = 12,
    })
end)

RegisterNetEvent("xenon_japanese:client:passThrough", function()
    TriggerEvent("inventory:client:SetCurrentStash", "BigTray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "BigTray", {
        maxweight = 300000,
        slots = 15,
    })
end)

RegisterNetEvent("xenon_japanese:client:jobFridge", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Fridge")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Fridge", {
        maxweight = 3000000,
        slots = 30,
    })
end)

RegisterNetEvent("xenon_japanese:client:ingredientStore", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "japanese", Config.Items)
end)

RegisterNetEvent('xenon_japanese:clientToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("xenon_japanese:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
		submitText = "Charge",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", 
                type = "text", 
                isRequired = true --
            },
            {
                text = "   Bill Price ($)",
                name = "billprice", 
                type = "number",
                isRequired = false
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("xenon_japanese:server:billPlayer", bill.citizenid, bill.billprice)
    end
end)
