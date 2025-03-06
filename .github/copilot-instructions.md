# Overview

- Assume Godot 4.4 is being used

## Project Goals

- A godot game made with mods from the ground up
- All of the mods and the base game are in the projects folder
- The base game is called `startup`
- The other projects are included in `startup` by exporting them as zip files
- The code in `startup` loads all of the mod zip files at when it starts and loads their `init_scene.tscn`

## Project Structure
- ai_coding_assistant (files that help Cursor write code)
- build (the binary files of the game when they are exported)
- documentation (relevant documentation for godot extensions)
- projects (main game project and all mod projects)
- scripts (any scripts used globally for all projects)

## Implementation details
- Ensure there's a newline at the end of each file