# Godot Mod Framework
A Godot game template that is set up for mod support from the beginning

Inspired by: https://www.youtube.com/watch?v=tTdToEu6x8U and https://www.youtube.com/watch?v=K3MnEvrC8TA

## Getting Started

This repository is set up as a GitHub template. To create your own project based on this template:

1. Visit https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template
2. Follow the instructions to create a new repository from this template

### Updating From Template

If you need to pull in updates from this template after creating your game, you can do so using the following Git commands:

```bash
# Add this template repository as a remote
git remote add template [URL of the template repo]

# Fetch all changes
git fetch --all

# Merge changes from the template's branch to your current branch
git merge template/[branch to merge] --allow-unrelated-histories
```

For more details, see: https://help.github.com/en/articles/adding-a-remote

## Purpose

Build the game as a collection of mods to ensure that your game properly supports modders upon release

## Versions

### Godot Mod Framework Repo
 - Basic version that loads a single mod and prints a hello world message. Can be used as a solid baseline for custom implementation

### TODO: Replace with link to flappy bird clone fork
[Full Game Mod (Flappy Bird Clone)](https://github.com/ThomasSilloway/GodotModCapableGame/releases/tag/build-2024-02-27-v01)
 - Complete working example of a modular game built entirely with mods
 - Demonstrates two different modding approaches:
   1. Injection: The Settings mod shows how to inject new UI elements into existing scenes (adds a settings button to main menu)
   2. Overwriting: The Crazy Bird mod demonstrates how to override existing game files to modify gameplay (changes assets and behavior of the Flappy Bird clone)
 - Includes a functional Flappy Bird clone as the base game
 - Features a clean mod loading system with automatic mod discovery
 - Shows how to handle mod dependencies and load order
### Known Bugs
 - Fullscreen setting may be bugged on some monitors
 - GUT unit tests are included, but the add-on is not included in the project
 - Futura font is referenced but not added to the repo

## Tech Details

- Each mod is a separate godot project
- `startup` is the main project that does loading mods. Handles global things too like Settings, Config

## Usage - Manual

- Export `start` project as an .exe (Turning on Export Console Wrapper is handy for testing)
  - Export folder: build
- Export mod projects as a .zip and put it into the 
  - Export folder: build/mods

- Run the `startup` executable and view the logs to see it's try to load mods, but none are found

## Usage - Automated
- Update `scripts/build.bat` to match your paths
- Run the build batch file to automatically create versioned builds
-

