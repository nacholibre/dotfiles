hs.hotkey.bind({}, "§", function()
    local appName = "Alacritty"
    local app = hs.application.find(appName)

    if app then
        -- If Alacritty is running, toggle visibility
        local win = app:mainWindow()
        if win then
            if app:isFrontmost() then
                app:hide()
            else
                win:focus()
            end
        else
            -- If no main window, bring app to front
            app:activate()
        end
    else
        -- Launch Alacritty if not running
        hs.application.launchOrFocus(appName)
    end
end)
