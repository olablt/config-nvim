# config-nvim

```
cd ~/.config/nvim/
nvim lua/olab/packer.lua
:so
:PackerInstall
```

```
:TSUpdate
```

Note: :TSUpdate will cause Packer to fail upon the first installation. It will run correctly when updating. To avoid this, call nvim-treesitter.install.update() directly.

```
:checkhealth
```

LSP, install packages with `i`, uninstall with `X`
```
:Mason
/gopls
```
