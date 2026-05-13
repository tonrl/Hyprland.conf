-- General Settings for Window Rules
-- Tags - Terminal Emulator
hl.window_rule({ match = { class = "foot" }, tag = "+term" })
hl.window_rule({ match = { class = "footclient" }, tag = "+term" })
hl.window_rule({ match = { class = "Alacritty" }, tag = "+term" })
hl.window_rule({ match = { class = "kitty" }, tag = "+term" })

-- # Tags - Browser
hl.window_rule({ match = { class = "firefox" }, tag = "+WebBrowser" })
hl.window_rule({ match = { class = "Firefox Beta" }, tag = "+WebBrowser" })
hl.window_rule({ match = { class = "chromium" }, tag = "+WebBrowser" })

-- File Opener, Downloads Uploads etc

hl.window_rule({ match = { title = "Open.*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = "Select File.*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = "Save*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = ".*Files.*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = ".*Image.*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = ".*Manager.*" }, tag = "+WebBrowser" })


hl.window_rule({ match = { class = "firefox" }, tag = "+noGroup" })
hl.window_rule({ match = { class = "chromium" }, tag = "+noGroup" })

--  Email cliant
hl.window_rule({ match = { class = "org.mozilla.Thunderbird" }, tag = "+email" })
hl.window_rule({ match = { class = "eu.betterbird.Betterbird" }, tag = "+email" })

-- finance
hl.window_rule({ match = { class = "gnucash" }, tag = "+finance" })
hl.window_rule({ match = { class = "gnucash" }, tag = "+noGroup" })
hl.window_rule({ match = { class = "gnucash" }, tag = "+Opaque" })

-- Audio control softwares (easy effects etc)
hl.window_rule({ match = { class = "com.saivert.pwvucontrol" }, tag = "+Audio_ctl" })
hl.window_rule({ match = { class = "com.github.wwmm.easyeffects" }, tag = "+Audio_ctl" })
hl.window_rule({ match = { class = "io.github.kaii_lb.Overskride" }, tag = "+Audio_ctl" })


-- NetworkManager
hl.window_rule({ match = { class = "nm-connection-editor" }, tag = "+NetWork" })
hl.window_rule({ match = { class = "nm-applet" }, tag = "+NetWork" })

-- Yubico
hl.window_rule({ match = { class = "com.yubico.yubioath" }, tag = "+Yubico" })
hl.window_rule({ match = { class = "authenticator" }, tag = "+Yubico" })

-- Swaync
hl.layer_rule({
        match = { namespace = "swaync-control-center" },
        blur = true,
        ignore_alpha = 0.5,
})

hl.layer_rule({
        match = { namespace = "swaync-notification-window" },
        blur = true,
        ignore_alpha = 0.5,
})

-- windowrule = tag +FILE_OP, match:title (Open Files)
-- windowrule = tag +FILE_OP, match:title (Open File)
-- windowrule = tag +FILE_OP, match:title (Open File)(.*)
-- windowrule = tag +FILE_OP, match:title (Select File)(.*)$
-- windowrule = tag +FILE_OP, match:title (Open Document)
-- windowrule = tag +FILE_OP, match:title (Save As)(.*)$
-- windowrule = tag +FILE_OP, match:title (All Files)
-- windowrule = tag +FILE_OP, match:title (File Upload)
-- windowrule = tag +FILE_OP, match:title (File Upload)(.*)$
-- windowrule = tag +FILE_OP, match:initial_title (Save Image)
-- windowrule = tag +FILE_OP, match:initial_title (Save Image)(.*)$
-- windowrule = tag +FILE_OP, match:initial_title (Task Manager - Chromium)
--
-- #windowrule = tag +noGroup, match:class chromium
-- # windowrule = tag +noGroup, match:class firefox
-- windowrule = tag +noGroup, match:class (hyprland-share-picker)
-- windowrule = tag +noGroup, match:tag (Audio_ctl)
-- # windowrule = tag +noGroup, match:class firefoxnightly
-- # windowrule = tag +noGroup, match:class imv
--
--
--
--
--
--
