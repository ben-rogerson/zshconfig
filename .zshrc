#   -------------------------------
#   BENS ZSH CONFIG!
#   -------------------------------
export ZSH=/Users/ben/.oh-my-zsh
export EDITOR="code -w"
export VAGRANT_DEFAULT_PROVIDER=virtualbox
ZSH_THEME="robbyrussell" # ~/.oh-my-zsh/themes/
plugins=(git wd) # ~/.oh-my-zsh/plugins/

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile

#   -------------------------------
#   ENVIRONMENT CONFIGURATION
#   -------------------------------
export PATH="/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/lib/node_modules"
export PATH="$PATH:/sbin:"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="$PATH:/opt/X11/bin"
export PATH="$PATH:/Users/ben/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/usr/local/bin:$PATH"

#   -------------------------------
#   WEB DEVELOPMENT
#   -------------------------------
alias gs="git sync"
alias ns="npm start"
alias nb="npm build"
alias nyu="npm update && yarn upgrade"
alias fetchy="git fetch && git pull"
alias composer="/usr/local/bin/composer"


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
alias gopro="cd ~/Projects || ls -a"
alias p="cd ~/Projects || ls -a"
alias goframe="cd ~/Projects/Frame || ls -a"


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

# Homestead reprovisioning

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

alias reprovision='homestead halt && homestead up --provision'
