local ok, ls = pcall(require, 'luasnip')
local utils  = require('dmitri.utils')
if not ok then
    return
end

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

local get_component_name = function()
    local file_name = get_filename()
    return string.gsub(file_name, '.jsx', '')
end

local guess_namespace_without_composer = function()
    local path = utils.get_relative_path()


    -- captilize first letter in path
    local first_letter_index = 1
    local first_letter = string.sub(path, first_letter_index, first_letter_index)

    if first_letter == "/" then
        first_letter_index = first_letter_index + 1
        first_letter = string.sub(path, first_letter_index, first_letter_index)
    end

    local rest_of_path = string.sub(path, first_letter_index + 1)
    path = string.upper(first_letter) .. rest_of_path
    debug.path_after_uppercase = path

    path = string.gsub(path, "/", "\\")
    debug.path_after_fix_slash = path
    path = string.gsub(path, get_filename(), "") -- remove filename from namespace
    debug.path_after_remove_filename = path
    path = string.sub(path, 1, -2) -- remove the last \ at end of line
    debug.path_after_remove_final_slash = path

    return path
end

local get_namespace = function()

    local root_path = utils.find_root_dir({"composer.json"})
    local file_path = utils.get_relative_path()

    if root_path ~= "." then
        file_path = string.gsub(file_path, root_path.."/", "")
    end

    local debug = {}
    debug.root_path = root_path
    debug.file_path = file_path

    local guessed_namespace = guess_namespace_without_composer()
    if root_path == nil then
        return guessed_namespace
    end

    -- search for composer.json

    -- get mapping for composer namespaces
    local composer_mapping_handle = io.popen("jq -r '.autoload.\"psr-4\" * .[\"autoload-dev\"].\"psr-4\" | to_entries | map([.key, .value | tostring]) | .[] | join(\",\")' ".. root_path  .. "/composer.json", "r")
    local mappings_raw = composer_mapping_handle:read("*a")
    local mappings = {}

    for line in string.gmatch(mappings_raw, "[^\r\n]+") do
        local namespace, composer_path = line:match("([^,]+),([^,]+)")

        if file_path:find(composer_path) then

            local last_char = string.sub(composer_path, #composer_path)
            if last_char == "/" then
                composer_path = string.sub(composer_path, 1, -2)
            end

            table.insert(mappings, {
                namespace = namespace,
                path = composer_path,
                match_length = #composer_path
            })
        end
    end
    debug.mappings = mappings

    local highest_match = nil
    local highest_match_length = 0

    for _, mapping in ipairs(mappings) do
        if mapping.match_length > highest_match_length then
            highest_match_length = mapping.match_length
            highest_match = mapping
        end
    end

    if highest_match == nil then
        return guessed_namespace
    end

    file_path = file_path:gsub(highest_match.path.."/", highest_match.namespace)
    file_path = string.gsub(file_path, "/", "\\")
    file_path = string.gsub(file_path, get_filename(), "") -- remove filename from namespace
    file_path = string.sub(file_path, 1, -2) -- remove the last \ at end of line

    return file_path
end


ls.add_snippets("all" , {
    s("pound", t("£")),
    s("euro", t("€")),
})

local debugobj = function()
    return s("debugobj", {
        t(
            "console.debug(JSON.parse(JSON.stringify("
        ),
        i(0),
        t(")));")
    })
end
ls.add_snippets("javascript", {
    -- debug javascript object
    debugobj()
});

ls.add_snippets("vue", {
    -- debug javascript object
    debugobj()
});

ls.add_snippets("mysql", {
    -- quickly query all foreign keys of table
    s('foreign', fmta([[ 
        select * from information_schema.TABLE_CONSTRAINTS
        where 1 = 1
        and information_schema.TABLE_CONSTRAINTS.CONSTRAINT_TYPE = 'FOREIGN KEY'
        and information_schema.TABLE_CONSTRAINTS.TABLE_SCHEMA = DATABASE()
        and information_schema.TABLE_CONSTRAINTS.TABLE_NAME = '<table_name>'
    ]], {
            table_name = i(0, 'table name')
    }
    ))
})

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

    s("!!trait", {
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
            "trait ",
        }),
        f(get_class_name, {}),
        t({"", "{", ""}),
        t("    "),
        i(0),
        t({"", "}"}),
    }),

    s("!!dto", {
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
            "use JsonSerializable;",
            "",
            "",
        }),
        t("class "), f(get_class_name, {}), t(" implements JsonSerializable"),
        t({
            "",
            "{    ",
            "    public function jsonSerialize(): mixed",
            "    {",
            "        return [",
            "",
        }),
        t("            "), i(0),
        t({
            "",
            "        ];",
            "    }",
        }),
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

    s("!!enum", {
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
            "enum ",
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
            "final class ",
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
            "final class ",
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
    t("public functions "), i(1, "name"), t("("), i(2, "args"), t("): "), i(3, "void"),
        t({"", "{", ""}),
        t("    "), i(0),
        t({"", "}"}),
    }),
    s("yield", {
        t("yield ["), i(0), t("];"),
    }),
    s("strict", {
        t("declare(strict_types=1);"),
    }),
    s("lararule", {
        t("function (string $attribute, mixed $value, Closure $fail) {"),
        t({"    ", "$fail(" .. '"' .. "The {$attribute} is invalid.".. '"'..");"}),
        t({"", "}"}),
    }),
})

ls.add_snippets("javascriptreact", {
    s("!!component", {
        t ("function "), f(get_component_name), t("() {"),
        t({"", ""}),
        t("  "), i(0),
        t ({"", "}", "", ""}),
        t ("export default "), f(get_component_name),
    }),
        -- t({
        --     "export default",
        --     "MyComponent",
        -- }),
})
