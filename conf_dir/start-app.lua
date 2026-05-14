---------------------
---- START APP ----
---------------------


local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local terminal    = "foot"
local fileManager = "footclient -e yazi"
local menu        = "rofi -show drun -run-command 'uwsm app -- {cmd}'"
local ac_window = "rofi -show window"

---- Applications
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + O", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " +  SHIFT + F",hl.dsp.exec_cmd("uwsm app -t service -- firefox.desktop"))
hl.bind(mainMod .. " +  SHIFT + B",hl.dsp.exec_cmd("uwsm app -t service -- firefox-beta-bin.desktop"))
hl.bind(mainMod .. " +  SHIFT + D",hl.dsp.exec_cmd("uwsm app -t service -- chromium.desktop"))

-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only



hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("cliphist wipe"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("uwsm app -t service bash $HOME/.config/hypr/scripts/logout_script.sh"))

hl.bind(" + Print", hl.dsp.exec_cmd("screenshots.sh all"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("screenshots.sh select"))

