--Auto Config Reload
function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/Code/Hammerspoon-Script/.hammerspoon/", reload_config):start()
hs.alert.show("Config Has Been Loaded")

--Snap Left Screen
hs.hotkey.bind({"alt"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

--Snap Right Screen
hs.hotkey.bind({"alt"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

--Maximize Screen
if hs.window.focusedWindow():isMinimized() == true
    then 
        hs.hotkey.bind({"alt"}, "Up", function()
            local win = hs.window.focusedWindow()

            win:unminimize()
        end)
    
    else
        hs.hotkey.bind({"alt"}, "Up", function()
            local win = hs.window.focusedWindow()
            
            win:maximize()
        end)
end

--Minimize Screen
hs.hotkey.bind({"alt"}, "Down", function()
    local win = hs.window.focusedWindow()

    win:minimize()
end)