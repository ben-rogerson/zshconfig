#-------------------------------
#BENS 2020 ZSH CONFIG
#-------------------------------

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#-------------------------------
#ENVIRONMENT CONFIGURATION
#-------------------------------

# Path to your oh-my-zsh installation
export ZSH=/Users/ben/.oh-my-zsh
export EDITOR="code -w"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"  # ~/.oh-my-zsh/themes/

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile

plugins=(alias-tips chucknorris colorize common-aliases dirhistory extract git osx node npm vagrant github pip python wd web-search z zsh-autosuggestions zsh-syntax-highlighting) # ~/.oh-my-zsh/plugins/

DEFAULT_USER="ben"

export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:/usr/local/lib/node_modules"
export PATH="$PATH:$HOME/bin"

#-------------------------------
#WEB DEVELOPMENT
#-------------------------------

# Folders
alias p="cd ~/Projects || ls -a"

# Apps
alias .="code ." # Vscode
alias sourcetree="open -a SourceTree ."
alias st="sourcetree"

# NPM scripts
alias ns="npm start"
alias nb="npm run build"
alias nd="npm run dev"
alias nu="npm update"
alias nd="npm run dev"
alias ni="npm install"
alias nr="npm remove"

# Misc commands
alias fetchy="git fetch && git pull"
alias composer="/usr/local/bin/composer"

# Safetytrash
alias rmnode="trash node_modules"
alias rmvendor="trash vendor"

# SSH
alias sshcopy="pbcopy < ~/.ssh/id_rsa.pub && echo Copied id_rsa.pub"
alias keycopy="sshcopy"
alias copykey="sshcopy"
alias key="sshcopy"
alias sshedit=". ~/.ssh/config"
alias sshconfig="sshedit"

# Tasks
alias sta="open -a SourceTree . && code . && npm start"

# Call composer if vendor is typed
vendor() { composer "$1"; }

# Create a new project
function newpro {
    cd /Users/ben/Projects
    mcd "$1"
    npm init -y
    echo "# Project" >> README.md
    git init
    echo "node_modules/" >> .gitignore
    code .
    echo 🔥🔥🔥 New Project created 🔥🔥🔥
}

# Add composer-link command for local development
# https://johannespichler.com/add-composer-link-command/
function composer-link {
  composer config repositories '{"type": "path", "url": "'$1'", "options": {"symlink": true}}' --file composer.json
  composer require $2 @dev
}

# Disable CORS in Chrome
alias cors="open /Applications/Google\ Chrome.app --args --user-data-dir=\"/var/tmp/Chrome dev session\" --disable-web-security"

#-------------------------------
#CRAFT SHORTCUTS
#-------------------------------
alias craft-install='composer install' # Installs dependencies from the composer.lock
alias craft-update='./craft update all' # Installs dependencies based on the current composer.json & composer.lock
alias craft-updates='./craft update/info' # Displays info about available updates
alias craft-clear='./craft clear-caches/all' # Clear all caches
alias craft-flush='./craft cache/flush-all' # Flushes given cache components.

#-------------------------------
#COMMONLY USED APPS / CONFIGS
#-------------------------------
alias .="code ."
alias reddit="chrome https://www.reddit.com/top/"
alias config="code ~/.zshrc"
alias sshedit='. ~/.ssh/config'
alias reload="source ~/.zshrc"
alias refresh="reload"
alias sshedit='cd ~/.ssh/ || ll && . ~/.ssh/config'
alias phpedit='cd /usr/local/etc/php || ll'

#-----------------------------
#MAKE TERMINAL MORE BETTERER
#-----------------------------
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias edit='code'                           # edit:         Opens any file in vscode editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
cdf () {
    currFolderPath=$( /usr/bin/osascript <<EOT
        tell application "Finder"
            try
        set currFolder to (folder of the front window as alias)
            on error
        set currFolder to (path to desktop folder as alias)
            end try
            POSIX path of currFolder
        end tell
EOT
    )
    echo "cd to \"$currFolderPath\""
    cd "$currFolderPath"
}

# Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
