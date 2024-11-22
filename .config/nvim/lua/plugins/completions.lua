return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Print debug information
      print("Configuring Copilot...")

      -- Enable Copilot for all filetypes
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }

      -- Enable inline suggestions
      vim.g.copilot_enabled = true

      -- Configure Tab behavior
      vim.g.copilot_no_tab_map = false -- Allow tab mapping
      vim.g.copilot_assume_mapped = false
      vim.g.copilot_tab_fallback = "" -- Empty string means no fallback

      -- Show the inline suggestions automatically
      vim.g.copilot_autocomplete = 1

      -- Configure suggestion behavior
      vim.g.copilot_node_command = "node"
      vim.g.copilot_autostart = 1

      -- Set suggestion display preferences
      vim.g.copilot_suggestion_enabled = true
      vim.g.copilot_suggestion_auto_trigger = true
      vim.g.copilot_suggestion_delay = 100

      -- Key mappings for additional suggestion control
      vim.api.nvim_set_keymap("i", "<C-]>", "copilot#Next()", { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-[>", "copilot#Previous()", { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-c>", "copilot#Dismiss()", { silent = true, expr = true })

      -- Enable inline suggestions with ghost text
      vim.g.copilot_suggestion_hidden = false

      -- Set the suggestion highlight color (adjust colors to match your theme)
      vim.cmd([[
        highlight CopilotSuggestion guifg=#555555 ctermfg=8
      ]])

      -- Key mapping for Copilot Chat
      vim.api.nvim_set_keymap("n", "<leader>cp", ":CopilotChat<CR>", { noremap = true, silent = true })

      -- Enable Copilot on startup
      vim.cmd("Copilot enable")

      -- Print status after configuration
      vim.defer_fn(function()
        vim.cmd("Copilot status")
      end, 1000)
    end,
  },
}
