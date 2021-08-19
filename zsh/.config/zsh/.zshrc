# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# Stop highlighting paste
zle_highlight+=(paste:none)

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use nvim as manpager
export MANPAGER="nvim -c 'set ft=man' -"

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^a' 'bc -lq\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# zsh-autosuggestion plugin
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-autosuggestion accept suggestion by c-space
bindkey '^ ' autosuggest-accept

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#alias
alias ls="exa --long --all --icons"
alias c="curl 'https://corona-stats.online/Bangladesh'"
alias w='curl wttr.in/Dhaka'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias twitch='twitch-curses'
alias rss='vim .config/newsboat/urls'
alias mf='xinput set-prop 10 352 -0.8'
alias cfzsh='vim .config/zsh/.zshrc'
alias cflf='vim .config/lf/lfrc'
alias cfdwm='vim ~/.local/src/dwm-sam/config.h'
alias cfnv='vim .config/nvim/init.vim'
alias smi='sudo make install'
alias mkdwm='cd ~/.local/src/dwm-sam && smi && cd'
alias up='yay -Syyu'
alias pg='ping -O 8.8.8.8'
alias pgg='gping 8.8.8.8'
alias tp='xinput set-prop 12 207'
alias monf='xrandr --output eDP-1-1 --primary --mode 1920x1080 --output HDMI-1-1 --mode 1366x768 --right-of eDP-1-1'
alias gp='git push'
alias qs='quickserve ~/windows/E/Movies'
alias nf='fastfetch'
alias ps="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias lf="lfrun"

#Functions
ys() {
	yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro  yay -S
}

# fzf stuff
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Starship prompt
eval "$(starship init zsh)"

#Art
# clear
randomcolorscript="$(shuf -n 1 -i 0-1)"
if [[ "$randomcolorscript" == 0 ]]; then
    colorscript -r
else
    pokemon-colorscripts -r
fi

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
