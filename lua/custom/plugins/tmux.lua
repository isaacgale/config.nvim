return{
  {"elijahdanko/ttymux.nvim",
    config = function()
      require("ttymux").setup({})
      vim.keymap.set("n", "<C-a>h", function() require("ttymux.window").navigate("h") end)
      vim.keymap.set("n", "<C-a>l", function() require("ttymux.window").navigate("l") end)
      vim.keymap.set("n", "<C-a>j", function() require("ttymux.window").navigate("j") end)
      vim.keymap.set("n", "<C-a>k", function() require("ttymux.window").navigate("k") end)
  end}
}
-- vim: ts=2 sts=2 sw=2 et
