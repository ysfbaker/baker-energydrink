local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('enerjiicecegi', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('baker:useEnergyDrink', src)
    Player.Functions.RemoveItem('enerjiicecegi', 1)
end)
