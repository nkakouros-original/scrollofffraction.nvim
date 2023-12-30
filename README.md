# scrollofffraction

This is Noevim port of https://github.com/drzel/vim-scrolloff-fraction. The
Vimscript code was ported to lua and this README was created all with ChatGPT.

scrollofffraction is a Neovim plugin written in Lua that dynamically sets the
`scrolloff` option based on the current window height and specific file types.
This plugin enhances the editing experience by maintaining a customizable
number of lines above and below the cursor, providing a more comfortable visual
context.

## Installation

To install scrollofffraction, use your favorite Neovim plugin manager. 

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'nkakouros-original/scrollofffraction',
  config = function()
    require('scrollofffraction').setup()
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'nkakouros-original/scrollofffraction'
lua << EOF
require('scrollofffraction').setup()
EOF
```

After adding the plugin, run `:PlugInstall` in Neovim.

## Usage

To configure the plugin, add a call to `setup` in your Neovim configuration:

```lua
require('scrollofffraction').setup({
  -- Configuration options
})
```

## Configuration

The plugin can be configured by passing a table to the `setup` function. The available options are:

- `scrolloff_fraction`: Decimal fraction of the window height to keep above and below the cursor (default `0.25`).
- `scrolloff_absolute_filetypes`: List of filetypes where an absolute `scrolloff` value is used instead of a fraction (default `{ 'qf' }`).
- `scrolloff_absolute_value`: Absolute number of lines to keep above and below the cursor for specified filetypes (default `0`).

Example configuration:

```lua
require('scrollofffraction').setup({
  scrolloff_fraction = 0.3,
  scrolloff_absolute_filetypes = { 'qf', 'markdown' },
  scrolloff_absolute_value = 5
})
```
