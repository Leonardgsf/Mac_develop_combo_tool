-- local M = {}
-- Function to set search pattern in visual mode
function _G.set_search(cmdtype)

    
    -- local temp2 = 'new content'
    local temp
    vim.api.nvim_feedkeys('gv"sy', 'nx', true)
    
    vim.fn.setreg('z', '')
    -- temp = vim.fn.getreg('s', 1)
    local s_register_content = vim.fn.escape(vim.fn.getreg('s'), cmdtype .. '\\')
    s_register_content = s_register_content:gsub('\n', '\\n')
    vim.fn.setreg('z', '\\V' .. s_register_content)
    print("Contents of register 'z':", vim.fn.getreg('z'))
    -- print(vim.fn.getreg('z', 1))
    --[[ vim.schedule(function ()
        temp = vim.fn.getreg('s', 1)
        print(temp)
    end) ]]
    -- local temp = vim.fn.getreg('s', 1)
    -- print(temp)
    -- vim.fn.setreg('s', temp)
    -- vim.fn.setreg('z', '/content o')
    -- local temp3 = vim.fn.getreg('z')
    -- vim.fn.setreg('s', vim.fn.getreg('"', 1))
     -- vim.api.nvim_feedkeys('gv', 'n', true)
    -- vim.api.nvim_eval([[feedkeys('gv', 'n', v:true)]])
    -- local temp = vim.fn.getreg('s')
    -- print(temp)
    --[[ print("Setting search pattern...")
    
    local temp = vim.fn.getreg('s')
    print("Contents of register 's':", temp)
    
    local escaped = vim.fn.escape(temp, cmdtype .. '\\')
    print("Escaped contents:", escaped)
    
    escaped = escaped:gsub('\n', '\\n')
    
    print("Final escaped pattern:", escaped)
    
    vim.fn.setreg('/', '\\V' .. escaped)
    vim.fn.setreg('s', temp)
    
    print("Search pattern set.") ]]
end
