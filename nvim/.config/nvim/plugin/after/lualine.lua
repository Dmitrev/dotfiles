local ok, lualine = pcall(require, 'lualine')

if not ok then
    return
end

return

-- require('lualine').setup {
--   options = {
--     always_divide_middle = false,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     -- lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_b = {'branch'},
--     lualine_c = {
--       {
--         'filename',
--         path = 1,
--       }
--     },
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
-- }
