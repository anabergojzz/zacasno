# If not running interactively, don't do anything
[ -z "$PS1" ] && return

set -o vi
alias ..='cd ..'
alias ll='ls -alFh'
alias ls='ls -1F --color'
alias grep='grep --color=auto'
alias abook="abook --config ~/doc/zapiski/cfg/abookrc --datafile ~/doc/zapiski/cfg/addressbook"
alias transs='trans sl:en'
alias python='python3'
alias sink='sudo rsync -av --delete --exclude='.*' --exclude='tmp' \
	--exclude='fontconfig' ~/ /media/drejc/BACKUP/doma/'
alias sinkfromtel="rsync -av -e 'ssh -p 8022' u0_a229@192.168.178.29:/storage/emulated/0/Documents/ ~/doc/telefon/"
alias sinktotel="rsync -av -e 'ssh -p 8022' ~/doc/telefon/ u0_a229@192.168.178.29:/storage/emulated/0/Documents/"

HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

force_color_prompt=yes
color_prompt=yes

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
