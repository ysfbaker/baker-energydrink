local QBCore = exports['qb-core']:GetCoreObject()
local isRunningFast = false
RegisterNetEvent('baker:useEnergyDrink')
AddEventHandler('baker:useEnergyDrink', function()
    local playerPed = PlayerPedId()

    if isRunningFast then
        QBCore.Functions.Notify("Zaten hızlı koşuyorsunuz.", "error")
        return
    end

    isRunningFast = true
    QBCore.Functions.Progressbar("drink_something", "Enerji içeceği içiliyor..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49
    }, {
        model = 'vw_prop_casino_water_bottle_01a',
        bone = 60309,
        coords = vec3(0.0, 0.0, -0.05),
        rotation = vec3(0.0, 0.0, -40),
    }, {}, function()
    end)
    QBCore.Functions.Notify("30 saniye boyunca daha hızlı koşacaksınız!", "success")
    StartScreenEffect("ChopVision", 0, true)
    Wait(1000)
    StopScreenEffect("ChopVision")
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    Citizen.SetTimeout(30000, function()
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        isRunningFast = false
        QBCore.Functions.Notify("Normal hızınıza döndünüz.", "error")
    end)
end)