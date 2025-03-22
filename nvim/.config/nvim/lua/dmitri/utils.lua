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

M.ssh_host_lookup = function(s)
    local handle = io.popen("ssh -G " .. s .." | grep ^hostname")

    if handle == nil then
        print("something went wrong trying to look up ssh host override")
        return
    end

    local result = handle:read("*a")
    handle:close()

    local override = result:gsub("hostname ", "")
    override = override:gsub("[\n\r]", "")

    return override
end

--- @return table
M.get_meta_from_git_url = function(s)
    local found_at_sym = s:find("@")
    local found_col_sym = s:find(":")
    local start_index = found_at_sym + 1;
    local end_index = found_col_sym - 1;
    local host = string.sub(s, start_index, end_index)
    local uri = string.sub(s, found_col_sym + 1)
    uri = uri:gsub("[\n\r]", "")
 
    return {
        host = host, 
        uri = uri,
    }
end

M.copy_github_link = function()
    local relative_path = M.get_relative_path() 
    local git_cmd = "git ls-remote --get-url origin"
    local git_cmd_handle = io.popen(git_cmd)

    if git_cmd_handle == nil then
        print("something went wrong trying to get the remote url")
        return
    end

    local git_repo_url = git_cmd_handle:read("*a")
    local url = M.get_meta_from_git_url(git_repo_url)
    local host = M.ssh_host_lookup(url.host)
    local uri = url.uri:gsub(".git", "")

    local git_url = "https://".. host .. "/" .. uri .. '/blob/master/' .. relative_path

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
