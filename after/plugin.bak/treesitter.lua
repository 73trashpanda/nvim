if not pcall(require, 'nvim-treesitter.configs') then
  return
end

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'lua',
    'python',
    'php',
    'typescript',
    'javascript',
    'tsx',
    'vim',
    'bash',
    'dockerfile',
    'java',
    'latex',
    'markdown',
    'markdown_inline',
    'regex',
    'terraform',
    'yaml',
    'json',
    'html',
    'css',
    'scss',
    'sql',
    'r',
  },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        -- ['aa'] = '@parameter.outer',
        -- ['af'] = '@function.outer',
        -- ['ia'] = '@parameter.inner',
        -- ['if'] = '@function.inner',
        -- ['ac'] = '@class.outer',
        -- ['ic'] = '@class.inner',
        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter (Treesitter)" },
        ["af"] = { query = "@function.outer", desc = "Select outer part of a function (Treesitter)" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter (Treesitter)" },
        ["if"] = { query = "@function.inner", desc = "Select inner part of a function (Treesitter)" },
        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region (Treesitter)" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region (Treesitter)" },
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        -- [']m'] = '@function.outer',
        -- [']]'] = '@class.outer',
        ["]m"] = { query = "@function.outer", desc = "Jump to next function start (Treesitter)" },
        ["]]"] = { query = "@class.outer", desc = "Jump to next class start (Treesitter)" },
      },
      goto_next_end = {
        -- [']M'] = '@function.outer',
        -- [']['] = '@class.outer',
        ["]M"] = { query = "@function.outer", desc = "Jump to next function end (Treesitter)" },
        ["]["] = { query = "@class.outer", desc = "Jump to next class end (Treesitter)" },
      },
      goto_previous_start = {
        -- ['[m'] = '@function.outer',
        -- ['[['] = '@class.outer',
        ["[m"] = { query = "@function.outer", desc = "Jump to previous function start (Treesitter)" },
        ["[["] = { query = "@class.outer", desc = "Jump to previous class start (Treesitter)" },
      },
      goto_previous_end = {
        -- ['[M'] = '@function.outer',
        -- ['[]'] = '@class.outer',
        ["[M"] = { query = "@function.outer", desc = "Jump to previous function end (Treesitter)" },
        ["[]"] = { query = "@class.outer", desc = "Jump to previous class end (Treesitter)" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        -- ['<leader>a'] = '@parameter.inner',
        ["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter (Treesitter)" },
      },
      swap_previous = {
        -- ['<leader>A'] = '@parameter.inner',
        ["<leader>A"] = { query = "@parameter.inner", desc = "Swap with previous parameter (Treesitter)" },
      },
    },
  },
}

if not pcall(require, 'treesitter-context') then
  return
end

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
}
