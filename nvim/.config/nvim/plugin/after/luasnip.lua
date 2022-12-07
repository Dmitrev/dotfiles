local ls = require "luasnip"
local types = require "luasnip.util.types"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local parse = require("luasnip.util.parser").parse_snippet

ls.config.set_config({
    -- allows you to jump back into the previous snippet
    history = true,
    
    -- update snippets as you type (if your snippets are dynamic)
    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = true

})


vim.keymap.set({ "i", "s"}, "<c-k>", function ()
    print('does this get called?')
   if ls.expand_or_jumpable() then
    ls.expand_or_jump()
   end
end, {silent = true})

vim.keymap.set({ "i", "s"}, "<c-j>", function ()
   if ls.jumpable(-1) then
    ls.jump(-1)
   end
end, {silent = true})

vim.keymap.set({ "i" }, "<c-l>", function ()
   if ls.choice_active() then
    ls.change_choice(1)
   end
end, {silent = true})


-- shortcut to reload snippets
vim.keymap.set({"n"}, "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")


ls.add_snippets("all", {
    s("expand", {
        t("-- this thing just expanded")
    })
})

