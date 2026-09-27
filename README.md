# Hostage PvP System

Engaging Hostage PvP events for FiveM QB-Core servers

## Features

- Team-based gameplay with Attackers and Defenders
- Configurable hostage mechanics with interaction system
- Modern HUD displaying team stats and player performance
- Extraction system with rewards for successful extraction
- Weapon selection and team selection via NUI

## Requirements

- FiveM server with QB-Core framework
- ox_inventory, ox_target, and ox_lib resources

## Installation

1. Download the latest release from the [Releases](https://github.com/EnderDevelopment/hostage-pvp-system/releases) page
2. Extract the files into your FiveM server's `resources` directory
3. Add `ensure mar_hostagepvp` to your server.cfg
4. Restart your FiveM server

## Usage

### Commands

| Command | Description | Permission |
|---------|-------------|------------|
| `/startHostagePvp [eventName]` | Start a Hostage PvP event | `admin` |
| `/endHostagePvp` | End the current Hostage PvP event | `admin` |

### Configuration

Edit the `config.lua` file to customize:

- Event settings (name, duration, max players per team)
- Team configurations (spawn points, extraction points, colors)
- Hostage settings (ped model, spawn location)
- Weapon selections for each team
- Rewards for extraction

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=hostage-pvp-system&utm_content=bottom) — describe it in one sentence and get the full source code.