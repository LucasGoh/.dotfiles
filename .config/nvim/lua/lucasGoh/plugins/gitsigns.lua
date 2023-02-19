-- return {
-- 	{ "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side
-- 	-- opts = function()
-- 	-- 	return {
-- 	-- 		-- [add your custom lualine config here]
-- 	-- 	}
-- 	-- end,
-- }
-- -- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	return
end

-- configure/enable gitsigns
gitsigns.setup()

require("cmp").config.formatting = {
	format = require("tailwindcss-colorizer-cmp").formatter,
}
