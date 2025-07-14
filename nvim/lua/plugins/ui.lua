return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Base configuration
      opts.cmdline = {
        view = "cmdline_popup",
        position = {
          row = "50%", -- Center vertically
          col = "50%", -- Center horizontally
        },
        format = {
          cmdline = {
            pattern = "^:",
            icon = " 󰘳 ", -- Command icon
            lang = "vim",
            title = "",
          },
          search_down = {
            icon = "   ", -- Search down icon
          },
          search_up = {
            icon = "   ", -- Search up icon
          },
          filter = {
            icon = " 󰅶 ", -- Filter icon
          },
          lua = {
            icon = " 󰹰 ", -- Lua icon
          },
          help = {
            icon = " 󰋖 ", -- Help icon
          },
        },
      }

      opts.views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      }

      opts.presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        lsp_doc_border = true, -- From the second config
      }

      -- Additional routes and configuration from the second config
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
}
