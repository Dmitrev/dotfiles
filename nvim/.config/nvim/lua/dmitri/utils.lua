local M = {}

M.reload = function(module)
    local reload = require("plenary.reload").reload_module
    reload("dmitri", false)

    dofile(vim.env.MYVIMRC)
end

M.get_relative_path = function()
    local path = vim.fn.expand("%") -- get relative path
    local cwd = vim.fn.getcwd()

    path = string.gsub(path, cwd, "") -- sometimes the path is absolute so we need to make it relative

    local first_char = string.sub(path, 1, 1)

    if first_char == "/" then
        path = string.sub(path, 2) -- skip first char
    end

    return path
end


M.copy_github_link = function()
    local relative_path = vim.fn.expand("%")
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

return M
