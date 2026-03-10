# Dev Tools

Personal dotfiles and dev environment configs.

## Files

### .vimrc

Vim configuration with plugins managed by [vim-plug](https://github.com/junegunn/vim-plug).

**Requirements:**
- [vim-plug](https://github.com/junegunn/vim-plug) — run `:PlugInstall` on first use
- [fzf](https://github.com/junegunn/fzf) — fuzzy finder (`brew install fzf`)

**Plugins included:**
- [onehalf](https://github.com/sonph/onehalf) — color scheme
- [emmet-vim](https://github.com/mattn/emmet-vim) — HTML/CSS expansion
- [NERDTree](https://github.com/preservim/nerdtree) — file explorer
- [fzf.vim](https://github.com/junegunn/fzf.vim) — fuzzy file search (`<leader>f`)
- [lightline](https://github.com/itchyny/lightline.vim) — status bar
- [vim-fugitive](https://github.com/tpope/vim-fugitive) — git integration
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter) — git diff in gutter
- [vim-mucomplete](https://github.com/lifepillar/vim-mucomplete) — lightweight autocompletion
- [vim-javascript](https://github.com/pangloss/vim-javascript) — JS syntax/indentation

### .zshrc

Zsh configuration using [Oh My Zsh](https://ohmyz.sh/).

**Requirements:**
- [Oh My Zsh](https://ohmyz.sh/)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — install to `$ZSH_CUSTOM/plugins/`
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) — expects clone at `~/dev/zsh-syntax-highlighting/`

**Optional (referenced in PATH):**
- [Homebrew](https://brew.sh/)
- [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
- [Android SDK](https://developer.android.com/studio) and OpenJDK 17 (for React Native)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### .tmux.conf.local

Customization file for [Oh My Tmux!](https://github.com/gpakosz/.tmux) (gpakosz/.tmux).

**Requirements:**
- [tmux](https://github.com/tmux/tmux) (`brew install tmux`)
- [Oh My Tmux!](https://github.com/gpakosz/.tmux) — clone to `~/.tmux` and symlink `.tmux.conf`

### wt-capslock-to-esc-rebind.ahk

AutoHotkey script to remap Caps Lock to Escape (Windows only).

**Requirements:**
- [AutoHotkey](https://www.autohotkey.com/)
