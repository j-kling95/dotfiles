return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"pyright",
					"cssls",
					"jsonls",
          "bashls",
          "html",
          "hyprls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = vim.lsp.config["lspconfig"]

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("cssls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("html")
      vim.lsp.enable("hyprls")


			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
