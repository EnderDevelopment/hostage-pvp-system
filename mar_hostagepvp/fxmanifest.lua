fx_version 'cerulean'
game 'gta5'

name 'HostagePvpSystem'
description 'FiveM QB-Core script for Hostage PvP event'
author 'EnderDevelopment'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    'config.lua'
}

dependencies {
    'qb-core',
    'ox_inventory',
    'ox_target',
    'ox_lib'
}