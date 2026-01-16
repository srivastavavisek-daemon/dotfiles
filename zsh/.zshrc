# ░░░███████╗░██████╗██╗░░██╗██████╗░░█████╗░
# ░░░╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
# ░░░░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
# ░░░██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
# ██╗███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
# ╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░
# srivastavavisek

. ~/.zsh_aliases

# SHELL OPTIONS
setopt autocd
setopt auto_param_slash  # when complete dir is written the adds slash instead of space
setopt extended_glob notify
setopt no_case_glob no_case_match globdots

setopt interactive_comments  # allows # comments in command line
unsetopt prompt_sp  
# prevents zsh from adding a % when programs don't end output witha newline


# █████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗
# ╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝
# HISTORY
HISTFILE="$XDG_CACHE_HOME/zsh_histfile"
#HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000

# setopt HIST_IGNORE_ALL_DUPS  # keeps only the latest instance of any command
setopt HIST_EXPIRE_DUPS_FIRST # Delete duplicates first when hist size is reached
setopt HIST_IGNORE_DUPS  # ignores a command if it's the exact same as the previous one

setopt SHARE_HISTORY      # Share history between sessions
setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY
# append_history: Adds to history file instead of overwriting
# inc_append_historyWrites to history immediately after each command 

setopt HIST_IGNORE_SPACE
# for aliases better to focus on HIST_IGNORE_SPACE and prefix a space

setopt EXTENDED_HISTORY
#export HIST_STAMPS="yyyy-mm-dd HH:MM"
# Zsh stores time, not format. You format on display. Use history -i

setopt HIST_REDUCE_BLANKS  # Remove extra blanks from history

# █████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗
# ╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝
# BINDKEYS
#
#bindkey -v
#bindkey -e  # force emacs mode everywhere

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^d" kill-line  # Delete from cursor to end-of-line
bindkey "^s" backward-kill-line
bindkey "^b" backward-word
bindkey "^w" forward-word
bindkey "^h" backward-kill-word
bindkey "^k" history-search-backward
bindkey "^j" history-search-forward

bindkey "^r" fzf-history-widget


# AUTO-COMPLETION
#
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
#compinit -d ~/.cache/zsh/compdump

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes false

setopt AUTO_MENU  # After one tab, show completion menu
#setopt MENU_COMPLETE  # Immediately insert first match and cycle through with tab
# MENU_COMPLETE can be jarring because it auto-inserts

# fzf history widget
source <(fzf --zsh)


# █████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗
# ╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝

# # BOOTSTRAPING nvm
#export NVM_DIR="$HOME/.config/nvm"
# # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 
# # lazy-loading version
#nvm() {
#    unset -f nvm  # to prevent infinite recursion
#    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#    nvm "$@"
#}

# █████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗
# ╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝
# FASTFETCH
FASTFETCH="/tmp/fastfetch_shown"
if [[ ! -f "$FASTFETCH" && "$TERM" == "alacritty" ]]; then
    fastfetch
    touch "$FASTFETCH"
fi


# PROMPT SETUP
NEWLINE=$'\n'
if [[ "$TERM" == "linux" ]]; then
    PROMPT="%m@%n: %~ %# "
else
    #PROMPT="${NEWLINE}%K{#4c566a} %c %k%f %(?.%F{#88C0D0}.%F{#BF616A})❯%f "
    #print -P "%K{#3b4252}%F{#ECEFF4} %m %k%f%K{#4c566a}%F{#D8DEE9} %n %k%f %F{#5E81AC}▲%f %F{#D8DEE9}$(uptime -p | cut -c 4-)%f"
    print -P "${NEWLINE}%K{#6c757d} %k%K{#495057} %k%K{#3b4252}%F{#ECEFF4}  %m %k%f%K{#8fbcbb}%F{#3b4252}%k%f%K{#8fbcbb}%F{#0B0014} %n %k%f%F{#8fbcbb}%K{#899D78}%f%k%K{#899D78}%F{#3b4252} ▲ %f%F{#0B0014}$(uptime -p | cut -c 4-) %f%k%F{#899D78}%K{#3b4252}%f%k%F{#3b4252}%K{#8fbcbb}%f%k%F{#8fbcbb}%f"
    #print -P "▓▒░%K{#3b4252}%F{#ECEFF4}  %m %k%f%K{#8fbcbb}%F{#3b4252}%k%f%K{#8fbcbb}%F{#0B0014} %n %k%f%F{#8fbcbb}%K{#899D78} %f%k%K{#899D78}%F{#3b4252} ▲ %f%F{#0B0014}$(uptime -p | cut -c 4-) %f%k%F{#899D78}%K{#3b4252} %f%k%F{#3b4252}%K{#8fbcbb} %f%k%F{#8fbcbb} %f"
    eval "$(starship init zsh)"
fi