local M = {}

M.reload = function(module)
    local reload = require("plenary.reload").reload_module
    reload("dmitri", false)

    dofile(vim.env.MYVIMRC)
end

--- @return string
M.get_relative_path = function()
    return vim.fn.expand("%:.") -- get relative path
end
---
--- @return string
M.get_filename = function()
    return vim.fn.expand("%:t")
end

--- @return nil
M.copy_to_clipboard = function(contents)
    vim.fn.setreg("+", contents)
end

--- @return boolean
M.has_prefix = function(prefix, s)
    return string.sub(s, 1, #prefix) == prefix
end

--- @return string
M.strip_prefix = function(prefix, s)
    if M.has_prefix(prefix, s) ~= true then
        return s
    end

    return string.sub(s, #prefix + 1)
end


M.copy_github_link = function()
    local relative_path = M.get_relative_path() 
    local git_cmd = "git ls-remote --get-url origin"
    local git_cmd_handle = io.popen(git_cmd)

    if git_cmd_handle == nil then
        print("something went wrong trying to get the remote url")
        return
    end

    local git_repo_base = git_cmd_handle:read("*a")
    git_repo_base = git_repo_base:gsub(":", "/")
    git_repo_base = git_repo_base:gsub("git@", "https://")
    git_repo_base = git_repo_base:gsub("%.git", "") -- the % is an escape char
    git_repo_base = git_repo_base:gsub("[\n\r]", "") -- remove new line

    local git_url = git_repo_base .. '/blob/master/' .. relative_path


    local start_line = vim.fn.getpos("v")[2]
    local end_line = vim.api.nvim_win_get_cursor(0)[1]
    local current_mode = vim.api.nvim_get_mode().mode

    local line_anchor = ''

    -- if in Visual Line mode
    if current_mode == "V" then
        line_anchor = '#L'..start_line..'-L'..end_line
    end

    git_url = git_url .. line_anchor
    io.popen("open "..git_url)
end

-- get first hash of the file
-- git log --all --reverse -m --pretty=format:%H --max-count=1 --find-object `git hash-object app/Utils/PricingUtils.php`
-- git log -p -n 1 -s --pretty='format:%H' -- app/Utils/PricingUtils.php


return M
