local QBCore = exports['qb-core']:GetCoreObject()

-- Team selection NUI
RegisterNUICallback('selectTeam', function(data, cb)
    local team = data.team
    TriggerServerEvent('mar_hostagepvp:selectTeam', team)
    cb('ok')
end)

-- Weapon selection NUI
RegisterNUICallback('selectWeapon', function(data, cb)
    local weapon = data.weapon
    TriggerServerEvent('mar_hostagepvp:selectWeapon', weapon)
    cb('ok')
end)

-- Hostage mechanics
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local hostageCoords = Config.HostageSpawn
        local distance = #(playerCoords - hostageCoords)

        if distance < 2.0 then
            DrawText3D(hostageCoords.x, hostageCoords.y, hostageCoords.z, '~g~Press E to interact with the hostage')
            if IsControlJustPressed(0, 38) then
                TriggerServerEvent('mar_hostagepvp:interactHostage')
            end
        end
    end
end)

-- Extraction system
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local extractionCoords = Config.Teams[QBCore.Functions.GetPlayerData().team].Extraction
        local distance = #(playerCoords - extractionCoords)

        if distance < 2.0 then
            DrawText3D(extractionCoords.x, extractionCoords.y, extractionCoords.z, '~g~Press E to extract')
            if IsControlJustPressed(0, 38) then
                TriggerServerEvent('mar_hostagepvp:extract')
            end
        end
    end
end)

-- Modern HUD
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerData = QBCore.Functions.GetPlayerData()
        local team = playerData.team
        local kills = playerData.kills
        local deaths = playerData.deaths

        if team then
            DrawText2D(0.5, 0.9, 0.5, 0.5, Config.Teams[team].Color .. team .. '~w~: Kills: ' .. kills .. ' Deaths: ' .. deaths)
        end
    end
end)

-- Helper functions
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function DrawText2D(x, y, width, height, text)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(width, height)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end