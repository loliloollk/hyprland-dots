------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "auto",
    mode     = "preferred",
    position = "0x0",
    scale    = "1",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "alacritty"
local fileManager = "nemo"
local menu        = "rofi -show drun"
local browser     = "librewolf"
local code        = "alacritty -e nvim"

-------------------
---- AUTOSTART ----
-------------------

 hl.on("hyprland.start", function () 
   hl.exec_cmd("wl-paste --type text --watch cliphist store")
   hl.exec_cmd("wl-paste --type image --watch cliphist store")
   hl.exec_cmd("waybar && swaync")
   hl.exec_cmd("sleep 1 && waypaper --restore")
 end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 7,
        border_size = 2,

        col = {
            active_border   = { colors = {"rgb(adadad)"}, },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true
    },
})

-- Animations
hl.animation({ leaf = "global", speed = 8, enabled = true, bezier = "default" })

-- Bezier Curves
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } })
hl.curve("liner", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })

-- Animation Rules
hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "wind", style = "popin" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "winIn", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "winOut", style = "popin" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "popin" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "liner", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "winIn", style = "popin 90%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "winOut", style = "popin 0%" })

-- idk
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,        
	disable_hyprland_logo   = true,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace"
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(code))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("sh ~/.config/scripts/toggle_waybar.sh"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("throne"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("sh ~/.config/scripts/tlp.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("sh ~/.config/scripts/clipboard-manager.sh"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("sh ~/.config/scripts/powermenu.sh"))
hl.bind(mainMod .. " + code:60", hl.dsp.exec_cmd("sh ~/.config/scripts/rofimoji.sh"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
-- Requires playerctl
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Opacity & Blur
hl.window_rule({ match = { class = "^$", title = "^$" }, no_blur = true })

-- Opacity
hl.window_rule({ match = { class = "^(Alacritty)$" }, opacity = "0.90 0.90" })
hl.window_rule({ match = { class = "^(org.telegram.desktop)$" }, opacity = "0.95 0.95" })
hl.window_rule({ match = { class = "^(dev.zed.Zed)$" }, opacity = "0.95 0.95" })
hl.window_rule({ match = { class = "^($browser)$" }, opacity = "0.95 0.95" })
hl.window_rule({ match = { class = "^($files)$" }, opacity = "0.90 0.90" })
hl.window_rule({ match = { class = "^(waypaper)$" }, opacity = "0.90 0.90" })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, opacity = "0.90 0.90" })
hl.window_rule({ match = { class = "^(librewolf)$" }, opacity = "0.90 0.90" })

-- Picture In Picture
hl.window_rule({
    match = { title = "^(.*[Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture.*)$" },
    float = true,
    pin = true,
    keep_aspect_ratio = true,
    size = "25% 25%",
    move = "74% 74%"
})

-- Floating
hl.window_rule({ match = { class = "^(vlc)$" }, float = true })
hl.window_rule({ match = { class = "^(spotify)$" }, float = true })
hl.window_rule({ match = { class = "^(Throne)$" }, float = true })
hl.window_rule({ match = { class = "^($browser)$", title = "^(Picture-in-Picture)$" }, float = true })
hl.window_rule({ match = { class = "^($browser)$", title = "^(Library)$" }, float = true })
hl.window_rule({ match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" }, float = true })
hl.window_rule({ match = { class = "^(qt5ct)$" }, float = true })
hl.window_rule({ match = { class = "^(qt6ct)$" }, float = true })
hl.window_rule({ match = { class = "^(org.kde.ark)$" }, float = true })

-- Thunar
hl.window_rule({
    match = { class = "^(nemo)$" },
    float = true,
    size = "67% 70%",
    center = true
})

-- qView
hl.window_rule({
    match = { class = "^(com.interversehq.qView)$" },
    float = true,
    size = "70% 78%",
    center = true
})

-- Tools
hl.window_rule({
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    float = true,
    size = "50% 55%",
    center = true
})

hl.window_rule({
    match = { class = "^(nwg-look)$" },
    float = true,
    size = "50% 55%",
    center = true
})

hl.window_rule({
    match = { class = "^(waypaper)$" },
    float = true,
    size = "50% 55%",
    center = true
})

hl.window_rule({
    match = { class = "^(.blueman-manager-wrapped)$" },
    float = true,
    size = "50% 55%",
    center = true
})

hl.window_rule({
    match = { class = "^(com.obsproject.Studio)$" },
    float = true,
    size = "67% 80%",
    center = true
})


hl.window_rule({
    match = { class = "^(qalculate-gtk)$" },
    float = true,
    size = "45% 55%",
    center = true
})

-- Windows and Dialogs
hl.window_rule({ match = { title = "^(Open)$" }, float = true })
hl.window_rule({ match = { title = "^(Authentication Required)$" }, float = true })
hl.window_rule({ match = { title = "^(Add Folder to Workspace)$" }, float = true })
hl.window_rule({ match = { title = "^(Open File)$" }, float = true })
hl.window_rule({ match = { title = "^(Choose Files)$" }, float = true })
hl.window_rule({ match = { title = "^(Save As)$" }, float = true })
hl.window_rule({ match = { title = "^(Confirm to replace files)$" }, float = true })
hl.window_rule({ match = { title = "^(File Operation Progress)$" }, float = true })
hl.window_rule({ match = { title = "^(File Upload.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Choose wallpaper.*)$" }, float = true })
hl.window_rule({ match = { title = "^(Library.*)$" }, float = true })

-- Universal
hl.window_rule({ match = { class = ".*dialog.*" }, float = true })
hl.window_rule({ match = { title = ".*dialog.*" }, float = true })

-- Portal Rules
hl.window_rule({
    match = { class = "^(org.freedesktop.impl.portal.desktop.hyprland)$" },
    float = true,
    center = true
})

hl.window_rule({
    match = { class = "^(org.freedesktop.impl.portal.desktop.gtk)$" },
    float = true,
    center = true
})

hl.window_rule({
    match = { class = "^([Xx]dg-desktop-portal-gtk)$" },
    float = true,
    center = true
})

-- Layer Rules
hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true,
    ignore_alpha = 0.5
})

hl.layer_rule({
    match = { namespace = "notifications" },
    blur = true,
    ignore_alpha = 0.5
})

hl.layer_rule({
    match = { namespace = "swaync-notification-window" },
    blur = true,
    ignore_alpha = 0.5
})

hl.layer_rule({
    match = { namespace = "swaync-control-center" },
    blur = true,
    ignore_alpha = 0.5
})

hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0.1
})
