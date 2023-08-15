local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('xenon_japanese:server:sushi', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("fish", 1)
    Player.Functions.RemoveItem("rice", 1)
    Player.Functions.RemoveItem("wasabi", 1)
    Player.Functions.AddItem("sushi", 3)
end)

RegisterNetEvent('xenon_japanese:server:makeramen', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("chicken", 1)
    Player.Functions.RemoveItem("noodles", 1)
    Player.Functions.RemoveItem("broth", 1)
    Player.Functions.AddItem("ramen", 3)
end)

RegisterNetEvent('xenon_japanese:server:makekare', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("chicken", 1)
    Player.Functions.RemoveItem("rice", 1)
    Player.Functions.RemoveItem("broth", 1)
    Player.Functions.AddItem("kare", 3)
end)

RegisterNetEvent('xenon_japanese:server:makeganmaicha', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tea", 1)
    Player.Functions.RemoveItem("sakura", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.AddItem("ganmaicha", 1)
end)

RegisterNetEvent('xenon_japanese:server:makesakuratea', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tea", 1)
    Player.Functions.RemoveItem("sakura", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.AddItem("sakuratea", 1)
end)

RegisterNetEvent('xenon_japanese:server:makeamazake', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tea", 1)
    Player.Functions.RemoveItem("sakura", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.AddItem("amazake", 1)
end)


QBCore.Functions.CreateUseableItem("amazake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("xenon_japanese:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("sakuratea", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("xenon_japanese:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ganmaicha", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("xenon_japanese:client:Drink", source, item.name)
    end
end)


QBCore.Functions.CreateUseableItem("sushi", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("xenon_japanese:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ramen", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("xenon_japanese:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kare", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("xenon_japanese:client:Eat", source, item.name)
    end
end)

RegisterNetEvent("xenon_japanese:server:billPlayer", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'japanese' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                billed.Functions.RemoveMoney('bank', amount)
                TriggerClientEvent('QBCore:Notify', source, 'You charged a customer.', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You have been charged $'..amount..' for your order at japanese Resturant.')
                exports['qb-management']:AddMoney('japanese', amount)
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must be a valid amount above 0.', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You cannot bill yourself.', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player not online', 'error')
        end
    end
end)
