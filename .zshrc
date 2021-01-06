### Added by Zinit's installer (Keep if you want to use Zinit)
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

### Plugins
zinit light willghatch/zsh-saneopt
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
### /Plugins

### Custom Config
# PATH
PATH=$PATH:~/.local/bin
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Starship prompt
eval "$(starship init zsh)"

# Turn off all beeps
unsetopt BEEP
setopt auto_pushd

#Fix keys not working
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
# Use NVIM as default editor
export EDITOR=nvim

# Misc
export HIGHLIGHT_STYLE=molokai

# Aliases
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias vlc='vlc -I dummy'
alias pac='sudo pacman -S'
alias ll='ls -al --color=always'
alias ls='colorls'
alias dc='docker-compose'
alias vim='nvim'
alias vimdiff='nvim -d'
alias ag='ag --ignore-dir node_modules --ignore-dir .git --ignore-dir _build'
