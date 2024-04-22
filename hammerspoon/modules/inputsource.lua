local application = require "hs.application"
local hotkey = require "hs.hotkey"
local window = require "hs.window"
local layout = require "hs.layout"
local grid = require "hs.grid"
local hints = require "hs.hints"
local screen = require "hs.screen"
local alert = require "hs.alert"
local fnutils = require "hs.fnutils"
local geometry = require "hs.geometry"
local mouse = require "hs.mouse"
local keycodes = require "hs.keycodes"
local eventtap = require "hs.eventtap"
local battery = require "hs.battery"
local sound = require "hs.sound"
-- 导入hs.audiodevice模块
local hs_audiodevice = require("hs.audiodevice")

-- 获取当前默认输出设备的音量
local systemVolume = hs_audiodevice.defaultOutputDevice():volume()
local function Chinese()
    -- 简体拼音
    keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
end

local function English()
    -- ABC
    keycodes.currentSourceID("com.apple.keylayout.ABC")
end

local function setInputSource(input)
    keycodes.currentSourceID(input)
end

-- app to expected ime config
-- app和对应的输入法
local app2Ime = {
    {'/Applications/iTerm.app', 'com.apple.keylayout.ABC'},
    {'/Applications/uTools.app', 'com.apple.keylayout.ABC'},
    {'/System/Library/CoreServices/Finder.app', 'com.apple.keylayout.ABC'},
    {'/Applications/System Preferences.app', 'com.apple.keylayout.ABC'},
    {'/Applications/XTerminal.app', 'com.apple.keylayout.ABC'},
    {'/Applications/Pages.app', 'com.apple.keylayout.ABC'},
    {'/Applications/WeChat.app', 'com.sogou.inputmethod.sogou.pinyin'},
    {'/Applications/XMind.app', 'com.sogou.inputmethod.sogou.pinyin'},
    {'/Applications/Notion.app', 'com.sogou.inputmethod.sogou.pinyin'},
    -- {'/Applications/DingTalk.app', 'Chinese'},
    -- {'/Applications/Google Chrome.app', 'English'},
    -- {'/Applications/Kindle.app', 'English'},
    -- {'/Applications/Visual Studio Code.app', 'English'},
    -- {'/Applications/Xcode.app', 'English'},
}

function updateFocusAppInputMethod()
    -- local ime = 'Chinese'
    local ime = keycodes.currentSourceID()
    local hit = 0
    local focusAppPath = window.frontmostWindow():application():path()
    -- alert.show("path:  "..focusAppPath )
    for index, app in pairs(app2Ime) do
        local appPath = app[1]
        local expectedIme = app[2]
        if focusAppPath == appPath then
            ime = expectedIme
            break
        end
    end

    setInputSource(ime)

    if ime == 'com.apple.keylayout.ABC' then
        alert.show("English", 0.5)
    else
        alert.show("Chinese", 0.5)
    end
end

-- helper hotkey to figure out the app path and name of current focused window
-- 当选中某窗口按下ctrl+command+.时会显示应用的路径等信息
hotkey.bind({'ctrl', 'cmd'}, "z", function()
    alert.show("App path is:        "
    ..window.focusedWindow():application():path()
    .."\n"
    .."App name:      "
    ..window.focusedWindow():application():name()
    .."\n"
    .."IM source id:  "
    ..keycodes.currentSourceID())
end)


local fun = require "modules/function"
-- 当选中某窗口按下ctrl+command+.时会显示应用的路径等信息
hotkey.bind({'ctrl', 'cmd'}, "b", function()
    local st = {}
    local time = os.time()
    local systemVolume = hs_audiodevice.defaultOutputDevice():volume()
    -- local handle = io.popen("osascript -e 'output volume of (get volume settings)'")
    -- local systemVolume = handle:read("*a")
    -- handle:close()
    -- print("当前系统音量:", systemVolume)

    
    -- st.year = os.date('%Y',time)
    st.year = os.date("*t", time)['year']
    st.month = os.date("*t", time)['month']
    st.day = os.date("*t", time)['day']
    -- st.mon = os.date('%m',time)
    -- st.day = os.date('%d',time)
    alert.show("公历时间:   "
    ..os.date("%Y-%m-%d %H:%M:%S", time)
    .."\n"
    .."农历时间:   "
    ..fun.getDayOf(st)
    .."\n"
    .."电池电量:   "
    ..math.floor(battery.percentage())
    .."\n"
    .."电脑音量:   "
    ..math.floor(systemVolume))
    -- ..getNewDayOf(st))
    -- )
end)

-- Handle cursor focus and application's screen manage.
-- 窗口激活时自动切换输入法
function applicationWatcher(appName, eventType, appObject)
    if (eventType == application.watcher.activated or eventType == application.watcher.launched) then
        updateFocusAppInputMethod()
    end
end

appWatcher = application.watcher.new(applicationWatcher)
appWatcher:start()

local apps = {
    -- {'/Applications/iTerm.app', 'English'},
    {'Google Chrome'},
    {'Pages'},
}
hotkey.bind({'option'}, "f", function()
    local appName = window.focusedWindow():application():name()
    for index, app in pairs(apps) do
        local app = app[1]
        if app == appName then
            window.focusedWindow():toggleFullScreen()
            break
        end
    end
    -- if appName == "Google Chrome" or appName == "Pages" then
    --    window.focusedWindow():toggleFullScreen()
    -- end
end)
