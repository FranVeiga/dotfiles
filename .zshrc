
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/franveiga/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="tjkirch"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump archlinux)

[[ -s /home/user/.autojump/etc/profile.d/autojump.sh  ]] && source /home/user/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u


source $ZSH/oh-my-zsh.sh

# r
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# set personal environment variables
export PATH=$PATH:/home/franveiga/scripts:/home/franveiga/.games:/home/franveiga/scripts/statusbar
export GITHUB="https://github.com/FranVeiga/"
export TUIR_BROWSER="mpv"
export TUIR_URLVIEWER="feh"
#export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
export MANPAGER="nvim -c 'set ft=man || NERDTreeToggle' -"

# Set Vim mode
bindkey -v


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi


# Example aliases
# alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="vim ~/.oh-my-zsh"
# alias cls=' clear'
# alias ls='exa --group-directories-first'
# alias la='ls -aF'
# alias ll='la -lahF'
# alias lst='ls -lahTFL 3'
# alias lr='ls -lahRFL 3'
# alias python='python3'
# alias pip='pip3'
# alias rm='rm -vri'
# alias cd..='cd ..'
# alias pacman='sudo pacman'
# alias puto='clear && printf "\nPero escuchame una cosa hijo de re mil puta a mi no me decis puto \nme escuchaste pendejito de mierda asi que no te pases de vivo que te rompo todo \nla re concha de tu madre\n\n"'
# alias reputo='puto'
# alias skuni='clear && printf  "\nskiuniiiiiiii\n\n"'
# alias te_volvi_a_probar='echo tu boca no pierde sabor a caramelo oo oo oo oo'
# alias vifm='vifm .'
# alias wifi-menu='nmtui'
# alias VirtualBoxVM='/usr/lib/virtualbox/VirtualBoxVM'
# alias doom='~/.emacs.d/bin/doom'
# alias qtilerc='vim ~/.config/qtile/config.py'
# alias vimp='vim -u ~/.vimrc_plugins'
# alias mv='mv -vi'
# alias cp='cp -riv'
# alias mkdir='mkdir -vp'
