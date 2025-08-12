{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        "layer" = "top"; # Waybar at top layer
        "position" = "top"; # Waybar position (top|bottom|left|right)
        height = 30; # Waybar height (to be removed for auto height)
        spacing = 4; # Gaps between modules (4px)

        # Choose the order of modules
        modules-left = [ "hyprland/workspaces" "custom/waybar-mpris" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "gamemode"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "keyboard-state"
          "hyprland/language"
          "clock"
          "tray"
          "custom/power"
        ];

        # Modules configuration
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          show-special = true;
          special-visible-only = true;
          warp-on-scroll = false;
          format = "{name}: {icon}";
          "format-icons" = {
            # "1" = "";
            # "2" = "";
            # "3" = "";
            # "4" = "";
            # "5" = "";
            urgent = "";
            active = "";
            default = "";
            magic = "";
          };
        };

        "keyboard-state" = {
          # "numlock" = true;
          capslock = true;
          format = "{icon}";
          "format-icons" = {
            locked = "";
            unlocked = "";
          };
        };

        "hyprland/mode" = { format = ''<span style="italic">{}</span>''; };

        "hyprland/scratchpad" = {
          "format" = "{icon} {count}";
          "show-empty" = false;
          "format-icons" = [ "" "" ];
          "tooltip" = true;
          "tooltip-format" = "{app}: {title}";
        };

        mpd = {
          format =
            "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          "format-disconnected" = "Disconnected ";
          "format-stopped" =
            "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          "unknown-tag" = "N/A";
          interval = 5;
          "consume-icons" = { on = " "; };
          "random-icons" = {
            off = ''<span color="#f53c3c"></span> '';
            on = " ";
          };
          "repeat-icons" = { on = " "; };
          "single-icons" = { on = "1 "; };
          "state-icons" = {
            paused = "";
            playing = "";
          };
          "tooltip-format" = "MPD (connected)";
          "tooltip-format-disconnected" = "MPD (disconnected)";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          "format-icons" = {
            activated = "";
            deactivated = "";
          };
        };

        tray = {
          # "icon-size" = 21;
          spacing = 10;
          # "icons" = {
          # "blueman" = "bluetooth";
          # "nm-applet" = "/home/bysinka/Downloads/ethernet_off_4204.png";
          # "TelegramDesktop" = "${config.home.homeDirectory}/.local/share/icons/hicolor/16x16/apps/telegram.png";
          # };
        };

        clock = {
          # "timezone" = "America/New_York";
          "tooltip-format" = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          "format-alt" = "{:%Y-%m-%d}";
        };

        cpu = {
          format = "{usage}% ";
          # "tooltip" = false;
        };

        memory = { format = "{}% "; };

        # "temperature" = {
        #   "thermal-zone" = 2;
        #   # "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
        #   "critical-threshold" = 80;
        #   "format-critical" = "{temperatureC}°C {icon}";
        #   "format" = "{temperatureC}°C {icon}";
        #   "format-icons" = [ "" "" "" ];
        # };

        network = {
          # "interface" = "wlp2*"; # (Optional) To force the use of this interface
          format = "";
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          # "scroll-step" = 1; # %; can be a float
          format = "{volume}% {icon}    {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            headphone = "";
            "hands-free" = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          "on-click" = "pavucontrol";
        };

        "hyprland/language" = {
          "format-en" = "🇺🇸";
          "format-ru" = "🇷🇺";
          "min-length" = 3;
          "tooltip" = true;
        };

        "custom/waybar-mpris" = {
          "return-type" = "json";
          exec = "waybar-mpris --position --autofocus";
          "on-click" = "waybar-mpris --send toggle";
          max-length = 30;
          ellipsis = true;
          escape = true;
        };

        gamemode = {
          format = "{glyph}";
          "format-alt" = "{glyph} {count}";
          glyph = "";
          "hide-not-running" = true;
          "use-icon" = true;
          "icon-name" = "input-gaming-symbolic";
          "icon-spacing" = 4;
          "icon-size" = 20;
          tooltip = true;
          "tooltip-format" = "Games running: {count}";
        };

        "custom/power" = {
          "format" = " ";
          "on-click" = ''
            ${pkgs.rofi}/bin/rofi -modi "power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu" -show power-menu'';
          "tooltip" = false;
        };
      };
    };
  };
}
