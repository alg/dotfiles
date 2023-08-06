-- local colorscheme = "darkplus"
local colorscheme = "catppuccin"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify("Color scheme '" .. colorscheme .. "' not found!")
    return
end
