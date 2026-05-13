
-- -------------------------------------------------------
--  ___ ___                      .__                     .___
-- /   |   \ ___.__._____________|  | _____    ____    __| _/
--/    ~    <   |  |\____ \_  __ \  | \__  \  /    \  / __ | 
--\    Y    /\___  ||  |_> >  | \/  |__/ __ \|   |  \/ /_/ | 
-- \___|_  / / ____||   __/|__|  |____(____  /___|  /\____ | 
--       \/  \/     |__|                   \/     \/      \/ 
--
--  Hyprland Config by Tonrl - 2024                                                  
--  You can split this configuration into multiple files  
--  source = ~/.config/hypr/myColors.conf                 
--  SUPER + SHIFT + C (restart waybar)                    
-- --------------------------------------------------------

------------------
---- MONITORS ----
------------------
require("conf_dir.monitors")

-------------------
---- AUTOSTART ----
-------------------
require("conf_dir.auto_start")

-----------------------
----- PERMISSIONS -----
-----------------------
require("conf_dir.permissions")

-----------------------
---- LOOK AND FEEL ----
-----------------------
require("conf_dir.interface")

---------------------
---- KEYBINDINGS ----
---------------------
require("conf_dir.keybinding")

---------------------
---- WINDOW-RULES ----
---------------------
require("conf_dir.window-rule")

---------------------
---- WALLPAPAERS ----
---------------------
require("conf_dir.wallpaper")
