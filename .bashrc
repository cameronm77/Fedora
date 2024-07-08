#!/bin/bash
x=${-%%i*}
iatest=$((${#x} + 1))

#######################################################
# SOURCED ALIAS'S AND SCRIPTS BY zachbrowne.me 
#######################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	 . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#######################################################
# EXPORTS
#######################################################

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
[[ $- == *i* ]] && stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nano
export VISUAL=nano
alias nano='nano'
alias vim='nano'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
alias grep="/usr/bin/grep \$GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Alias's for SSH (Example)
# alias remote='kitten ssh -i ~/.ssh/key.pem user@IP'

#######################################################
# GENERAL ALIAS'S
#######################################################

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias vi='nano'

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias ll='ls -Fls' # long listing format

#Other Alias's 
alias sci='ssh-copy-id'
alias ssh='kitten ssh'
alias updateall='sudo dnf update --refresh'
alias z='cd'
alias cat='bat'
alias tracert='mtr'
alias nano='sudo nano'
alias c='clear'
alias reboot='systemctl reboot'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .4='cd ../../../../..'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias sha1='openssl sha1'
alias mkdir='mkdir -pv'
alias h='history'
alias j='jobs -l'
alias ping='ping -c 10'
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

#Alias's for connecting to servers via ssh
alias sshagh='kitten ssh $USER@agh'
alias sshhap='kitten ssh $USER@hap'
alias sshfed='kitten ssh $USER@fed'
alias sshnc='kitten ssh $USER@nc'
alias sshduo='kitten ssh $USER@duo'
alias sshvault='kitten ssh $USER@vault'

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in "$@"; do
		if [ -f "$archive" ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf "$archive"    ;;
				*.tar.gz)    tar xvzf "$archive"    ;;
				*.tar.xz)	 tar xvJf "$archive"	  ;;
				*.bz2)       bunzip2 "$archive"     ;;
				*.rar)       rar x "$archive"       ;;
				*.gz)        gunzip "$archive"      ;;
				*.tar)       tar xvf "$archive"     ;;
				*.tbz2)      tar xvjf "$archive"    ;;
				*.tgz)       tar xvzf "$archive"    ;;
				*.zip)       unzip "$archive"       ;;
				*.Z)         uncompress "$archive"  ;;
				*.7z)        7z x "$archive"        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# For changing wallpaper
wallpaper() {
	if [ $# -ne 1 ]; then
		echo "Usage: wallpaper image.jpg"
		return 1
    	fi
    	swww img "$1" --transition-fps 60 --transition-type wipe --transition-duration 2
	image_path=$(readlink -f "$1")
	ln -sf "$image_path" ~/.config/wallpaper
}

# For converting mp4 to gif
mp4togif() {
	if [ $# -eq 1 ]; then
		if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
			echo "Usage: mp4togif input.mp4 [fps]"
        		return 1
        	fi
    	fi
    	if [ $# -lt 1 ]; then
        	echo "Usage: mp4togif input.mp4 [fps]"
        	return 1
    	fi
	
	input_file="$1"
   	fps=${2:-10} # Default FPS
    	output_file="$(dirname "$input_file")/$(basename "$input_file" .mp4).gif"

    	ffmpeg -i "$input_file" -vf "fps=$fps,scale=1920:-1:flags=lanczos" -c:v gif "$output_file"
}

# Install Starship - curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"

# Zoxide
eval "$(zoxide init bash)"
