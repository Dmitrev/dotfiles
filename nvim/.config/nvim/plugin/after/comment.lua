local ok, ft = pcall(require, 'Comment.ft')

if not ok then
    return
end

ft.set('kdl', '// %s')
ft.set('mysql', '-- %s')
ft.set('hurl', '# %s')
