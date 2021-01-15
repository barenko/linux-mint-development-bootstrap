# Shows the spent time since the last run
elapsed_ns(){
  if [ -z "$LAST_TIME_MS" ]
  then
    export LAST_TIME_MS="$(date +%s%N)"
    echo "00:00:00.000"
  else
    NOW="$(date +%s%N)"
    echo $(date -u "+%H:%M:%S.%N" -d"@$(echo "$NOW $LAST_TIME_MS" | awk '{printf "%.10f", ($1-$2)/1000000000.0}')") | sed 's/^\(..:..:..\....\).*/\1/'
    export LAST_TIME_MS=$NOW 
  fi
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

setopt histignorealldups sharehistory
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git env z zsh-autosuggestions asdf docker-compose docker gitignore gradle golang httpie sudo)

source $ZSH/oh-my-zsh.sh

# agnoster customization
prompt_context(){
   prompt_segment black default "%(!.%{%F{yellow}%}.)$(elapsed_ns)"
}
elapsed_ns 1>/dev/null

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="vim ~/.oh-my-zsh"

alias zshconfig='vim ~/.zshrc && source ~/.zshrc'
alias my-ip='curl http://ipecho.net/plain; echo'
alias cheat='f(){http cheat.sh/$1}; f'
alias ls=exa
#alias show=bat
alias uniq=runiq
alias fd=fdfind
alias fdr=rg
alias diff='diff -ENwbur --color'
alias port-kill='function f(){kill $(port-pid $1)}; f'
alias port-pid='function f(){lsof -t -i tcp:$1}; f'
alias hg='history | rg -i'
alias vpn='openvpn --config ~/$USER.ovpn'
alias gcp='gcp(){export GOOGLE_APPLICATION_CREDENTIALS=~/gcp/$1; echo "GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS"};gcp'
alias time='/usr/bin/time -f "\n\t%C\t[Memory used: %K, Spent time: %E]\n"'
alias kill-all='kill-all(){pgrep $1 | xargs sudo kill -9};kill-all'

alias say='espeak -v en-us+m2 -s 120 '
alias notify-info='function f(){notify-send -t 5000 -c im -i info "${2:-info}" "\n$1"; say "${2:-info}"}; f'
alias notify-error='function f(){notify-send -t 5000 -c im -i error "${2:-info}" "\n$1"; say "${2:-info}"}; f'
alias notify-success='function f(){notify-send -t 5000 -c im -i success "${2:-info}" "\n$1"; say "${2:-info}"}; f'

alias docker-rm-all='docker rm $(docker ps -a -q)'
alias docker-rmi-all='docker rmi $(docker images -a -q)'
alias docker-rm-all-f='docker rm -f $(docker ps -a -q)'
alias docker-rmi-all-f='docker rmi -f $(docker images -a -q)'
alias wrk='docker run --rm williamyeh/wrk '


export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude .vim --exclude .gradle --exclude .idea --exclude build'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:/snap/bin"

. $HOME/.asdf/asdf.sh
ASDF_GOLANG_DIRECTORY="$(asdf where golang)/go"
export GOROOT=${ASDF_GOLANG_DIRECTORY}
export GOPATH=~/projects/go

fortune | cowsay
