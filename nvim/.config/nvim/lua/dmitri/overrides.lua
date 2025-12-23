local gl_loaded, gl = pcall(require, 'goodlord')

local overrides = {};
if gl_loaded then
  if type(gl) == "table" then
    overrides = vim.tbl_deep_extend("force", overrides, gl)
  end
end

return overrides
