return {
  {
    "tigion/nvim-asciidoc-preview",
    cmd = { "AsciiDocPreview" },
    ft = { "asciidoc" },
    build = "cd server && npm install",
    opts = {
      -- Add user configuration here
    },
  },
  -- { "habamax/vim-asciidoctor" },
}
