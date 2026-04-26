local M = {}

local default_config = {
  scrolloff_fraction = 0.25,
  scrolloff_absolute_filetypes = { "qf" },
  scrolloff_absolute_value = 0,
}

local config = {}

local function set_scrolloff()
  if vim.tbl_contains(config.scrolloff_absolute_filetypes, vim.bo.filetype) then
    vim.wo.scrolloff = config.scrolloff_absolute_value
  else
    vim.wo.scrolloff = math.floor(vim.api.nvim_win_get_height(0) * config.scrolloff_fraction)
  end
end

function M.setup(user_config)
  config = vim.tbl_extend("force", default_config, user_config or {})

  vim.api.nvim_create_augroup("ScrolloffFraction", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "WinNew", "VimResized" }, {
    group = "ScrolloffFraction",
    callback = set_scrolloff,
  })
end

return M
