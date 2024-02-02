local config = {
	cmd = { '/Users/e773438/.local/share/nvim/mason/bin/jdtls' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
	handlers = { ["language/status"] = function() end },
}
require('jdtls').start_or_attach(config)
