---------------------
---- WALLPAPAERS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("uwsm app -t service bash light-or-dark.sh athena"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("uwsm app -t service bash light-or-dark.sh dark"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("uwsm app -t service bash light-or-dark.sh light"))
