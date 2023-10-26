# --------------------------------------------------------------------------------
# Starship
# https://starship.rs
# --------------------------------------------------------------------------------
eval "$(starship init bash)"


# --------------------------------------------------------------------------------
# Background color for ssh connections
# --------------------------------------------------------------------------------
echo -e "\033]11;#202020\a"
ssh_alias()
{
    # ps -t #{pane_tty}
    # echo -ne "\\ePtmux;\\e\\033]11;#061b4a\\007\\e\\\\"
    echo -e "\033]11;#061b4a\a"
    ssh $@
    echo -e "\033]11;#202020\a"
}
alias ssh=ssh_alias


# --------------------------------------------------------------------------------
# Get Workspace Directory in BashRC
# --------------------------------------------------------------------------------
DIR_WORKSPACE="${HOME}/Workspace"
alias myWorkspace="cd ${DIR_WORKSPACE}"
for DIR in ${DIR_WORKSPACE}/*; do
    BASHRC="${DIR}/_bashrc"
    if [[ -f "${BASHRC}" ]]; then
        echo "→ init: ${BASHRC}"
        source "${BASHRC}"
    fi;
done;

# --------------------------------------------------------------------------------
# Using vi keybinding
# --------------------------------------------------------------------------------
# set -o vi

# --------------------------------------------------------------------------------
# EXPORT VARIABLES
# --------------------------------------------------------------------------------
export TERM=xterm-256color
export EDITOR=vim


# --------------------------------------------------------------------------------
# TMUX - automatic start on opening xterm
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_with_default_session_layout
# --------------------------------------------------------------------------------
if [[ -z "$TMUX" ]] ; then
    NOW=$(date +"%Y-%m-%d-%H-%M-%S")
    # tmux new -s "session-$NOW" -c "$PWD"
fi


# --------------------------------------------------------------------------------
# GIT Bash Completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
# --------------------------------------------------------------------------------
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi


# --------------------------------------------------------------------------------
# Makes life easier
# --------------------------------------------------------------------------------

# show files
alias ls='ls --color=auto'                                      # Color files, links and directories
alias la="ls -la --color"                                       # List in long format, include dotfiles
alias ld="ls -ld */"                                            # List in long format, only directories

# directory down
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# histories
alias chist="rm ~/.bash_history && history -c && touch ~/.bash_history"
alias hist="history"

# pretty print path variables
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# process aliases
alias htop='xtitle Processes on ${USER} && htop'

# systemd specific
alias running_services='systemctl list-units  --type=service  --state=running'

# nice formatting
alias mount="mount | column -t "

# handy network commands
alias ping='ping -c 5'                                        # send ping 5 times
alias fastping='ping -c 100 -s.2'                             # send ping once
alias ports='netstat -tulanp'                                 # show open ports
# alias wakeupnas01='/usr/bin/wakeonlan 00:11:32:11:15:FC'    # wakeup on lan

# simplify life with tmux, tmuxinator plugin
alias tm='tmuxinator start'                                                                                 # abbreviation for tmuxinator start
alias t='tmux attach || tmux new-session'                                                                   # attaches tmux to the last session; creates a new session if none exists
alias ta='tmux attach -t'                                                                                   # attaches tmux to a session (example: ta portal)
alias tn='tmux new-session'                                                                                 # creates a new session
alias tl='tmux list-sessions'                                                                               # lists all ongoing sessions
alias tk='tmux kill-session -t'                                                                             # kill specific session
alias tlayout='tmux list-windows -F "#{window_active} #{window_layout}" | grep "^1" | cut -d " " -f 2'      # get layout of active window

# git open modified files in code
alias gom='git diff --name-only | xargs code'

# alias to open putty
alias putty='env GDK_BACKEND=x11 putty'


# --------------------------------------------------------------------------------
# Make man pages more readable
# --------------------------------------------------------------------------------
export LESS_TERMCAP_mb=$'\E[01;31m'        # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'   # begin bold
export LESS_TERMCAP_me=$'\E[0m'            # end mode
export LESS_TERMCAP_se=$'\E[0m'            # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'     # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'            # end underline
export LESS_TERMCAP_us=$'\E[00;32m'        # begin underline


# --------------------------------------------------------------------------------
# Add cargo to bash
# --------------------------------------------------------------------------------
source "$HOME/.cargo/env"
