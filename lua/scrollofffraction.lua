local M = {}

-- Default configuration
local default_config = {
    scrolloff_fraction = 0.25,
    scrolloff_absolute_filetypes = { 'qf' },
    scrolloff_absolute_value = 0
}

local config = {}

-- Function to adjust scrolloff based on fraction
local function ScrollOffFraction()
  if vim.tbl_contains(config.scrolloff_absolute_filetypes, vim.bo.filetype) then
    vim.wo.scrolloff = config.scrolloff_absolute_value
  else
    local visible_lines_in_active_window = vim.api.nvim_win_get_height(0)
    vim.wo.scrolloff = math.floor(visible_lines_in_active_window * config.scrolloff_fraction)
  end
end

-- Setup function
function M.setup(user_config)
    config = vim.tbl_extend("force", default_config, user_config or {})

    -- Autocommands to adjust scrolloff
    vim.api.nvim_create_augroup('ScrolloffFraction', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'WinNew', 'VimResized' }, {
        group = 'ScrolloffFraction',
        pattern = '*',
        callback = ScrollOffFraction,
    })
end

return M

