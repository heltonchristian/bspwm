PROMPT='%F{#888888}%1~%f %F{White}%f  '

##########################
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

---------------- ALIAS ----------------
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias rm='rm -r'
alias cp='cp -r'
alias vi='vim'
alias fetch='clear && neofetch'
alias kc='vim ~/.config/kitty/kitty.conf'
alias zshrc='vim ~/.zshrc'

---------------- BSPWM ---------------- 
alias bspwmrc='vim .config/bspwm/bspwmrc'
alias sxhkdrc='vim .config/sxhkd/sxhkdrc'
alias pc='vim ~/.config/picom/picom.conf'
alias off='redshift -x && clear'
alias wr='~/scripts/changewp.sh'
alias audio='~/scripts/changeAudio.shy'
alias nl='redshift -O 5000 && clear'
alias polybarc='sudo vim ~/.config/polybar/config.ini'
alias rofi='sudo vim ~/.config/rofi/config.rasi'
alias hexit='pkill -KILL -u $USER'

---------------- VOID ---------------- 
alias pacman -S ='sudo xbps-install -S'
alias pacman -Rns ='sudo xbps-remove -R'
alias pacman -Syyu ='sudo xbps-install -Su'
alias pacman -L ='xbps-query -Rs'
