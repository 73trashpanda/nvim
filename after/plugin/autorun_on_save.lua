local create_buffer_header = function(output_bufnr, pattern, command)
	local line_width = 60 -- Define the total width of the border and header
	local top_bottom_border = string.rep("#", line_width)

	-- Helper function to create a centered line for the "OUTPUT"
	local function center_text(text, width)
		local total_padding = width - #text - 2 -- 2 for the '# ' at start and end
		local side_padding = math.floor(total_padding / 2)
		return "#" .. string.rep(" ", side_padding) .. text .. string.rep(" ", total_padding - side_padding) .. "#"
	end

	-- Helper function to create a line with padding for labels and content
	local function make_line(label, content)
		local full_content = label .. content
		local padding = line_width - #full_content - 3 -- 3 for the '# ' at start and ' #' at end
		return "# " .. full_content .. string.rep(" ", padding) .. "#"
	end

	-- Preparing the header lines with adjusted centering for "OUTPUT" and formatting for details
	local header_lines = {
		top_bottom_border,
		center_text("OUTPUT", line_width), -- Centered "OUTPUT"
		make_line("Bufnr:   ", tostring(output_bufnr)),
		make_line("Pattern: ", pattern),
		make_line("Command: ", command),
		top_bottom_border,
		"",
	}

	return header_lines
end

local attatch_to_buffer = function(output_bufnr, pattern, command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("autorun-save-group", { clear = true }),
		pattern = pattern,
		callback = function()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
				end
			end

			vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, create_buffer_header(output_bufnr, pattern, command))

			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data,
			})
		end,
	})
end

vim.api.nvim_create_user_command("AutoRunOnSave", function()
	print("AutoRunOnSave starting...")
	local bufnr = vim.fn.input("Buffer number: ")
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.fn.input("Command: ")

	attatch_to_buffer(tonumber(bufnr), pattern, command)
end, {})
