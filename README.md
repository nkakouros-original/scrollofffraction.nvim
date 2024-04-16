# scrollofffraction.nvim

This is Neovim port of https://github.com/drzel/vim-scrolloff-fraction. The
Vimscript code was ported to lua and this README was created all with ChatGPT.

scrollofffraction.nvim is a Neovim plugin written in Lua that dynamically sets the
`scrolloff` option based on the current window height and specific file types.
This plugin enhances the editing experience by maintaining a customizable
number of lines above and below the cursor, providing a more comfortable visual
context.

## Installation

To install scrollofffraction.nvim, use your favorite Neovim plugin manager. 

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  'nkakouros-original/scrollofffraction.nvim',
  lazy = true
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'nkakouros-original/scrollofffraction.nvim',
  config = function()
    require('scrollofffraction.nvim').setup()
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'nkakouros-original/scrollofffraction.nvim'
lua << EOF
require('scrollofffraction.nvim').setup()
EOF
```

After adding the plugin, run `:PlugInstall` in Neovim.

## Usage

To configure the plugin, add a call to `setup` in your Neovim configuration:

```lua
require('scrollofffraction.nvim').setup({
  -- Configuration options
})
```
or with lazy

```lua
{
  'nkakouros-original/scrollofffraction.nvim',
  lazy = true,
  opts = {
    -- Configuration options
  }
}
```

## Configuration

The plugin can be configured by passing a table to the `setup` function. The available options are:

- `scrolloff_fraction`: Decimal fraction of the window height to keep above and below the cursor (default `0.25`).
- `scrolloff_absolute_filetypes`: List of filetypes where an absolute `scrolloff` value is used instead of a fraction (default `{ 'qf' }`).
- `scrolloff_absolute_value`: Absolute number of lines to keep above and below the cursor for specified filetypes (default `0`).

Example configuration:

```lua
require('scrollofffraction.nvim').setup({
  scrolloff_fraction = 0.3,
  scrolloff_absolute_filetypes = { 'qf', 'markdown' },
  scrolloff_absolute_value = 5
})
```
