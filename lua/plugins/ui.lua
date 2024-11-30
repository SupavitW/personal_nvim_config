return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
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
          -- options for the message history that you get with `:Noice`
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

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local LazyVim = require("lazyvim.util")
      opts.sections.lualine_c[4] = {
        LazyVim.lualine.pretty_path({
          length = 0,
          relative = "cwd",
          modified_hl = "MatchParen",
          directory_hl = "",
          filename_hl = "Bold",
          modified_sign = "",
          readonly_icon = " 󰌾 ",
        }),
      }
    end,
  },

  -- nvim-focus
  {
    "nvim-focus/focus.nvim",
    lazy = false,
    version = "*",
    opts = function()
      return {
        enable = false, -- Enable module
        commands = true, -- Create Focus commands
        autoresize = {
          enable = true, -- Enable or disable auto-resizing of splits
          width = 0, -- Force width for the focused window
          height = 0, -- Force height for the focused window
          minwidth = 0, -- Force minimum width for the unfocused window
          minheight = 0, -- Force minimum height for the unfocused window
          height_quickfix = 10, -- Set the height of quickfix panel
        },
        split = {
          bufnew = false, -- Create blank buffer for new split windows
          tmux = false, -- Create tmux splits instead of neovim splits
        },
        ui = {
          number = false, -- Display line numbers in the focussed window only
          relativenumber = false, -- Display relative line numbers in the focussed window only
          hybridnumber = false, -- Display hybrid line numbers in the focussed window only
          absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

          cursorline = true, -- Display a cursorline in the focussed window only
          cursorcolumn = false, -- Display cursorcolumn in the focussed window only
          colorcolumn = {
            enable = false, -- Display colorcolumn in the foccused window only
            list = "+1", -- Set the comma-saperated list for the colorcolumn
          },
          signcolumn = true, -- Display signcolumn in the focussed window only
          winhighlight = true, -- Auto highlighting for focussed/unfocussed windows
        },
      }
    end,
  },

  -- {
  --   "nvimdev/dashboard-nvim",
  --   event = "VimEnter",
  --   opts = function(_, opts)
  --     local logo = {
  --       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀    ",
  --       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ",
  --       "⠀⠀⠀⠀⠀⠀⠀⣠⠴⠒⠋⢉⡝⠲⢦⡀⠀⠀⠀⠀⠀⠀        ",
  --       "⠀⠀⠀⠀⢀⡴⠚⢡⣤⣤⣴⣾⣷⣷⣨⢷⣀⡀⠀⠀⠀⠀⠀⠀      ",
  --       "⠀⢀⣠⠴⠋⠀⠀⠘⣟⡛⡽⡹⣫⣿⣴⣤⠿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  --       "⠈⠉⠁⢰⡦⡄⠀⣤⠌⣷⣷⣷⢣⠟⠛⠻⣼⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠",
  --       "⢰⣾⣶⣦⢿⣭⣆⡻⣿⣿⣿⣻⣸⡀⠀⠃⠿⠷⠂⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁",
  --       "⢸⣿⢿⣿⣎⢿⢿⣿⡿⠛⠛⠳⣿⣧⡀⠰⣿⠂⠀⠀⠀⠀⠀⠀⠀⣠⠖⠁⢀⠾",
  --       "⠀⠙⢿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠙⠿⣦⣄⣀⡀⠀⣀⣀⣠⠴⠚⣁⡠⣾⣯⢟",
  --       "⠀⠠⣄⣀⣀⡀⠲⡄⠰⠒⠃⡴⣶⣦⡐⢄⣯⣍⡛⠛⠉⢉⡀⢀⣩⠵⠶⠛⡵⢛",
  --       "⠀⣤⣾⠛⣟⣹⣦⣒⣢⢿⣾⣧⡸⢙⠿⣶⣷⣬⣊⣳⣿⣽⣟⡟⠛⣋⣒⣓⣒⣪",
  --       "⠀⠿⠃⠀⠹⠿⠿⠧⠴⠶⠾⡿⠇⠤⠕⠚⠿⠿⠟⠻⠛⠭⠥⠶⠭⠭⠤⠤⠤⠤",
  --     }
  --
  --     logo = string.rep("\n", 8) .. table.concat(logo, "\n") .. "\n\n"
  --     opts.config.header = vim.split(logo, "\n")
  --   end,
  -- },
}
