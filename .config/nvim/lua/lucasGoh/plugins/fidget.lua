require("fidget").setup({})
local autopairs_setup, fidget = pcall(require, "fidget")
if not autopairs_setup then
	return
end

fidget.setup()
