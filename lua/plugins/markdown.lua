return {
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<Leader>mdo", "<Cmd>MarkdownPreview<CR>", desc = "Markdown preview open" },
      { "<Leader>mds", "<Cmd>MarkdownPreviewStop<CR>", desc = "Markdown preview close" },
      { "<leader>mdt", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Markdown preview toggle" },
    },
  },
}
