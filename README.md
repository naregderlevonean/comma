
![](Logo.svg)

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
git clone --recursive https://github.com/naregderlevonean/comma
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




## System Dependencies

- **Status Bar:** `waybar`
- **Launcher:** `walker`
- **Wallpaper Daemons:** `waypaper`, `hyprpaper`, `mpvpaper`
- **Idle Management:** `hypridle`, `hyprlock`
- **Color Temperature:** `hyprsunset`
- **OSK**: `wvkbd`
- **Terminal Emulator:** `kitty`
- **Web Browser:** `firefox`
- **File Manager:** `nautilus`
- **Backlight**: `brightnessctl`
- **Audio**: `pamixer`
- **Notifications**: `notify-send`, `histui`

