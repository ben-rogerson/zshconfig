#   -------------------------------
#   BENS ZSH CONFIG!
#   -------------------------------

# Path to your oh-my-zsh installation
export ZSH=/Users/rogie/.oh-my-zsh
export EDITOR="code -w"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"  # ~/.oh-my-zsh/themes/

plugins=(alias-tips chucknorris colored-man colorize common-aliases dirhistory extract git osx node npm tiny-care-terminal vagrant github pip python wd web-search z zsh-autosuggestions zsh-syntax-highlighting) # ~/.oh-my-zsh/plugins/

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

DEFAULT_USER="rogie"


#   -------------------------------
#   ENVIRONMENT CONFIGURATION
#   -------------------------------
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"


#   -------------------------------
#   WEB DEVELOPMENT
#   -------------------------------

# Git aliases
alias gs="git status"
alias gp="git fetch && git pull"

# NPM aliases
alias ns="npm start"
alias nb="npm run build"
alias nu="npm update"
alias ni="npm install"

# SSH Helpers
alias keyup="ssh-copy-id -i ~/.ssh/id_rsa $@"
# Copy key to clipboard
alias keycopy="cat ~/.ssh/id_rsa.pub | pbcopy"
alias key='keycopy'

alias composer="/usr/local/bin/composer"

# Call composer if vendor is typed
vendor() { composer "$1"; }


#   -------------------------------
#   COMMONLY USED APPS
#   -------------------------------
alias .="code ."
alias reddit="chrome https://www.reddit.com/top/"
alias config="code ~/.zshrc"
alias sshedit='. ~/.ssh/config'
alias reload="source ~/.zshrc"


#   -------------------------------
#   PROJECT FOLDER SHORTCUTS
#   -------------------------------
alias p="cd ~/Projects || ls -a"


#   -----------------------------
#   MAKE TERMINAL BETTER
#   -----------------------------

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
