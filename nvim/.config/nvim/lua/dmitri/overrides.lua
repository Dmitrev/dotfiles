local gl_loaded, gl = pcall(require, 'goodlord')

local overrides = {};
if gl_loaded then
  if type(gl) == "table" then
    overrides = vim.tbl_deep_extend("force", overrides, gl)
  else
  end
else
  vim.print(vim.inspect(gl))
end

return overrides
