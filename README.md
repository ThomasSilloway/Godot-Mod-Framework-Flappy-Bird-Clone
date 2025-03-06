## Purpose

Build the game as a collection of mods to ensure that your game properly supports modders upon release

## Description

### Template
 - Built as a template from [Godot-Mod-Framework](https://github.com/ThomasSilloway/Godot-Mod-Framework)

### Full Game Mod (Flappy Bird Clone - this repo)
 - Complete working example of a modular game built entirely with mods
 - Demonstrates two different modding approaches:
   1. Injection: The Settings mod shows how to inject new UI elements into existing scenes (adds a settings button to main menu)
   2. Overwriting: The Crazy Bird mod demonstrates how to override existing game files to modify the game (changes assets of the Flappy Bird clone)
 - Includes a functional Flappy Bird clone as the base game
 - Features a clean mod loading system with automatic mod discovery
 - Shows how to handle mod dependencies and load order
### Known Bugs
 - Fullscreen setting may be bugged on some monitors

### Unit Testing Branch - GUT
 - There's a branch that includes Godot Unit Test (GUT) tests for the game, but since GUT is a plugin, it is not included in the branch
 - To set it up, just clone the GUT branch and install the GUT plugin

## Tech Details

### Mod Setup

- Each mod is a separate godot project
- `startup` is the main project that does loading mods. Handles global things too like Settings, Config
- `mainmenu` is the first mod that displays the main menu for the project.
- `settings_menu` is the mod that injects a settings button into the main menu which opens a settings menu
  - The settings menu updates the values in the `SettingsManager` in the `main` project automatically by having its own placeholder `SettingsManager` autoloaded which is not included in the exported project. Surprisingly having a file in the auto load that is not included in the exported project doesn't break anything.
- `flappy_bird_clone` is the mod that contains the flappy bird clone game
  - Serves as the base game that other mods can modify
  - Includes complete game logic, assets, and sound effects
  - Demonstrates how to structure a game as a mod that can be extended
- `crazy_bird_mod` demonstrates file overwriting by replacing assets and scripts in the flappy bird clone
  - Shows how to override audio files and modify game behavior without changing the original mod
  - Uses the same folder structure as `flappy_bird_clone` to specify which files to replace

### Misc
 - Repo uses Git LFS for large files

## Usage - Manual

- Export `start` project as an .exe (Turning on Export Console Wrapper is handy for testing)
  - Export folder: build
- Export `main_menu`, `settings_menu`, `flappy_bird_clone`, `crazy_bird_mod` projects as a .zip and put it into the 
  - Export folder: build/mods

- Run the `startup` executable and view the logs to see it's try to load mods, but none are found

## Usage - Automated
- Update `scripts/build.bat` to match your paths
- Run the build batch file to automatically create versioned builds
- There's also individual build batch files for each mod that can be run to build just that mod and copy the previous builds files into this build

## Credits

### Audio
- Music and sound effects from:
  - [Pixabay.com](https://pixabay.com)
  - [Zapsplat.com](https://www.zapsplat.com)

