-- This file configures every thing to do with AI
-- All plugins have to be defined depending on availability as it can differ based on my machine

-- Github copilot, this the LLM used

-- CodeCompanion is the UI integration into neovim
--

local ok, cc = pcall(require, 'codecompanion')
if ok then
  cc.setup({
    -- your configuration comes here
    strategies = {
      chat = {
        keymaps = {
          close = {
            modes = { 
              n = "<C-x>",
              i = "<C-x>" 
            },
          },
          send = {
            modes = { 
              n = "<C-y>",
              i = "<C-y>" 
            },
          },
        }
      }
    },

    extensions = {
      -- Provides MCP (Model Context Protocol) integration for CodeCompanion
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          -- MCP Tools 
          make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
          show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
          add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
          show_result_in_chat = true,      -- Show tool results directly in chat buffer
          format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
          -- MCP Resources
          make_vars = true,                -- Convert MCP resources to #variables for prompts
          -- MCP Prompts 
          make_slash_commands = true,      -- Add MCP prompts as /slash commands
        }
      }
    }
  })
end
