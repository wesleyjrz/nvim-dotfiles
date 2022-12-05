local g = vim.g

g.nord_italic = false                   -- enable italic
g.nord_borders = true                   -- enable visible borders
g.nord_disable_background = true        -- disable theme's background colour
g.nord_enable_sidebar_background = true -- Re-enables the background of the sidebar if you disabled the background of everything

-- Load colorscheme
require("nord").set()
