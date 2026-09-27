local QBCore = exports['qb-core']:GetCoreObject()

-- Team selection
RegisterServerEvent('mar_hostagepvp:selectTeam')
AddEventHandler('mar_hostagepvp:selectTeam', function(team)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if Config.Teams[team] then
        Player.Functions.SetMetaData('team', team)
        TriggerClientEvent('QBCore:Notify', src, 'You have joined the ' .. Config.Teams[team].Name .. ' team')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Invalid team selection')
    end
end)

-- Weapon selection
RegisterServerEvent('mar_hostagepvp:selectWeapon')
AddEventHandler('mar_hostagepvp:selectWeapon', function(weapon)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local team = Player.Functions.GetMetaData('team')
    if team and table.contains(Config.Weapons[team], weapon) then
        Player.Functions.AddItem(weapon, 1)
        TriggerClientEvent('QBCore:Notify', src, 'You have selected ' .. weapon)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Invalid weapon selection')
    end
end)

-- Hostage mechanics
RegisterServerEvent('mar_hostagepvp:interactHostage')
AddEventHandler('mar_hostagepvp:interactHostage', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local team = Player.Functions.GetMetaData('team')
    if team == 'Defenders' then
        TriggerClientEvent('mar_hostagepvp:hostageFreed', -1)
        TriggerClientEvent('QBCore:Notify', -1, 'The hostage has been freed!')
    elseif team == 'Attackers' then
        TriggerClientEvent('mar_hostagepvp:hostageKilled', -1)
        TriggerClientEvent('QBCore:Notify', -1, 'The hostage has been killed!')
    end
end)

-- Extraction system
RegisterServerEvent('mar_hostagepvp:extract')
AddEventHandler('mar_hostagepvp:extract', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local team = Player.Functions.GetMetaData('team')
    if team then
        local reward = Config.Rewards[team]
        Player.Functions.AddMoney('cash', reward.Money)
        for _, item in ipairs(reward.Items) do
            Player.Functions.AddItem(item.name, item.amount)
        end
        TriggerClientEvent('QBCore:Notify', src, 'You have been rewarded for extraction')
    end
end)

-- Admin commands
QBCore.Commands.Add('startHostagePvp', 'Start Hostage PvP event', {{name = 'eventName', help = 'Name of the event'}}, false, function(source, args)
    local eventName = args[1] or Config.EventName
    TriggerClientEvent('mar_hostagepvp:startEvent', -1, eventName)
    TriggerClientEvent('QBCore:Notify', -1, 'Hostage PvP event has started!')
end, 'admin')

QBCore.Commands.Add('endHostagePvp', 'End Hostage PvP event', {{}}, false, function(source, args)
    TriggerClientEvent('mar_hostagepvp:endEvent', -1)
    TriggerClientEvent('QBCore:Notify', -1, 'Hostage PvP event has ended!')
end, 'admin')