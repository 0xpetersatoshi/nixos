{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/screens"
      ];

      monitor = ",preferred,auto,auto";
      "$mainMod" = "SUPER";
      "$altMod" = "ALT";
      "$terminal" = "ghostty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi";
      "$browser = brave";
      "$passwordManager = 1password";
      "$editor = nvim";
      "$music = spotify";

      exec-once = [
        "uwsm app -- waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "systemctl --user start hyprpolkitagent"
      ];

      general = {
        gaps_in = 0;
        gaps_out = 0;

        border_size = 5;

        "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
        "col.inactive_border" = "rgba(3c3836ff)";

        resize_on_border = true;

        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true
          range = 4;
          render_power = 3;
          "color" = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = false;
        };
      };

      animations = {
        enabled = true;
        bezier = easeOutQuint,0.23,1,0.32,1;
        bezier = easeInOutCubic,0.65,0.05,0.36,1;
        bezier = linear,0,0,1,1;
        bezier = almostLinear,0.5,0.5,0.75,1.0;
        bezier = quick,0.15,0,0.1,1;
;
        animation = "global, 1, 10, default";
        animation = "border, 1, 5.39, easeOutQuint";
        animation = "windows, 1, 4.79, easeOutQuint";
        animation = "windowsIn, 1, 4.1, easeOutQuint, popin 87%";
        animation = "windowsOut, 1, 1.49, linear, popin 87%";
        animation = "fadeIn, 1, 1.73, almostLinear";
        animation = "fadeOut, 1, 1.46, almostLinear";
        animation = "fade, 1, 3.03, quick";
        animation = "layers, 1, 3.81, easeOutQuint";
        animation = "layersIn, 1, 4, easeOutQuint, fade";
        animation = "layersOut, 1, 1.5, linear, fade";
        animation = "fadeLayersIn, 1, 1.79, almostLinear";
        animation = "fadeLayersOut, 1, 1.39, almostLinear";
        animation = "workspaces, 1, 1.94, almostLinear, fade";
        animation = "workspacesIn, 1, 1.21, almostLinear, fade";
        animation = "workspacesOut, 1, 1.94, almostLinear, fade";
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = false;
        workspace_swipe_forever = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      windowrulev2 = [
        "bordersize 0, floating:0, onworkspace:w[t1]"

        "float,class:(mpv)|(imv)|(showmethekey-gtk)"
        "move 990 60,size 900 170,pin,noinitialfocus,class:(showmethekey-gtk)"
        "noborder,nofocus,class:(showmethekey-gtk)"

        "workspace 3,class:(obsidian)"
        "workspace 3,class:(zathura)"
        "workspace 4,class:(com.obsproject.Studio)"
        "workspace 5,class:(telegram)"
        "workspace 5,class:(vesktop)"
        "workspace 6,class:(teams-for-linux)"

        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
        "nofocus, class:^(xwaylandvideobridge)$"
      ];

      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
    };
  };
}
