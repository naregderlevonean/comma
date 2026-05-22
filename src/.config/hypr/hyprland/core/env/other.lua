hl.env("CLUTTER_BACKEND", "wayland")
hl.env("PATH", os.getenv("PATH") .. ":" .. HOME .. "/.local/bin:" .. HOME .. "/.cargo/bin")

