this config started as a [kickstart](https://github.com/nvim-lua/kickstart.nvim), so following the readme there to start is a good idea

## TODOs
[ ] trouble
    can this show errors in all project files?
[ ] formatter/linter
[ ] debugger
[?] harpoon
[x] completion
[x] lsp
[x] treesitter
[x] telescope
[x] git plugin
[x] colorschemes
[x] file tree
[x] greeter
[x] keymap-hints
[x] lualine
[x] small configs

## MacOS setup
- brew install `fd`, `ripgrep` for treesitter
- follow instructions in `/lsp/*.lua` to install language servers
- install the repo files to `~/.config/nvim/*`.
- run nvim
- `:NightfoxCompile` on first install

## LSP troubleshooting
In the header for `lua/lsp.lua`, there is a link to a repo of community LSP configs. If a LSP isn't working, check to see if there is an updated config there. LSP configs go in `lsp` directory.

## CSharp LSP (roslyn)
- download the LSP from [azure devops](https://dev.azure.com/azure-public/vside/_artifacts/feed/vs-impl)
- find `Microsoft.CodeAnalysis.LanguageServer.<your-architecture>`
- then click download
- rename this to .zip
- extract `<zip root>/content/LanguageServer/<yourArch>/*` to a folder of your choice
    - run `Microsoft.CodeAnalysis.LanguageServer --version` in the folder to test
    - you may have to `chmod 755 Microsoft.CodeAnalysis.LanguageServer`
    - you may add this folder to your PATH. if so, skip the next step
- update the cmd in roslyn_ls.lua to point to the `Microsoft.CodeAnalysis.LanguageServer` binary in that folder

