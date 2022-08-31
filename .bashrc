# .bashrc

# *******************************************
# Source global definitions
# *******************************************
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f /etc/bash_completion.d/git ]; then
  . /etc/bash_completion.d/git
fi

# Ensure erase is a sane value
stty erase '^?'

# ******************************************
# Useful functions
# ******************************************
function fgl {
  find | grep --color=always -i "$@" | less -R
}

function ffgl {
  find -type f -not -path "*/.svn/*" -not -path "*/.git/*" -exec grep -Hn --color=always -i "$@" '{}' \; | less -R
}

# git aliases
alias gs='git stasus '
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias go='git checkout '
alias gd='git diff '

# Other aliases
alias ls='ls -h --color'
alias ll='ls -l'
alias lx='ls -lXB'        # Sort by extension
alias lk='ls -lSr'        # Sort by size, biggest last
alias lt='ls -ltr'        # Sort by date, most recent last
alias lc='ls -ltcr'       # Sort by/show change time, most recent last
alias lu='ls -ltur'       # Sort by/show access time, most recent last
alias lr='ll -R'          # Recursive ll
alias la='ll -A'          # Show hiden files

# Stop timeouts
export TMOUT=0
