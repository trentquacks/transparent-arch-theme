#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Wrapper for yazi to allow changing directories
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Defines commands or something
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bonsai='cbonsai --color=255,255,75,24 --time=0.08  -l -i'
awake=$(awk '{print int($1/3600) "h "int(($1%3600)/60) "m "int($1%60) "s", endl=""}' /proc/uptime)
daytoday=$(date | awk '{print substr($1, 0, length($1)-1)}')

# bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

#Change display name in terminal
PS1='\W \[\e[38;5;75m\] \[\e[0m\]'


# Set some env variables
export EDITOR=nvim
# export PATH=$PATH:/var/lib/flatpak/exports/bin
# export PATH=$PATH:/var/lib/flatpak/exports/share/applications
# export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share/applications

#
/home/wuki/bin/random_chafa.sh
echo -ne "\033[38;5;75m✦\033[0m" $USER 
echo -ne "\033[38;5;75m  ᶻ 𝗓 𐰁 \033[0m"
echo -ne "$awake"
echo -ne "\033[38;5;75m  ོ༘₊\033[0m" $daytoday
echo
echo
