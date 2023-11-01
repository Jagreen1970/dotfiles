require("bufferline").setup {
  options = {
    -- NVIm built-in LSP 
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ""
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
        or (e == "warning" and " " or "" )
        s = sym .. n .." " .. s
      end
      return s
    end
  }
}
