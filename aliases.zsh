# Aliases
alias sci='ssh-copy-id'
alias sshk='kitten ssh'
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

# SSH Server Alias 
alias sshnas='sshk cmilani@172.16.1.253'
alias sshoss='sshk cmilani@172.16.1.60'
alias sshfw='ssh cmilani@172.16.1.1'
alias sshdns='sshk cmilani@172.16.1.9'
alias sshbw='sshk cmilani@172.16.1.80'
alias sshha='sshk cmilani@172.16.1.4'
alias sshda='sshk cmilani@172.16.1.117'

# load mcfly
eval "$(mcfly init zsh)"

# load zsh-autosuggestions
source "$HOME/.my-custom-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# load zsh-syntax-highlighting
source "$HOME/.my-custom-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load fzf keybindings and completions
eval "$(fzf --zsh)"