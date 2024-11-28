return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    opts = function()
      return {
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "shfmt" },
          go = { "gofmt" },
          javascript = { "prettier" },
          tsx = { "prettier" },
          typescript = { "prettier" },
          cs = { "csharpier" },
          angular = { "prettier" },
        },
      }
    end,
  },
}
