local config = {
    cmd = {'/opt/homebrew/Cellar/jdtls/1.31.0/bin/jdtls'},
    -- root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
-- require('jdtls').start_or_attach(config)
return {
  on_setup = function(server)
    server.setup(config)
  end,
}
