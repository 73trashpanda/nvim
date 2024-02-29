vim.api.nvim_create_user_command("FullPath", function()
	print(vim.fn.expand('%:p'))
end, {})

local function deleteLinesAbovePattern(pattern)
	local lineNum = vim.fn.search(pattern, "nW")

	if lineNum > 1 then
		vim.cmd('1,' .. lineNum .. 'd')
	end
end

vim.api.nvim_create_user_command(
	"ParseSpringBootLog",
	function()
		-- Remove all lines above pattern :: Spring Boot ::
		deleteLinesAbovePattern(":: Spring Boot ::")

		-- Remove all lines that do not start with "at"
		vim.cmd('g/^\tat/d')

		-- Remove all lines that do not start with "Caused by:"
		vim.cmd('g/Caused by:/normal O')
	end, {})
