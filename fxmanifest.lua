fx_version 'cerulean'
game 'gta5'

author 'HostagePvpSystem'
description 'FiveM QB-Core script for Hostage PvP event with ox_inventory, ox_target, ox_lib. Features: 2 teams ('
version '1.0.0'

dependencies {
    'qb-core'
}

client_scripts {
    'client.lua',
    'client/*.lua'
}

server_scripts {
    'server.lua',
    'server/*.lua'
}

shared_scripts {
    'config.lua',
    'shared.lua'
}

ui_page 'html/index.html'

files {
    'html/*.html',
    'html/*.css',
    'html/*.js'
}
