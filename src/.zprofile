# Hyprland

if command -v uwsm >/dev/null &&
   [[ -z "$WAYLAND_DISPLAY" ]] &&
   [[ "$(tty)" == "/dev/tty1" ]]; then

    exec uwsm start hyprland-uwsm.desktop \
        >"$HOME/.cache/hyprland-start.log" 2>&1

fi
