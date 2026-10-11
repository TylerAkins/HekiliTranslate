# HekiliTranslate

A pixel-based rotation script for World of Warcraft that reads Hekili recommendations and automatically presses the corresponding keybinds.

## How It Worked

The project used a small Lua addon and an external Python script.

1. Hekili recommended an ability.
2. The Lua addon read the keybind and changed an 8x8 pixel frame to a specific RGB color.
3. Python monitored that pixel using `mss`.
4. When the color matched a configured ability, Python pressed the assigned keybind.

The script supported configurable keybinds, colors, delays, and debug logging through `config.json`.

## Archived

I've decided to make this repository public and archive it.

This was a personal project I built as an experiment. With Blizzard's changes to WoW breaking Hekili's rotation functionality, this project no longer works.

I'm making the source code public in case anyone finds it useful for learning about WoW addon development, Python screen capture, or passing information between applications using pixel colors.

There are no plans to update or maintain this project.

## Disclaimer

This project is provided as-is for educational purposes.

Automating gameplay violates Blizzard's rules and may result in account penalties.
