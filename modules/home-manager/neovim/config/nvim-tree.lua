require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort_by = "case_sensitive",
    actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
    },
    view = {
        width = 50,
        adaptive_size = false,
        -- mappings = {
        --     list = {
        --         { key = "u", action = "dir_up" },
        --     },
        -- },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})
vim.keymap.set('n', '<space>e', require('nvim-tree.api').tree.toggle, {})

