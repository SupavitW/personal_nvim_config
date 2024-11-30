return {
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = false,
      }
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = false,
        theme = "wave",
      }
    end,
  },

  {
    "sainnhe/everforest",
    lazy = true,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
}
