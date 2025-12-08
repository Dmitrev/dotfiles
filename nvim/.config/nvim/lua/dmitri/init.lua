local configs = {
  "dmitri.set",
  "dmitri.deps",
  "dmitri.lazy",
  "dmitri.filetypes",
  "dmitri.devicons",
  "dmitri.lsp",
  "dmitri.dap",
  "dmitri.completion",
  "dmitri.autocmd",
  "dmitri.treesitter",
  "dmitri.treesitter-text-objects",
  "dmitri.plugins.obisidian",
  "dmitri.plugins.mini",
  "dmitri.plugins.ai",
  "dmitri.keymaps",
  "dmitri.overrides",
  "dmitri.colorscheme",
}

for _, config in ipairs(configs) do
  local ok, err = pcall(require, config)
  if not ok then
    vim.notify("Failed to load config: "..config, vim.log.levels.WARN)
    vim.notify("err: "..err, vim.log.levels.ERROR)
  end
end
