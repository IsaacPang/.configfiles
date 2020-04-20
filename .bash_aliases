# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -alsh --group-directories-first --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ..="cd .."
alias fhere="find . -name "
alias mkdir="mkdir -pv"
alias ii="explorer.exe"
alias notes="cd ~/MBusA\ 2020/Daily\ Notes/ && ranger"

#alias for clip on cmd, but xclip -sel clip still works
alias clip="clip.exe"

# alias chrome
alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"

# alias tmux
alias tmux="TERM=screen-256color-bce tmux"

# alias cmd starts
alias start="cmd.exe /C start"
alias open="cmd.exe /C start"

# alias for vi and vim editors to use nvim
alias vi="nvim"
alias vim="nvim"

# git aliases
alias merge="bash ~/gitscripts/merge"

# config alias for bare repo
alias config='/usr/bin/git --git-dir=/home/isaac/.configfiles/ --work-tree=/home/isaac'
