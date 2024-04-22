-- window management
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

-- default 0.2
window.animationDuration = 0
-- alert.defaultStyle['fadeOutDuration'] = 0.05

function toggle_full()
    local win = window.focusedWindow()
    if win:isFullScreen() then
        win:toggleFullScreen()
    end
end
-- left half
hotkey.bind(hyperCtrl, "h", function()
  if window.focusedWindow() then
    window.focusedWindow():moveToUnit(layout.left50)
  else
    alert.show("No active window")
  end
end)

-- right half
hotkey.bind(hyperCtrl, "l", function()
  toggle_full()
  window.focusedWindow():moveToUnit(layout.right50)
end)

-- top half
hotkey.bind(hyperCtrl, "k", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[0,0,100,50]'
end)

-- bottom half
hotkey.bind(hyperCtrl, "j", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[0,50,100,100]'
end)

-- left top quarter
hotkey.bind(hyperAlt, "h", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[0,0,50,50]'
end)

-- right bottom quarter
hotkey.bind(hyperAlt, "l", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[50,50,100,100]'
end)

-- right top quarter
hotkey.bind(hyperAlt, "k", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[50,0,100,50]'
end)

-- left bottom quarter
hotkey.bind(hyperAlt, "j", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[0,50,50,100]'
end)

-- left third
hotkey.bind(hyperCtrl, "d", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[0,0,30,100]'
end)

-- center third
hotkey.bind(hyperCtrl, "v", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[33,0,66,100]'
end)

-- right third
hotkey.bind(hyperCtrl, "g", function()
  toggle_full()
  window.focusedWindow():moveToUnit'[66,0,100,100]'
end)
-- full screen
hotkey.bind(hyperCtrl, ';', function() 
  window.focusedWindow():toggleFullScreen()
end)

-- center window
hotkey.bind(hyperCtrl, 'c', function() 
  toggle_full()
  window.focusedWindow():centerOnScreen()
end)

-- maximize window
hotkey.bind(hyperCtrl, 'm', function()
  toggle_full()
  toggle_maximize()
end)

-- defines for window maximize toggler
local frameCache = {}
-- toggle a window between its normal size, and being maximized
function toggle_maximize()
    local win = window.focusedWindow()
    win:maximize()
    --[[ if frameCache[win:id()] then
        win:setFrame(frameCache[win:id()])
        frameCache[win:id()] = nil
    else
        frameCache[win:id()] = win:frame()
        win:maximize()
    end ]]
end
-- display a keyboard hint for switching focus to each window
hotkey.bind(hyperShift, '/', function()
    -- hints.windowHints()
    -- Display current application window
    -- hints.windowHints(hs.window.focusedWindow():application():allWindows())
end)

-- switch active window
 --[[ hotkey.bind(hyper, "h", function()
  window.switcher.nextWindow()
end) ]]

-- move active window to previous monitor
-- hotkey.bind(hyper, "h", function()
--   local winnow = window.focusedWindow()
--   -- toggle_full()
--   winnow:moveOneScreenWest()
-- end)

-- move active window to next monitor
-- hotkey.bind(hyper, "l", function()
--   local winnow = window.focusedWindow()
--   -- toggle_full()
--   winnow:moveOneScreenEast()
-- end)
-- open application using shortcut
hotkey.bind({'ctrl', 'cmd'}, "c", function()
  application.open('/Applications/Google Chrome.app')
  -- toggle_maximize()
end)
hotkey.bind({'ctrl', 'cmd'}, "e", function()
  -- application.open('Microsoft Edge.app')
  hs.execute('open http://192.168.1.131:5601/app/dev_tools#/console', true);
  hs.execute('open http://hddkib.huidianying.cn/app/dev_tools#/console', true);
end)
hotkey.bind({'ctrl', 'cmd'}, "t", function()
  application.open('iTerm.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "w", function()
  application.open('WeChat.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "d", function()
  -- application.open('Fiddler Everywhere.app')
  application.open('Fiddler_old.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "-", function()
  -- application.open('Downie 4.app')
  local lastApplication = hs.application.frontmostApplication()
  hs.application.get("Hammerspoon"):activate()
  local a,n = hs.dialog.textPrompt("Replace space to underscore", "Please enter string:", "", "OK", "Cancel", false)
  n =  string.gsub(n, "^%s*(.-)%s*$", "%1")
  n = n:gsub(' ', '_')
  hs.pasteboard.setContents(n)

  if lastApplication then
    lastApplication:activate()
  end
  
end)
hotkey.bind({'ctrl', 'cmd'}, "1", function()
  -- application.open('Downie 4.app')
  local lastApplication = hs.application.frontmostApplication()
  hs.application.get("Hammerspoon"):activate()
  local a,n = hs.dialog.textPrompt("Calcuate split table name", "Please enter number:", "", "OK", "Cancel", false)
  alert.show("info/contact分表为:" .. n%16
        .. "\n"
        .. "phone分表为:" .. n%32
        -- .. a%16
  )
  if lastApplication then
    lastApplication:activate()
  end
  
end)
hotkey.bind({'ctrl', 'cmd'}, "h", function()
  -- application.open('Downie 4.app')
  alert.show("xmind:m"
        .. "\n"
        .. "downoads: u"
        .. "\n"
        .. "qq music: 9"
        .. "\n"
        .. "typora: 6"
        .. "\n"
        .. "fiddler: d"
        .. "\n"
        .. "python: 5"
        .. "\n"
        .. "draw.io: o"
        .. "\n"
        .. "notes: ;"
        .. "\n"
        .. "pdf_friends: ."
        .. "\n"
        .. "show message: z"
        .. "\n"
        -- .. a%16
        .. "php chm : 8"
        -- .. a%16
        -- .. a%16
        -- .. a%16
  )
  
end)
hotkey.bind({'ctrl', 'cmd'}, "n", function()
  application.open('Notion.app')
  os.execute("sleep " .. tonumber(2))
  toggle_full()
  toggle_maximize()
end)
hotkey.bind({'ctrl', 'cmd'}, "4", function()
  application.open('/Applications/Lark.app/')
end)
hotkey.bind({'ctrl', 'cmd'}, "0", function()
  application.open('XTerminal.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "3", function()
  application.open('/Applications/WeChat.app/Contents/MacOS/WeChatAppEx.app/')
end)
hotkey.bind({'ctrl', 'cmd'}, "9", function()
  application.open('QQMusic.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "6", function()
  application.open('Typora.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "y", function()
  application.open('youdaoDict.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "5", function()
  application.open('PyCharm CE.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "i", function()
  -- application.open('PyCharm CE.app')
  application.open('Sublime Text.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "p", function()
  application.open('Pages.app')
  -- os.execute("sleep " .. tonumber(2))
  -- toggle_full()
  -- toggle_maximize()
end)
hotkey.bind({'ctrl', 'cmd'}, "g", function()
  -- application.open('/System/Library/CoreServices/Finder.app')
  hs.execute('open /Users/Feng/Desktop', true);

end)
hotkey.bind({'ctrl', 'cmd'}, "f", function()
  -- application.open('/System/Library/CoreServices/Finder.app')
  hs.execute('open /Users/Feng/Documents/wywl/', true);

end)
hotkey.bind({'ctrl', 'cmd'}, "2", function()
  -- application.open('/System/Library/CoreServices/Finder.app')
  hs.execute('open /Users/Feng/Movies/TED/202304/', true);

end)
hotkey.bind({'ctrl', 'cmd'}, ".", function()
  -- application.open('/System/Library/CoreServices/Finder.app')
  hs.execute('open /Users/Feng/Movies/Friends/Friends_PDF/PDF-S02', true);

end)
hotkey.bind({'ctrl', 'cmd'}, "x", function()
  -- application.open('Apifox.app')
  hs.execute('open https://yapi.55yisheng.com/group/66', true);
  hs.execute('open https://yapi.55yisheng.com/project/187/interface/api', true);
end)
hotkey.bind({'ctrl', 'cmd'}, "o", function()
  application.open('draw.io.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "s", function()
  application.open('/Applications/wpsoffice.app/')
  toggle_maximize()
end)
hotkey.bind({'ctrl', 'cmd'}, ";", function()
  application.open('/System/Applications/Notes.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "7", function()
  application.open('IINA.app')
  toggle_maximize()
end)
hotkey.bind({'ctrl', 'cmd'}, "l", function()
  application.open('Navicat Premium.app')
  toggle_maximize()
end)
hotkey.bind({'ctrl', 'cmd'}, "j", function()
  hs.execute('sh /Users/Feng/shell/open_emf.sh', true);

end)
-- hotkey.bind({'ctrl', 'cmd'}, "s", function()
--   application.open('/Applications/Wireshark.app')
-- end)
hotkey.bind({'ctrl', 'cmd'}, "m", function()
  application.open('/Applications/XMind.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "v", function()
  application.open('/Applications/PDF Expert.app')
end)
hotkey.bind({'ctrl', 'cmd'}, "k", function()
  -- application.open('/System/Applications/Notes.app')
  hs.execute('open /Applications/', true);
end)
hotkey.bind({'ctrl', 'cmd'}, "u", function()
  -- application.open('/System/Applications/Notes.app')
  hs.execute('open /Users/Feng/Downloads/', true);
end)
hotkey.bind({'ctrl', 'cmd'}, "8", function()
  -- application.open('/System/Applications/Notes.app')
  hs.execute('open /Users/Feng/study/php/php_enhanced_en.chm', true);
  toggle_maximize();
end)
-- move cursor to previous monitor
--[[ hotkey.bind(hyperCtrl, "1", function ()
  focusScreen(window.focusedWindow():screen():previous())
end) ]]

-- move cursor to next monitor
--[[ hotkey.bind(hyperCtrl, "2", function ()
  focusScreen(window.focusedWindow():screen():next())
end) ]]


--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
  return win:screen() == screen
end

function focusScreen(screen)
  --Get windows within screen, ordered from front to back.
  --If no windows exist, bring focus to desktop. Otherwise, set focus on
  --front-most application window.
  local windows = fnutils.filter(
      window.orderedWindows(),
      fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or window.desktop()
  windowToFocus:focus()

  -- move cursor to center of screen
  local pt = geometry.rectMidPoint(screen:fullFrame())
  mouse.setAbsolutePosition(pt)
end

-- maximized active window and move to selected monitor
local moveto = function(win, n)
  local screens = screen.allScreens()
  if n > #screens then
    alert.show("Only " .. #screens .. " monitors ")
  else
    local toWin = screen.allScreens()[n]:name()
    -- alert.show("Move " .. win:application():name() .. " to " .. toWin)
    layout.apply({{nil, win:title(), toWin, layout.maximized, nil, nil}})
    -- window.focusedWindow():toggleFullScreen()
  end end

-- move active window to next monitor
--[[ hotkey.bind(hyper, "j", function()
  -- window.focusedWindow():moveOneScreenEast()
  local win = window.focusedWindow()
  moveto(win, 1)
end) ]]

-- move active window to next monitor
--[[ hotkey.bind(hyper, "h", function()
  -- window.focusedWindow():moveOneScreenEast()
  local win = window.focusedWindow()
  moveto(win, 3)
end) ]]
-- move active window to next monitor
--[[ hotkey.bind(hyper, "l", function()
  -- window.focusedWindow():moveOneScreenEast()
  local win = window.focusedWindow()
  moveto(win, 2)
end) ]]
-- move cursor to monitor 1 and maximize the window
hotkey.bind(hyperShift, "2", function()
  -- local win = window.focusedWindow()
  -- moveto(win, 1)
  focusScreen(screen.allScreens()[1])
  alert.show("Mac-2", 1)
  -- alert.show("Cursor is on the " .. screen.allScreens()[1]:fullFrame().. " monitors ")

end)

hotkey.bind(hyperShift, "1", function()
  -- local win = window.focusedWindow()
  -- moveto(win, 2)
  focusScreen(screen.allScreens()[2])
  alert.show("Redmi-1", 1)
end)

--[[ hotkey.bind(hyperShift, "3", function()
  -- local win = window.focusedWindow()
  -- moveto(win, 3)
  focusScreen(screen.allScreens()[2])
  alert.show("Dell-3", 1)
end) ]]

-- Configure the maximum number of clipboard history items to store
local MAX_CLIPBOARD_ITEMS = 10

-- Initialize the clipboard history table
local clipboardHistory = {}

-- Create a menubar object
local clipboardMenubar = hs.menubar.new()

-- Function to show the clipboard history as a menu
local function showClipboardHistory()
    local menuData = {}
    for i, item in ipairs(clipboardHistory) do
        local menuItem = {
            title = item,
            tooltip = item,
            fn = function()
                -- Set the selected item in the clipboard
                hs.pasteboard.setContents(item)
                -- Paste the selected item
                hs.eventtap.keyStroke({"cmd"}, "v")
            end
        }
        table.insert(menuData, menuItem)
    end
    clipboardMenubar:setMenu(menuData)
end

-- Function to add an item to the clipboard history
local function addToClipboardHistory()
    local currentItem = hs.pasteboard.getContents()
    if currentItem ~= nil and currentItem ~= "" then
        -- Remove duplicate item, if it exists
        for i, item in ipairs(clipboardHistory) do
            if item == currentItem then
                table.remove(clipboardHistory, i)
                break
            end
        end

        -- Add the current item to the beginning of the history
        table.insert(clipboardHistory, 1, currentItem)

        -- Limit the clipboard history to the maximum number of items
        while #clipboardHistory > MAX_CLIPBOARD_ITEMS do
            table.remove(clipboardHistory)
        end

        -- Update the menubar to reflect the new clipboard history
        showClipboardHistory()
    end
end

-- Watch for changes in the clipboard
-- clipboardWatcher = hs.pasteboard.watcher.new(addToClipboardHistory)
-- clipboardWatcher:start()

-- Configure a hotkey to show the clipboard history
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "v", function()
    -- showClipboardHistory()
end)

-- Initialize the menubar with an initial placeholder title
-- Function to move window to another screen while preserving fullscreen status
-- local function moveWindowToNextScreen()
--   local win = hs.window.focusedWindow()
--   if win then
--     local isFullScreen = win:isFullScreen()
--     local currentScreen = win:screen()
--     local nextScreen = currentScreen:next()
--
--     if nextScreen then
--       if isFullScreen then
--         win:setFullScreen(false)
--       end
--
--       win:moveToScreen(nextScreen)
--
--       if isFullScreen then
--         hs.timer.doAfter(0.1, function()
--           win:setFullScreen(true)
--         end)
--       end
--
--       -- Delay to remove old screen window after the move
--       hs.timer.doAfter(0.5, function()
--         local oldScreenWindows = currentScreen:allWindows()
--         for _, window in ipairs(oldScreenWindows) do
--           if window ~= win then
--             window:close()
--           end
--         end
--       end)
--     end
--   end
-- end
--
-- -- Move active window to the next screen while preserving fullscreen status
-- hotkey.bind(hyper, "h", function()
--   moveWindowToNextScreen()
-- end)
-- Move active window to the next screen
hotkey.bind(hyper, "h", function()
  local win = hs.window.focusedWindow()
  local isFullScreen = win:isFullScreen()
  if win then
    local nextScreen = win:screen():next()
    if nextScreen then
      if isFullScreen then
        win:setFullScreen(false)
        hs.timer.doAfter(1.0, function()
          win:moveToScreen(nextScreen)
          win:setFullScreen(true)
        end)
        -- win:setFullScreen(true)
      else
        win:moveToScreen(nextScreen)
      end
    end
  end
end)

-- Move active window to the previous screen
hotkey.bind(hyper, "l", function()
  local win = hs.window.focusedWindow()
  local isFullScreen = win:isFullScreen()
  if win then
    local nextScreen = win:screen():previous()
    if nextScreen then
      if isFullScreen then
        win:setFullScreen(false)
        hs.timer.doAfter(1.0, function()
          win:moveToScreen(nextScreen)
          win:setFullScreen(true)
        end)
        -- win:setFullScreen(true)
      else
        win:moveToScreen(nextScreen)
      end
    end
  end
end)
