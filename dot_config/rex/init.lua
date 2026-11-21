-- herdr-style ctrl+a prefix (see dot_config/herdr/config.toml).
-- herdr workspace = Rex session, herdr tab = Rex tab, herdr pane = Rex pane.
local p = "ctrl+a>"

rex.bind(p .. "ctrl+a", "pane.send_key", { key = "ctrl+a" })

rex.bind(p .. "shift+/", "client.palette.toggle")
rex.bind(p .. "s", "client.settings")
rex.bind(p .. "shift+r", "client.config.reload")
rex.bind(p .. "b", "client.sidebar.toggle")
rex.bind(p .. "g", "pane.go_to")
rex.bind(p .. "w", "session.switch")

rex.bind(p .. "v", "pane.split.right")
rex.bind(p .. "-", "pane.split.down")
rex.bind(p .. "x", "pane.close")
rex.bind(p .. "z", "pane.zoom")
rex.bind(p .. "tab", "pane.focus_recent.in_tab")
rex.bind(p .. "shift+p", "pane.rename")
rex.bind(p .. "[", "pane.copy_mode.enter")

local dirs = { h = "left", j = "down", k = "up", l = "right" }
for key, dir in pairs(dirs) do
  rex.bind(p .. key, "pane.focus", { direction = dir })
  rex.bind("ctrl+shift+" .. key, "pane.resize", { direction = dir })
  rex.bind("resize/" .. key, "pane.resize", { direction = dir })
end
rex.mode("resize", { exclusive = true })
rex.bind(p .. "r", "client.mode.enter", { name = "resize" })
rex.bind("resize/enter", "client.mode.exit")

rex.bind(p .. "c", "client.tab.new")
rex.bind(p .. "n", "client.tab.next")
rex.bind(p .. "p", "client.tab.previous")
rex.bind(p .. "shift+t", "client.tab.rename")
rex.bind(p .. "shift+x", "client.tab.close")
for i = 1, 9 do
  rex.bind(p .. i, "client.tab.goto", { index = i })
end

rex.bind(p .. "shift+n", "session.new")
rex.bind(p .. "shift+w", "session.rename")
rex.bind(p .. "shift+d", "session.close")
-- session.new.on_host is a no-op in snapshot.2077; switch host, then ctrl+a shift+n.
rex.bind(p .. "shift+s", "client.host.switch")

-- Agent layer: Rex has no priority-ordered next-agent action, so alt+j/k walk sessions.
rex.bind(p .. "a", "pane.view_activity")
rex.bind(p .. "alt+j", "session.next")
rex.bind(p .. "alt+k", "session.previous")
rex.bind(p .. "shift+tab", "session.recent")

rex.bind("shift+cmd+r", "client.config.reload")

require("hosts")
