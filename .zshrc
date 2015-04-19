# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump tmux web-search vi-mode git)

source $ZSH/oh-my-zsh.sh
# source $ZSH_CUSTOM/incr.zsh

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/lib/google-golang/bin:/usr/local/buildtools/java/jdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/google/data/ro/projects/monarch:/google/data/ro/projects/monarch"
export PATH="/usr/local/buildtools/java/jdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# PROMPT='%c > '
_test_prompt() {
  echo $PWD | sed -E 's/.*cloud\/.*\/(.*)\/google3\/(.*)/\1 \2/' \
	    | sed 's/\/usr\/local\/google\/home/HOME/' \
	    | sed 's/HOME\/zzb/ZZB/'
  # python ~/date_delta.py
}

# PROMPT='[$(_test_prompt)] %c > '

# alias
source ~/.bash_aliases
alias ll='ls -l'
alias vi='vim'
alias -s cc=vi
alias -s h=vi
alias -s proto=vi
alias -s BUILD=vi
alias va='vim `find .`'
alias gvv='gvim `find .  | egrep ".*(\.(h|cc|proto|js|sh)|BUILD)\$"`'
alias vv='vim `find .  | egrep ".*(\.(h|cc|proto|js|sh)|BUILD)\$"`'
alias zr='echo .zshrc refreshed && source ~/.zshrc'
alias prod='prodaccess -g'
# helper function for notification.
function nt {
  text='Command job complete!!'
  if [ $# -gt 0 ]; then
    text="$*"
  fi
  # notify-send $1
  # xmessage -timeout 5 $1
  zenity --info  --text="$text"
}

[[ -s ~/.autojump/etc/profile.d/autojump.sh  ]] && . ~/.autojump/etc/profile.d/autojump.sh


# Personal Profile
alias ee="exit"
alias crawzall="cd indexing/moonshine/tools/crawzall/"
alias p4root="pwd | sed 's/\(\/google\/src\/cloud\/zzb\/.*\/google3\/\).*/\1/g'"
alias g4root="cd `p4root`"
alias p4bin="pwd | sed 's/\(\/google\/src\/cloud\/zzb\/.*\/google3\/\)\(.*\).*/\1blaze-bin\/\2/g'"
alias g4bin="cd `p4bin`"
alias p4gen="pwd | sed 's/\(\/google\/src\/cloud\/zzb\/.*\/google3\/\)\(.*\).*/\1blaze-genfiles\/\2/g'"
alias g4gen="cd `p4gen`"
alias p4src="pwd | sed 's/\(\/google\/src\/cloud\/zzb\/.*\/google3\/\)blaze-bin\/\(.*\).*/\1\2/g'"
alias g4src="cd `p4src`"

export PYTHONSTARTUP="$HOME/.pyrc"

# alias xdisplay="export DISPLAY=HostName:0.0"
alias xdisplay="export DISPLAY=:0"

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history
#
# # backspace and ^h working even after
# # returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
#
# # ctrl-w removed word backwards
bindkey '^w' backward-kill-word
#
# # ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1

# export TERM='screen-256color'

# see: http://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
# or: TERM=xterm-256color tmux
# Force tmux to assume the terminal supports 256 colours
alias tmux='tmux -2'

alias bb='blaze build'
alias blt='blaze test'
alias br='blaze run'
alias bdb='blaze test -c dbg --dynamic_mode=off --run_under="gdbserver localhost:1238" --use_sponge=no  --test_output=streamed --cache_test_results=no'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU

#自动补全选项
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*' menu select
# zstyle ':completion:*:*:default' force-list always
# zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'
 
# zstyle ':completion:*:match:*' original only
# zstyle ':completion::prefix-1:*' completer _complete
# zstyle ':completion:predict:*' completer _complete
# zstyle ':completion:incremental:*' completer _complete _correct
# zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

#修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric


# completion
autoload -U compinit
compinit

# correction
setopt correctall

# prompt
autoload -U promptinit
promptinit

# Config for blaze
#cache-path must exist
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# If you only want to complete local directories in git5, uncomment the next line
# export BLAZE_COMPLETION_PACKAGE_PATH=%workspace%





# source /etc/bash_completion.d/g4d
compdef g4=p4

# The next line updates PATH for the Google Cloud SDK.
# source '/usr/local/google/home/zzb/google-cloud-sdk/google-cloud-sdk/path.bash.inc'

# # The next line enables bash completion for gcloud.
# source '/usr/local/google/home/zzb/google-cloud-sdk/google-cloud-sdk/completion.bash.inc'


# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# figlet balabalabala
