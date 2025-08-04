local M = {}
-- Function that is called on the <Esc> key press
function M.OnEscape()
  -- Close the floating windows
  local floating_wins = vim.api.nvim_list_wins()
  for _, win in ipairs(floating_wins) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then -- Checks if the window is a floating window
      vim.api.nvim_win_close(win, false)
      return -- Close the first floating window found and exit
    end
  end
  -- Remove search
  vim.api.nvim_command "noh"
end

M.ReloadConfig = function()
  -- Clear the Lua cache
  for name, _ in pairs(package.loaded) do
    if name:match "^custom" or name:match "^core" then
      package.loaded[name] = nil
    end
  end

  -- Reload chadrc and other configurations
  dofile(vim.env.MYVIMRC) -- This points to your main `init.lua` or `init.vim`

  -- require("vscode").load()
  require("base46").compile()
  require("base46").load_all_highlights() -- compiles+loads them
  print "Configuration reloaded!"
end

M.DeleteQfItem = function()
  local items = vim.fn.getqflist()
  local line = vim.fn.line "."
  table.remove(items, line)
  vim.fn.setqflist(items, "r")
  vim.api.nvim_win_set_cursor(0, { line, 0 })
end

local GetIsHarpoonOpen = function()
  -- Check if Harpoon's UI is open
  -- Harpoon's quick menu usually creates a floating window.
  -- We can check if such a window, identifiable by its filetype or buffer name, exists and is visible.
  -- A common filetype for Harpoon's UI is 'harpoon'.
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    -- You might need to adjust 'harpoon' if your Harpoon UI uses a different filetype
    -- or check for a specific buffer name if that's more reliable.
    if ft == "harpoon" and vim.api.nvim_win_is_valid(win) then
      -- Additionally, check if the window is a floating window,
      -- as Harpoon's quick menu is typically a float.
      local win_config = vim.api.nvim_win_get_config(win)
      if win_config.relative ~= "" then -- Floating windows have a 'relative' setting
        return true
      end
    end
  end
  return false
end

local GetIsQfListOpen = function()
  local current_win_id = vim.api.nvim_get_current_win()

  -- Iterate through all window information to find the quickfix window
  local qf_wininfo = vim.iter(vim.fn.getwininfo()):find(function(wininf)
    return wininf.quickfix == 1
  end)

  if qf_wininfo then
    -- Check if the found quickfix window is the currently focused window
    if qf_wininfo.winid == current_win_id then
      return true
    end
  end

  return false
end

M.HandleCtrlP = function()
  local harpoon_ui_open = GetIsHarpoonOpen()
  local qf_window_active = GetIsQfListOpen()

  -- If Harpoon UI or quickfix list is open, act like 'k' instaed
  if harpoon_ui_open or qf_window_active then
    vim.cmd [[normal! k]]
  else
    vim.cmd "Telescope find_files"
  end
end

return M
