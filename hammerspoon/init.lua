-- Reload config automatically
local configFileWatcher
function reloadConfig()
  configFileWatcher:stop()
  configFileWatcher = nil
  hs.reload()
end

configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
configFileWatcher:start()



-- Load local modules
require "modules/hotkey" -- hotkey.lua
require "modules/windows" -- windows.lua
require "modules/inputsource" -- inputsource.lua
-- require "modules/clipboard" -- clipboard.lua
-- require "modules/function" -- function.lua

-- Load Spoons
--

-- Finally, show a notification that we finished loading the config
hs.notify.new( {title='Hammerspoon', subTitle='Configuration loaded'} ):send()
