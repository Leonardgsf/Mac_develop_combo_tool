-- 自动关闭
vim.cmd([[
set switchbuf=usetab
set clipboard=unnamed " vim使用系统剪贴板
set clipboard+=unnamedplus " 使用系统剪贴板
set mouse=nvi
set selection=exclusive
set selectmode=mouse,key
set modifiable
set ma
set nobackup
set cursorline                  "突出显示当前行"
set cursorcolumn                "突出显示当前列"
" 自动生成gtags
let g:gen_tags#gtags_auto_gen=1
" 自动更新gtags
let g:gen_tags#gtags_auto_update=1
" 在状态栏显示生成tags文件状态
let g:gen_tags#statusline=1


" 搜索跳转自动关闭下面搜索记录框
au BufLeave * if &buftype == "quickfix" | ccl|endif

]])
-- Array of file names indicating root directory. Modify to your liking.
local root_names = { '.git', 'Makefile' }

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

local set_root = function()
  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then return end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then return end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
end

local root_augroup = vim.api.nvim_create_augroup('MyAutoRoot', {})
vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })
