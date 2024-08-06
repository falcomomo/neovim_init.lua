## Falcomomo's init.lua

Heavily based on the config by [ema2159](https://github.com/ema2159/nvimconfig).

### Plugin summary

* Plugin management by [lazy](https://github.com/folke/lazy.nvim)
* LSP configured by [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)
* LSP saga enhanced ui [lsp saga](https://github.com/nvimdev/lspsaga.nvim)
* NVIM dap ui [nvim dap ui](https://github.com/rcarriga/nvim-dap-ui)
* Telescope with ivy style searching [telescope](https://github.com/nvim-telescope/telescope.nvim)
* Notify and messages etc with noice [noice](https://github.com/folke/noice.nvim)

### How it works

init.lua loads up lazy. 

Set up the basic options in the core folder with options and keymaps.

Lazy configures everything.
In the plugins folder the init just asks lazy to load everything each of the 
editor, themes, tools, and ui files. Each of those files is just the initial 
configuration for lazy to load packages. The lazy configurations reference
specific config within the config subfolders if the package requires anything.

## Keybinds

### Editor

#### nvim-surround

| Old text                    | Command    | New text                |
| --------------------------- | ---------- | ----------------------- |
| surr\*ound_words            | ysiw)      | (surround_words)        |
| \*make strings              | ys$"       | "make strings"          |
| [delete ar*ound me!]        | ds]        | delete around me!       |
| remove \<b>HTML t\*ags\</b> | dst        | remove HTML tags        |
| \'change quot\*es\'         | cs'"       | "change quotes"         |
| \<b>or tag* types\</b>      | csth1\<CR> | \<h1>or tag types\</h1> |
| delete(functi\*on calls)    | dsf        | function calls          |

### Tools

#### Telescope

| Keybind      | Description                   |
| ------------ | ----------------------------- |
| \<leader\>pf | Find files                    |
| \<leader\>pp | Project                       |
| \<leader\>ff | File browse                   |
| \<leader\>fr | Recent files                  |
| \<leader\>fb | Buffers                       |
| \<leader\>fy | Yank history                  |
| \<leader\>ps | Grep string                   |
| \<leader\>hh | Help tags                     |
| \<leader\>hk | Keymaps                       |
| \<leader\>hm | Man pages                     |
| \/           | Current buffer fuzzy find     |
| \*           | Fuzzy find under cursor       |
| \<M-x\>      | Commands                      |
| \<C-S-p\>    | Git files                     |
| \<C-t\>      | Open in Trouble quickfix list |

#### Harpoon

| Keybind               | Description       |
| --------------------- | ----------------- |
| \<leader\>\<leader\>g | Add               |
| \<leader\>\<leader\>f | Toggle quick menu |
| \<leader\>\<leader\>j | Select 1st        |
| \<leader\>\<leader\>k | Select 2nd        |
| \<leader\>\<leader\>l | Select 3rd        |
| \<leader\>\<leader\>; | Select 4th        |

#### LSP

| Package                        | Keybind       | Description                      |
| ------------------------------ | ------------- | -------------------------------- |
| Omnisharp Extended / Telescope | gd            | Telescope LSP definitions        |
| Omnisharp Extended / Telescope | gI            | Telescope LSP implementation     |
| Omnisharp Extended / Telescope | gr            | Telescope LSP references         |
| LSP Saga                       | \<leader\>lD  | Peek type definition             |
| LSP Saga                       | \<leader\>K   | Hover doc                        |
| LSP Saga                       | \<leader\>lo  | LSP Saga outline                 |
| LSP Saga                       | \<leader\>lr  | LSP Saga rename in project       |
| LSP Saga                       | \<leader\>la  | LSP Saga code action             |
| LSP Saga                       | \<leader\>gh  | LSP Saga finder                  |
| VIM                            | K             | LSP buffer hover                 |
| VIM                            | \<leader\>vws | LSP buffer workspace symbol      |
| VIM                            | \<leader\>vd  | VIM diagnostic open float        |
| VIM                            | \[d           | VIM diagnostic goto next         |
| VIM                            | \]d           | VIM diagnostic goto prev         |
| VIM                            | \<leader\>vca | LSP buffer code action           |
| VIM                            | \<leader\>vrr | LSP buffer references            |
| VIM                            | \<leader\>vrn | LSP buffer rename                |
| VIM                            | \<C-h\>       | (insert mode) LSP signature help |
| Navbuddy                       | \<leader\>ln  | Navbuddy                         |
| Trouble                        | \<leader\>xl  | Trouble LSP toggle               |

#### Trouble

| Keybind      | Description                                         |
| ------------ | --------------------------------------------------- |
| \<leader\>xx | Trouble diagnostics toggle                          |
| \<leader\>xX | Trouble diagnostics in buffer                       |
| \<leader\>xs | Trouble symbols toggle                              |
| \<leader\>xL | Trouble loclist toggle                              |
| \<leader\>xQ | Trouble quickfix list toggle                        |
| \<leader\>xl | Trouble LSP toggle                                  |
| \<C-t\>      | (from Telescope) Open list in Trouble quickfix list |

#### Undo tree

| Keybind     | Description      |
| ----------- | ---------------- |
| \<leader\>u | Undo tree toggle |

#### Yanky

| Keybind | Description          |
| ------- | -------------------- |
| p       | Yanky put after      |
| P       | Yanky put before     |
| gp      | Yanky G put after    |
| gP      | Yanky G put before   |
| \<A-y\> | Yanky cycle forward  |
| \<A-Y\> | Yanky cycle backward |

### UI

#### Gitsigns

| Keybind      | Description       |
| ------------ | ----------------- |
| \]h          | Next hunk         |
| \[h          | Previous hunk     |
| \<leader\>ga | Stage hunk        |
| \<leader\>gr | Reset hunk        |
| \<leader\>gS | Stage buffer      |
| \<leader\>gu | Undo stage buffer |
| \<leader\>gR | Reset buffer      |
| \<leader\>gp | Preview hunk      |
| \<leader\>gb | Toggle line blame |
| \<leader\>gB | Blame line full   |

#### Legendary

| Keybind   | Description               |
| --------- | ------------------------- |
| \<C-S-;\> | Legendary command palette |
|           |                           |

#### Tree-sitter

Incremental selection

| Context  | Keybind     | Description                                       |
| -------- | ----------- | ------------------------------------------------- |
|          | \<C-space\> | Incremental selection                             |
| move     | ]f          | Go to next start of a function                    |
| move     | ]c          | Go to next start of a class                       |
| move     | ]F          | Go to next end of a function                      |
| move     | ]C          | Go to next end of a class                         |
| move     | [f          | Go to previous start of a function                |
| move     | [c          | Go to previous start of a class                   |
| move     | [F          | Go to previous end of a function                  |
| move     | [C          | Go to previous end of a class                     |
| select   | a=          | Select outer part of an assignment                |
| select   | i=          | Select inner part of an assignment                |
| select   | l=          | Select left hand side of an assignment            |
| select   | r=          | Select right hand side of an assignment           |
| select   | aa          | Select outer part of a parameter/argument         |
| select   | ia          | Select inner part of a parameter/argument         |
| select   | ai          | Select outer part of a conditional                |
| select   | ii          | Select inner part of a conditional                |
| select   | al          | Select outer part of a loop                       |
| select   | il          | Select inner part of a loop                       |
| select   | af          | Select outer part of a function call              |
| select   | if          | Select inner part of a function call              |
| select   | am          | Select outer part of a method/function definition |
| select   | im          | Select inner part of a method/function definition |
| select   | ac          | Select outer part of a class                      |
| select   | ic          | Select inner part of a class                      |
| swap     | <leader>na  | Swap parameters/argument with next                |
| swap     | <leader>nm  | Swap function with next                           |
| swap     | <leader>pa  | Swap parameters/argument with previous            |
| swap     | <leader>pm  | Swap function with previous                       |
| lsp      | <leader>gf  | Peek definition of a function                     |
| lsp      | <leader>gF  | Peek definition of a class                        |
