# scrollofffraction.nvim

Dynamically sets `scrolloff` based on window height, keeping a proportional
number of context lines visible above and below the cursor regardless of
window size.

A Neovim port of [vim-scrolloff-fraction](https://github.com/drzel/vim-scrolloff-fraction).

## Requirements

Neovim 0.8+

## Installation

The plugin auto-initialises with defaults via its `plugin/` entry point. If
you want to customise options, pass them through your plugin manager's config
or call `setup()` explicitly.

**[lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
{
  "nkakouros-original/scrollofffraction.nvim",
  opts = {},
}
```

**[packer.nvim](https://github.com/wbthomason/packer.nvim)**

```lua
use {
  "nkakouros-original/scrollofffraction.nvim",
  config = function()
    require("scrollofffraction").setup()
  end,
}
```

## Configuration

Shown below are the defaults:

```lua
require("scrollofffraction").setup({
  -- Fraction of window height to keep above/below cursor
  scrolloff_fraction = 0.25,
  -- Filetypes that use a fixed scrolloff instead of the fraction
  scrolloff_absolute_filetypes = { "qf" },
  -- Fixed scrolloff value for the filetypes above
  scrolloff_absolute_value = 0,
})
```

## Events

scrolloff is recalculated on `BufEnter`, `WinEnter`, `WinNew`, and
`VimResized`.

## Contributing

Install [stylua](https://github.com/JohnnyMorganz/StyLua) and format before
submitting a PR:

```sh
stylua lua/
```

The CI workflow checks formatting on every push and pull request.
