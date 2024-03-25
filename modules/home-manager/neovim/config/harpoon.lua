local nav_file_1 = function()
  require('harpoon.ui').nav_file(1)
end
local nav_file_2 = function()
  require('harpoon.ui').nav_file(2)
end
local nav_file_3 = function()
  require('harpoon.ui').nav_file(3)
end
local nav_file_4 = function()
  require('harpoon.ui').nav_file(4)
end

vim.keymap.set('n', '<space>l', require('harpoon.ui').toggle_quick_menu, { desc = '' })
vim.keymap.set('n', '<space>a', require('harpoon.mark').add_file, { desc = '' })
vim.keymap.set('n', '<space>1', nav_file_1, { desc = '' })
vim.keymap.set('n', '<space>2', nav_file_2, { desc = '' })
vim.keymap.set('n', '<space>3', nav_file_3, { desc = '' })
vim.keymap.set('n', '<space>4', nav_file_4, { desc = '' })
vim.keymap.set('n', '<space>j', require('harpoon.ui').nav_next, { desc = '' })
vim.keymap.set('n', '<space>h', require('harpoon.ui').nav_prev, { desc = '' })
