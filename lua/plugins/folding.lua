-- Function to trim blank lines from the end of a fold
local function trimFoldRange(bufnr, foldstart, foldend)
  local lines = vim.api.nvim_buf_get_lines(bufnr, foldstart - 1, foldend, false)
  while #lines > 0 and lines[#lines]:match("^%s*$") do
    table.remove(lines)
    foldend = foldend - 1
  end
  return foldstart, foldend
end

-- Helper function to wrap providers
local function wrapProvider(providerName)
  return function(bufnr)
    return function(lnum)
      local ok, ranges = pcall(ufo.getFolds, bufnr, providerName, lnum)
      if not ok then
        return {}
      end

      local trimmedRanges = {}
      for _, range in ipairs(ranges) do
        local startLine, endLine = trimFoldRange(bufnr, range.startLine + 1, range.endLine + 1)
        table.insert(trimmedRanges, {
          startLine = startLine - 1,
          endLine = endLine - 1,
        })
      end
      return trimmedRanges
    end
  end
end

local gen_UFO_fold_text = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

return {
  { -- folding
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost", -- needed for folds to load properly
    keys = {
      {
        "zr",
        function()
          require("ufo").openFoldsExceptKinds({ "comment" })
        end,
        desc = " 󱃄 Open All Folds except comments",
      },
      {
        "zm",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = " 󱃄 Close All Folds",
      },
      {
        "z1",
        function()
          require("ufo").closeFoldsWith(1)
        end,
        desc = " 󱃄 Close L1 Folds",
      },
      {
        "z2",
        function()
          require("ufo").closeFoldsWith(2)
        end,
        desc = " 󱃄 Close L2 Folds",
      },
      {
        "z3",
        function()
          require("ufo").closeFoldsWith(3)
        end,
        desc = " 󱃄 Close L3 Folds",
      },
      {
        "z4",
        function()
          require("ufo").closeFoldsWith(4)
        end,
        desc = " 󱃄 Close L4 Folds",
      },
    },
    init = function()
      -- INFO fold commands usually change the foldlevel, which fixes folds, e.g.
      -- auto-closing them after leaving insert mode, however ufo does not seem to
      -- have equivalents for zr and zm because there is no saved fold level.
      -- Consequently, the vim-internal fold levels need to be disabled by setting
      -- them to 99
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    opts = {
      providers = {
        treesitterWithTrim = wrapProvider("treesitter"),
        indentWithTrim = wrapProvider("indent"),
        lspWithTrim = wrapProvider("lsp"),
      },
      fold_virt_text_handler = gen_UFO_fold_text,
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == "tex" then
          return { "lsp", "indent" }
        else
          return { "treesitter", "indent" }
        end
      end,
      -- provider_selector = function(_, ft, _)
      --    -- INFO some filetypes only allow indent, some only LSP, some only
      --    -- treesitter. However, ufo only accepts two kinds as priority,
      --    -- therefore making this function necessary :/
      --    local lspWithOutFolding =
      --    { "markdown", "bash", "sh", "bash", "zsh", "css", "html", "python" }
      --    if vim.tbl_contains(lspWithOutFolding, ft) then return { "treesitter", "indent" } end
      --    return { "lsp", "indent" }
      --  end,
      --  -- open opening the buffer, close these fold kinds
      --  -- use `:UfoInspect` to get available fold kinds from the LSP
    },
  },
}
