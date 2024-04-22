-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua

local common = require("lsp.common-config")
-- local status, nvim_lsp = require("nvim-lspconfig")

-- local status,nvim_lsp = pcall(require, 'nvim-lspconfig')
-- local status,nvim_lsp = pcall(require, 'mason-lspconfig')
--[[ local status,nvim_lsp = pcall(require, 'lspconfig')
if not status then
  vim.notify("没有找到 nvim-lspconfig")
  return
end ]]

local opts = {
  capabilities = common.capabilities,
  --[[ handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
  }, ]]

  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
  settings = {
        -- root_dir = lspconfig.util.root_pattern("composer.json", ".git" , "test.php", "index.php");
        -- root_dir = nvim_lsp.util.root_pattern("composer.json", ".git" , "test.php", "index.php"),
        --[[ root_dir =  function(fname)
          return vim.loop.cwd()
        end; ]]
        -- root_dir = vim.loop.cwd(),
        intelephense = {
        -- Add wordpress to the list of stubs
        --[[ [[ stubs = {
            "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
            "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
            "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli",
            "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
            "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap",
            "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
            "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
            "wordpress", "phpunit",
        }, ]]
        diagnostics = {
            enable = true,
            -- enable = false,
        },
        files = { associations = {"*.php", "*.phtml", "*.module", "*.inc"}},
    }
  },

  -- custom handler
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    }),
  },
}

return {
  on_setup = function(server)
    -- require("neodev").setup()
  -- lspconfig.intelephense.setup(opts)
  server.setup(opts)
  -- server:setup(opts)
  -- server:setup(opts)
  end,
}
