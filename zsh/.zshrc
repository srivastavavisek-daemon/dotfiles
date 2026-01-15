# SOURCING
#
. ~/.zsh_aliases


# SHELL OPTIONS
#
setopt autocd
setopt auto_param_slash  # when complete dir is written the adds slash instead of space
setopt extended_glob notify
setopt no_case_glob no_case_match globdots

setopt interactive_comments  # allows # comments in command line
unsetopt prompt_sp  
# prevents zsh from adding a % when programs don't end output witha newline


# HISTORY
#
HISTFILE="$XDG_CACHE_HOME/zsh_histfile"
#HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt append_history inc_append_history  
# append_history: Adds to history file instead of overwriting
# inc_append_historyWrites to history immediately after each command 

setopt SHARE_HISTORY      # Share history between sessions
setopt hist_reduce_blanks    # Remove extra blanks from history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
# for aliases better to focus on HIST_IGNORE_SPACE and prefix a space
setopt EXTENDED_HISTORY

setopt auto_menu  # After one tab, show completion menu
#setopt menu_complete  # Immediately insert first match and cycle through with tab
# menu_complete can be jarring because it auto-inserts

export HISTTIMEFORMAT="%T: "


# BINDKEYS
#
#bindkey -v
#bindkey -e  # force emacs mode everywhere

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^w" kill-line  # Delete from cursor to end-of-line
bindkey "^b" backward-kill-line
#bindkey "" backward-word
#bindkey "" forward-word
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

# fzf history widget
source <(fzf --zsh)


# FASTFETCH
FASTFETCH="/tmp/fastfetch_shown"
if [[ ! -f "$FASTFETCH" && "$TERM" == "alacritty" ]]; then
    fastfetch
    touch "$FASTFETCH"
fi


# PROMPT SETUP
NEWLINE=$'\n'
#PROMPT="${NEWLINE}%K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ "

#PROMPT="${NEWLINE}%K{#2E3440}%F{#88C0D0} %D{%I:%M%P} %k%f%K{#3B4252}%F{#ECEFF4} %n %k%f%K{#4C566A}%F{#D8DEE9} %~ %k%f
#%F{#88C0D0}❯%f "

#PROMPT="${NEWLINE}%K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %c %k%f %(?.%F{#88C0D0}.%F{#BF616A})❯%f "

#if [[ "$TERM" == "linux" ]]; then
#    PROMPT="%m@%n: %~ %# "
#else
#    PROMPT="${NEWLINE}%K{#4c566a} %c %k%f %(?.%F{#88C0D0}.%F{#BF616A})❯%f "
#    #echo -e "${NEWLINE}\033[48;2;46;52;64;38;2;216;222;233m $0 \033[0m\033[48;2;59;66;82;38;2;216;222;233m $(uptime -p | cut -c 4-) \033[0m\033[48;2;76;86;106;38;2;216;222;233m $(uname -r) \033[0m" # nord theme
#    print -P "%K{#3b4252}%F{#ECEFF4} %m %k%f%K{#4c566a}%F{#D8DEE9} %n %k%f %F{#5E81AC}▲%f %F{#D8DEE9}$(uptime -p | cut -c 4-)%f"
#fi


# BOOTSTRAPING nvm
export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 
# lazy-loading version
nvm() {
    unset -f nvm  # to prevent infinite recursion
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm "$@"
}


if [[ "$TERM" == "linux" ]]; then
    PROMPT="%m@%n: %~ %# "
else
    #PROMPT="${NEWLINE}%K{#4c566a} %c %k%f %(?.%F{#88C0D0}.%F{#BF616A})❯%f "
    #print -P "%K{#3b4252}%F{#ECEFF4} %m %k%f%K{#4c566a}%F{#D8DEE9} %n %k%f %F{#5E81AC}▲%f %F{#D8DEE9}$(uptime -p | cut -c 4-)%f"
    print -P "▓▒░%K{#3b4252}%F{#ECEFF4}  %m %k%f%K{#8fbcbb}%F{#3b4252}%k%f%K{#8fbcbb}%F{#0B0014} %n %k%f%F{#8fbcbb}%K{#899D78}%f%k%K{#899D78}%F{#3b4252} ▲ %f%F{#0B0014}$(uptime -p | cut -c 4-) %f%k%F{#899D78}%K{#3b4252}%f%k%F{#3b4252}%K{#8fbcbb}%f%k%F{#8fbcbb}%f"
    eval "$(starship init zsh)"
fi
