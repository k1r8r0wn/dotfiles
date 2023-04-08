-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine solarized theme

-- local lualine_solarized = os.execute("defaults read -g AppleInterfaceStyle") == 0 and
--   require("lualine.themes.solarized_dark") or
--   require("lualine.themes.solarized_light")

-- get lualine gruvbox theme

local lualine_gruvbox = require("lualine.themes.gruvbox")

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_gruvbox,
  }
})
