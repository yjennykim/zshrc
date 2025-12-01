return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", function()
        require("telescope.builtin").find_files({
          previewer = true, -- enable preview window
          hidden = true, -- show hidden files (optional)
        })
      end)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- live grep
      vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
