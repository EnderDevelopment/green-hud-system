# Green HUD System

Customizable green HUD for FiveM servers using ESX.

## Features

- Customizable HUD position, color, font, and scale
- Display player information, job, money, bank balance, server name, player count, and server uptime

## Requirements

- FiveM server
- ESX framework
- MySQL database

## Installation

1. Download the latest release from the [releases page](https://github.com/EnderDevelopment/green-hud-system/releases).
2. Extract the files into your FiveM server's `resources` directory.
3. Add `start green-hud-system` to your `server.cfg` file.

## Usage

The HUD will automatically display player information, job, money, bank balance, server name, player count, and server uptime. You can customize the HUD position, color, font, and scale in the `config.lua` file.

## Configuration

You can customize the HUD settings in the `config.lua` file. The available settings are:

```lua
Config = {}

-- HUD Settings
Config.HudEnabled = true
Config.HudPosition = { x = 0.01, y = 0.01 }
Config.HudColor = { r = 0, g = 255, b = 0, a = 200 }
Config.HudFont = 4
Config.HudScale = 0.4

-- Player Info Settings
Config.ShowPlayerId = true
Config.ShowPlayerJob = true
Config.ShowPlayerMoney = true
Config.ShowPlayerBank = true

-- Server Info Settings
Config.ShowServerName = true
Config.ShowServerPlayers = true
Config.ShowServerUptime = true
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=green-hud-system&utm_content=bottom) — describe it in one sentence and get the full source code.