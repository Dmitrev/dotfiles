local dependencies = {
  uv = {
    description = "An extremely fast Python package and project manager, written in Rust.",
    install = "https://docs.astral.sh/uv/getting-started/installation/",
  },
  vectorcode = {
    description = "Used for indexing a codebase to use with LLM",
    install = "https://github.com/Davidyz/VectorCode/blob/main/docs/cli.md#installation"
  },
}

for dep, meta in ipairs(dependencies) do
  local handle = io.popen("which " .. dep)
  local result = handle:read("*a")
  handle:close()

  if result == "" then
    vim.notify("Dependency '" .. dep .. "' is not installed. Please install it before running the script.")
    vim.notify("description: '" .. meta.description .. "'")
    vim.notify("see: " .. meta.install)
    return false
  end
end
