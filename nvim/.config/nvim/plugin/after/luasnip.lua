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


vim.keymap.set({ "i", "s"}, "<c-j>", function ()
   if ls.expand_or_jumpable() then
    ls.expand_or_jump()
   end
end, {silent = true})

vim.keymap.set({ "i", "s"}, "<c-k>", function ()
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

local get_filename = function()
    return vim.fn.fnamemodify(vim.fn.expand('%'),':t')
end

local get_class_name = function()
    local file_name = get_filename()
    return string.gsub(file_name, '.php', '')
end

local get_namespace = function()
    -- local path = vim.fn.expand("%:p") -- absolute path
    local path = vim.fn.expand("%") -- get relative path

    local cwd = vim.fn.getcwd()

    -- captilize first letter in path
    local first_letter = string.sub(path, 1, 1)
    local rest_of_path = string.sub(path, 2)
    path = string.upper(first_letter) .. rest_of_path

    path = string.gsub(path, cwd, "") -- sometimes the path is absolute so we need to make it relative
    path = string.gsub(path, "/", "\\")
    path = string.gsub(path, get_filename(), "") -- remove filename from namespace
    path = string.sub(path, 1, -2) -- remove the last \ at end of line

    return path
end

ls.add_snippets("php", {
    s("!!php", {
        t({
            "<?php",
            "",
            "declare(strict_types=1);",
            "",
            "",
        }),
        i(0),
    }),

    s("!!class", {
        t({
            "<?php",
            "",
            "declare(strict_types=1);",
            "",
            "namespace ",
        }),
        f(get_namespace, {}),
        t({
            ";",
            "",
            "class ",
        }),
        f(get_class_name, {}),
        t({"", "{", ""}),
        t("    "),
        i(0),
        t({"", "}"}),
    }),

    s("!!interface", {
        t({
            "<?php",
            "",
            "declare(strict_types=1);",
            "",
            "namespace ",
        }),
        f(get_namespace, {}),
        t({
            ";",
            "",
            "interface ",
        }),
        f(get_class_name, {}),
        t({"", "{", ""}),
        t("    "),
        i(0),
        t({"", "}"}),
    }),

    s("!!test", {
        t({
            "<?php",
            "",
            "declare(strict_types=1);",
            "",
            "namespace ",
        }),
        f(get_namespace, {}),
        t({
            ";",
            "",
            "use PHPUnit\\Framework\\TestCase;",
            "",
            "class ",
        }),
        f(get_class_name, {}),
        t({" extends TestCase", "{", ""}),
        t({
            "    public function testItWorks(): void",
            "    {"
        }),
        t({
            "",
            "        $this->assertTrue(true);"
        }),
        i(0),
        t({
            "",
            "    }",
            "}"
        }),
    }),

    s("!!laratest", {
        t({
            "<?php",
            "",
            "declare(strict_types=1);",
            "",
            "namespace ",
        }),
        f(get_namespace, {}),
        t({
            ";",
            "",
            "use Tests\\TestCase;",
            "use Illuminate\\Foundation\\Testing\\RefreshDatabase;",
            "",
            "class ",
        }),
        f(get_class_name, {}),
        t({" extends TestCase", "{", ""}),
        t({"    use RefreshDatabase;", "", ""}),
        t({
            "    public function testItWorks(): void",
            "    {"
        }),
        t({
            "",
            "        $this->assertTrue(true);"
        }),
        i(0),
        t({
            "",
            "    }",
            "}"
        }),
    }),

    s("pubf", {
        t("public function "), i(1, "name"), t("("), i(2, "args"), t("): "), i(3, "void"), t(""),
        t("{"),
        t("    "), i(0),
        t({"", "}"}),
    }),
    s("yield", {
        t("yield ["), i(0), t("];"),
    }),

    -- create data provider doc block data provider method
    s("dataprovider", {
        t({"/**"}),
        t("* @dataProvider "), i(1, "name"),
        t("*/"),
    }),
})

