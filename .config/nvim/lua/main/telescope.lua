local M = {}

function M.setup()
  local builtin = require('telescope.builtin')

  vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
  vim.keymap.set("n", "<Leader>fs", builtin.live_grep, {})
  vim.keymap.set("n", "<Leader>fg", builtin.git_files, {})
  vim.keymap.set("n", "<Leader>/", function()
    builtin.current_buffer_fuzzy_find({ fuzzy = false, case_mode = ignore_case })
  end, {})

  vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
  vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)

  vim.keymap.set("n", "<Leader>vc", builtin.git_commits, {})
  vim.keymap.set("n", "<Leader>vb", builtin.git_branches, {})

  require('telescope').setup{
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
      },
      path_display = { "smart" },
      file_ignore_patterns = {
        ".git/",
        "target/",
        "docs/",
        "vendor/*",
        "%.lock",
        "__pycache__/*",
        "%.sqlite3",
        "%.ipynb",
        "node_modules/*",
        "%.jpg",
        "%.jpeg",
        "%.png",
        "%.svg",
        "%.otf",
        "%.ttf",
        "%.webp",
        ".dart_tool/",
        ".github/",
        ".gradle/",
        ".idea/",
        ".settings/",
        ".vscode/",
        "__pycache__/",
        "build/",
        "env/",
        "gradle/",
        "node_modules/",
        "%.pdb",
        "%.dll",
        "%.class",
        "%.exe",
        "%.cache",
        "%.ico",
        "%.pdf",
        "%.dylib",
        "%.jar",
        "%.docx",
        "%.met",
        "smalljre_*/*",
        ".vale/",
        "%.burp",
        "%.mp4",
        "%.mkv",
        "%.rar",
        "%.zip",
        "%.7z",
        "%.tar",
        "%.bz2",
        "%.epub",
        "%.flac",
        "%.tar.gz",
        -- PHP
        "var/",
        "vendor/",
      },
    },
    extensions = {
--      ["fzf"] = {
--        fuzzy = true,                    -- false will only do exact matching
--        override_generic_sorter = true,  -- override the generic sorter
--        override_file_sorter = true,     -- override the file sorter
--        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
--      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      }
    }
  }

  require('telescope').load_extension('fzf')
  require("telescope").load_extension("ui-select")

end

return M
