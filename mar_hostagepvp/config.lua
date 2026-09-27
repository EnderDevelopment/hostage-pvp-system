Config = {}

-- Event settings
Config.EventName = 'Hostage PvP'
Config.EventDuration = 30 -- in minutes
Config.MaxPlayersPerTeam = 10

-- Teams
Config.Teams = {
    Attackers = {
        Name = 'Attackers',
        Color = '~r~',
        Spawn = vector3(450.0, -980.0, 30.0),
        Extraction = vector3(450.0, -990.0, 30.0)
    },
    Defenders = {
        Name = 'Defenders',
        Color = '~b~',
        Spawn = vector3(440.0, -980.0, 30.0),
        Extraction = vector3(440.0, -990.0, 30.0)
    }
}

-- Hostage settings
Config.HostagePed = 's_m_m_security_01'
Config.HostageSpawn = vector3(445.0, -985.0, 30.0)

-- Weapons
Config.Weapons = {
    Attackers = {
        'WEAPON_PISTOL',
        'WEAPON_SMG'
    },
    Defenders = {
        'WEAPON_PISTOL',
        'WEAPON_SMG',
        'WEAPON_CARBINERIFLE'
    }
}

-- Rewards
Config.Rewards = {
    Attackers = {
        Money = 5000,
        Items = {
            {name = 'weapon_pistol', amount = 1},
            {name = 'bandage', amount = 5}
        }
    },
    Defenders = {
        Money = 3000,
        Items = {
            {name = 'weapon_smg', amount = 1},
            {name = 'bandage', amount = 3}
        }
    }
}