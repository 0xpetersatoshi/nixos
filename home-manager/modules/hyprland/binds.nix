{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "CTRL,           Q, killactive,"
      "CTRL,           DELETE, exit,"
      "CTRL SHIFT,     L, exec, loginctl lock-session"
      "CTRL SHIFT,     F, togglefloating,"
      "CTRL SHIFT,     Z, togglesplit,"
      "$mainMod,       E, exec, bemoji -cn"
      "$mainMod,       V, exec, cliphist list | $menu --dmenu | cliphist decode | wl-copy"
      "$mainMod,       O, exec, hyprpicker -an"
      "$mainMod,       N, exec, swaync-client -t"
      "$mainMod,       SPACE , exec, $menu --show drun"
      "$mainMod,       T, exec, $terminal"
      "$mainMod,       F, exec, $fileManager"
      "$mainMod,       M, exec, $music"
      "$mainMod,       B, exec, $browser"
      "$mainMod,       P, exec, $passwordManager"
      ", Print, exec, grimblast --notify --freeze copysave area"

      # Moving focus
      "$mainMod, left,  movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up,    movefocus, u"
      "$mainMod, down,  movefocus, d"

      # Moving focus vim style
      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      # Moving windows vim style
      "$mainMod SHIFT, h,  swapwindow, l"
      "$mainMod SHIFT, l,  swapwindow, r"
      "$mainMod SHIFT, k,  swapwindow, u"
      "$mainMod SHIFT, j,  swapwindow, d"

      # Resizing windows vim style                   X  Y
      "$mainMod ALT, h, resizeactive, -20 0"
      "$mainMod ALT, l, resizeactive,  20 0"
      "$mainMod ALT, k, resizeactive,  0 -20"
      "$mainMod ALT, j, resizeactive,  0  20"

      # Switching workspaces
      "$altMod, 1, workspace, 1"
      "$altMod, 2, workspace, 2"
      "$altMod, 3, workspace, 3"
      "$altMod, 4, workspace, 4"
      "$altMod, 5, workspace, 5"
      "$altMod, C, workspace, 6"
      "$altMod, E, workspace, 7"
      "$altMod, T, workspace, 8"
      "$altMod, M, workspace, 9"
      "$altMod, B, workspace, 10"


      # Moving active window to workspaces
      "$altMod SHIFT, 1, movetoworkspacesilent, 1"
      "$altMod SHIFT, 2, movetoworkspacesilent, 2"
      "$altMod SHIFT, 3, movetoworkspacesilent, 3"
      "$altMod SHIFT, 4, movetoworkspacesilent, 4"
      "$altMod SHIFT, 5, movetoworkspacesilent, 5"
      "$altMod SHIFT, C, movetoworkspacesilent, 6"
      "$altMod SHIFT, E, movetoworkspacesilent, 7"
      "$altMod SHIFT, T, movetoworkspacesilent, 8"
      "$altMod SHIFT, M, movetoworkspacesilent, 9"
      "$altMod SHIFT, B, movetoworkspacesilent, 10"

      # Scratchpad
      "$mainMod,       S, togglespecialworkspace,  magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      "$mainMod, bracketright, exec, brightnessctl s 10%+"
      "$mainMod, bracketleft,  exec, brightnessctl s 10%-"
    ];

    # Audio playback
    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
    ];
  };
}
