local telescope_loaded, telescope = pcall(require, 'telescope')

if not telescope_loaded then
    return
end

local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local new_maker = function(filepath, bufnr, opts)
    opts = opts or {}

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then return end
        if stat.size > 1000000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end

local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
  defaults = {
     -- winblend = 30, -- add transparency 
     buffer_previewer_maker = new_maker
  },
  pickers = {
    oldfiles = {
      cwd_only = true
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },

    live_grep_args = {
      auto_quoting = false, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-space>"] = actions.to_fuzzy_refine,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "fzf"
require("telescope").load_extension("live_grep_args")
