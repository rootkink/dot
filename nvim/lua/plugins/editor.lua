return {

  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      {
        "nvim-tree/nvim-web-devicons",
        enabled = vim.g.have_nerd_font,
      },
      { "nvim-telescope/telescope-file-browser.nvim" }, -- [ADDED] file_browser extension
    },
    config = function()
      local telescope = require("telescope")
      local fb_actions = require("telescope._extensions.file_browser.actions") -- [ADDED] fb_actions
      local builtin = require("telescope.builtin")

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
          file_browser = { -- [ADDED] file_browser config
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
              ["n"] = {
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["/"] = function()
                  vim.cmd("startinsert")
                end,
              },
            },
          },
        },
      })

      -- [ADDED] Load extensions
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "ui-select")
      pcall(telescope.load_extension, "file_browser")

      -- Keymaps
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Find select telescope" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current word" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by grep" })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
      vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find resume" })
      vim.keymap.set("n", "<leader>sr.", builtin.oldfiles, { desc = "Search recent files" })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>ss", builtin.treesitter, { desc = "Search treesitter symbol" })

      vim.keymap.set("n", "<leader>s", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "Fuzzy search current buffer" })

      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Grep in Open Files",
        })
      end, { desc = "Search in open file" })

      vim.keymap.set("n", "<leader>fc", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "Search neovim config files" })

      vim.keymap.set("n", "<leader>fb", function() -- [ADDED] file browser keymap
        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 20 },
        })
      end, { desc = "Open file browser for current buffer" })
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {

      filetypes = {
        "*", -- Enable for all filetypes by default
        css = { css = true },
        scss = { css = true },
        html = { names = true },
      },
      user_default_options = {
        RGB = true, -- #RGB
        RRGGBB = true, -- #RRGGBB
        names = false, -- "blue", "red", etc.
        RRGGBBAA = true, -- #RRGGBBAA
        AARRGGBB = false, -- 0xAARRGGBB
        rgb_fn = true, -- rgb() and rgba()
        hsl_fn = true, -- hsl() and hsla()
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, etc.
        mode = "background", -- "background" | "foreground" | "virtualtext"
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
      vim.cmd("ColorizerToggle")
    end,
  },

  {
    "numToStr/Comment.nvim",
    opts = {
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
      ---Function to call before (un)comment
      pre_hook = nil,
      ---Function to call after (un)comment
      post_hook = nil, -- add any options here
    },
    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Toggle comment on current line" }),

    vim.keymap.set("v", "<leader>/", function()
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
      vim.api.nvim_feedkeys(esc, "x", false)
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle comment on selection" }),

    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<leader>r", "", desc = "+Rest", ft = "http" },
      { "<leader>rb", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad", ft = "http" },
      { "<leader>Rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL", ft = "http" },
      { "<leader>RC", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste from curl", ft = "http" },
      {
        "<leader>rg",
        "<cmd>lua require('kulala').download_graphql_schema()<cr>",
        desc = "Download GraphQL schema",
        ft = "http",
      },
      { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect current request", ft = "http" },
      { "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request", ft = "http" },
      { "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request", ft = "http" },
      { "<leader>rq", "<cmd>lua require('kulala').close()<cr>", desc = "Close window", ft = "http" },
      { "<leader>rr", "<cmd>lua require('kulala').replay()<cr>", desc = "Replay the last request", ft = "http" },
      { "<leader>rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request", ft = "http" },
      { "<leader>rS", "<cmd>lua require('kulala').show_stats()<cr>", desc = "Show stats", ft = "http" },
      { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body", ft = "http" },
    },
    opts = {},
  },
}
