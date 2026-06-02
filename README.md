# Comma

A modular, Lua-driven configuration framework for the Hyprland compositor.




## Architectural Overview

This repository replaces traditional monolithic `hyprland.conf` deployments with a structured, programmable Lua API. The architecture isolates system core parameters, input maps, visual definitions, and functional keybindings into decoupled modules.



### Core Design Principles

- **Programmatic Control:** Uses Lua to evaluate conditions, manage states, and build abstractions dynamically.
    
- **Decoupled Visual Profiles:** Separates color themes from animation kinematics, allowing runtime combinations without cross-dependency.
    
- **Hardware Abstraction:** Isolates host-specific peripherals, display arrangements, and environment initializations from the central WM logic.




## Repository Structure

```
.
├── core/
│   ├── autostart         # Background processes and session initialization
│   ├── binds/            # Categorized input shortcuts (apps, management, xf86)
│   ├── config/           # General WM parameters (input, decoration, layout, groups)
│   ├── devices           # Hardware-specific peripheral configurations
│   ├── env               # Environment variable exports
│   ├── gestures          # Touchpad and touchscreen gesture mappings
│   ├── monitors          # Display layouts, resolutions, and refresh rates
│   └── rules/            # Window, layer, and workspace behavior definitions
├── extensions/
│   ├── addons/           # Functional desktop addons
│   └── plugins/          # Third-party Hyprland plugins
├── lib/                  # Low-level abstractions, helper utilities, and API wrappers
└── visual/
    ├── animations/       # Motion kinetics (Bezier curves, physical spring models)
    └── themes/           # Distinct desktop environment themes
```




## Installation and Submodules

The deployment utilizes external components integrated via Git submodules.
To clone the repository with all components initialized:

```bash
git clone --recursive <repository-url>
cd comma
```

To initialize submodules within an existing working copy:

```bash
git submodule update --init --recursive
```



### Integrated Addons

- **Mousetrap:** A daemon managing hot-corners and display edge actions.
- **Spin:** A low-resource daemon handling dynamic screen rotation for mobile/tablet forms.




## Hardware-Specific Customization

> [!WARNING]
> 
> This configuration is heavily optimized for specific hardware profiles and is not intended for out-of-the-box plug-and-play operation.

Before launching the session, the following files must be reviewed and adjusted to match the host system topology:

- `core/monitors`: Define active display outputs, scale factors, and spatial placement.
- `core/devices`: Configure device-specific input nodes (e.g., specific pointers, keyboards, or digitizers).
- `core/autostart` & `core/env`: Adjust environmental variables and background services to fit local paths and display servers.




## Keybindings



### Application Launchers

| **Key Sequence**    | **Action**                               |
| ------------------- | ---------------------------------------- |
| `SUPER + 1`         | Launch Kitty                             |
| `SUPER + SHIFT + 1` | Launch Kitty (Root Shell)                |
| `SUPER + 2`         | Launch Nautilus                          |
| `SUPER + 3`         | Launch Firefox                           |
| `SUPER + SHIFT + 3` | Launch Firefox (Private Window)          |
| `SUPER + 4`         | Launch Obsidian                          |
| `SUPER + 5`         | Launch Firefox Progressive Web App (PWA) |



### Utility Applications

|**Key Sequence**|**Action**|
|---|---|
|`SUPER + F4`|Launch Waypaper|
|`SUPER + F5`|Launch GNOME Calculator|
|`SUPER + F6`|Launch Dialect|
|`SUPER + F7`|Launch GNOME Characters|
|`SUPER + F8`|Launch Gradia Screenshot Tool|
|`SUPER + F9`|Launch Eyedropper|



### Window Navigation and State

|**Key Sequence**|**Action**|
|---|---|
|`SUPER + Direction`|Shift focus to adjacent window|
|`SUPER + SHIFT + Direction`|Move active window position within layout|
|`SUPER + CTRL + Direction`|Swap position with adjacent window|
|`SUPER + CTRL + Return`|Toggle window fullscreen state|
|`SUPER + CTRL + Escape`|Toggle window floating state|
|`SUPER + CTRL + Grave`|Toggle sticky/pinned state|



### Workspace and Group Management

|**Key Sequence**|**Action**|
|---|---|
|`SUPER + ALT + Up/Down`|Navigate to Previous / Next workspace|
|`SUPER + ALT + Home/End`|Navigate to First / Last workspace|
|`CTRL + ALT + Left/Right`|Cycle through tabs within active group|
|`CTRL + ALT + Return`|Toggle window group membership|



### Window Resize Mode

- Press `SUPER + CTRL + R` to enter context-specific resize mode.
- Use `Arrow Keys` for fine adjustments (1 unit).
- Use `SHIFT + Arrow Keys` for coarse adjustments (10 units).
- Press `Return` or `Escape` to terminate resize mode.



### Aesthetics and Profiles

|**Key Sequence**|**Action**|
|---|---|
|`SUPER + SHIFT + ALT + F`|Apply "Focus" theme|
|`SUPER + SHIFT + ALT + S`|Apply "Supernova" theme|
|`SUPER + SHIFT + ALT + T`|Apply "Tape" theme|
|`SUPER + SHIFT + ALT + Z`|Apply "Zero" theme|
|`SUPER + SHIFT + ALT + Escape`|Force hot-reload of themes and configuration|
|`SUPER + SHIFT + ALT + 0`|Select Monocle layout preset|
|`SUPER + SHIFT + ALT + 1-7`|Select Scrolling layout presets|
|`SUPER + SHIFT + ALT + = / -`|Increase / Decrease desktop zoom|
|`SUPER + SHIFT + ALT + Q`|Terminate active wallpaper engine|
|`SUPER + SHIFT + ALT + W`|Cycle random image wallpaper via Hyprpaper / Waypaper|
|`SUPER + SHIFT + ALT + E`|Cycle random video wallpaper via Mpvpaper|



### Hardware and Component Controls

|**Key Sequence**|**Action**|
|---|---|
|`Menu`|Toggle Waybar visibility|
|`SUPER + ALT + F7`|Toggle Shimeji overlay|
|`SUPER + XF86AudioPlay`|Toggle Hyprsunset blue light filter|
|`SUPER + XF86AudioMute`|Disable screen shaders|
|`SUPER + XF86AudioRaiseVolume`|Cycle to next screen shader|
|`SUPER + XF86AudioLowerVolume`|Cycle to previous screen shader|



### Audio

| **Key Sequence** | **Action** |
| --- | --- |
| `XF86AudioMute` | Toggle mute state |
| `XF86AudioLowerVolume` | Decrement volume 1% |
| `ALT + XF86AudioLowerVolume` | Decrement volume 5% |
| `SHIFT + XF86AudioLowerVolume` | Force volume to 0% |
| `XF86AudioRaiseVolume` | Increment volume 1% |
| `ALT + XF86AudioRaiseVolume` | Increment volume 5% |
| `SHIFT + XF86AudioRaiseVolume` | Force volume to 100% |



### Backlight

| `XF86MonBrightnessDown` | Decrement backlight 1% |
| `ALT + XF86MonBrightnessDown` | Decrement backlight 5% |
| `SHIFT + XF86MonBrightnessDown` | Set backlight to 1% |
| `XF86MonBrightnessUp` | Increment backlight 1% |
| `ALT + XF86MonBrightnessUp` | Increment backlight 5% |
| `SHIFT + XF86MonBrightnessUp` | Set backlight to 100% |




## System Dependencies



### Environment Components

- **Status Bar:** Waybar
- **Wallpaper Daemons:** Waypaper, Hyprpaper, Mpvpaper
- **Idle Management:** Hypridle, Hyprlock
- **Color Temperature:** Hyprsunset



### Core Software Array

- **Terminal Emulator:** Kitty    
- **Web Browser:** Firefox
- **File Manager:** Nautilus  



### Command-line Utilities

- `brightnessctl` — Backlight subsystem control    
- `pamixer` — PulseAudio/PipeWire volume management via CLI
- `notify-send` — Desktop notification routing

