#!/bin/bash

# Git ignore generator
# https://xiote.github.io/2020/09/14/12-06-30.html
function gi() { 
	echo "example"
	echo "  gi vim,go >> .gitignore"
	curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;
}


# Shortcuts
alias d="cd ~/dotfiles"
alias x="exit"
alias e="cd ~/github.com/xiote"
alias svc="service"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Detect which `ls` flavor is in use
# Original version from Matthias Bynen's dotfiles doesn't work on my Mac.
# "ls --color > /dev/null 2>&1;" then returns true after brew install coreutils.
# See original version here: https://github.com/mathiasbynens/dotfiles/blob/master/.aliases#L18
if [[ "$(uname -s)" == "Darwin" ]]; then # Mac OS
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
else
  if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
  fi
fi

alias ls="ls -al ${colorflag}"

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
#alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

##################
# CUSTOM ALIASES
##################
# Source .zshrc, which updates all other commands
alias s="source ~/.zshrc"

# npm run aliases
alias run="npm run"
alias rd="npm run dev"
alias rs="npm run server"
alias rt="npm run test"
alias rw="npm run test:watch"

# Aliases for globally installed npm modules
alias t=trash
alias ncu="npm-check -u"
alias svgop="svgo --pretty --disable=mergePaths,convertShapeToPath --multipass"
alias svgor="svgop --recursive"

# Aliases for np
alias pub="np"
alias patch="np patch"
alias minor="np minor"
alias major="np major"

# Gulp aliases
alias gulp='npx gulp'

# Check opened TCP Ports
alias openedports="sudo netstat -plunt"

alias p='pwd'

alias gcloudcomputeinstancescreate='gcloud compute instances create'
alias createinstance='gcloud compute instances create'
alias crinst='gcloud compute instances create'


alias ansibleplaybook='ansible-playbook'
alias playbook='ansible-playbook'
alias pb='ansible-playbook'

# git
alias gs='git status'
alias ga='git add'
alias gc='git commit -v'
alias gp='git push'
alias gu='git pull'
alias gl='git log'
alias grs='git restore --staged'
alias grc='git rm --cached'

# kubenates
alias m='minikube'
alias rmpd='kubectl delete pods'
alias rmsv='kubectl delete svc'
alias rmdp='kubectl delete deployments'
alias cf='kubectl create -f'
alias rmf='kubectl delete -f'
alias wpd='watch kubectl get pods --all-namespaces'
alias dspd='kubectl describe pods'
alias k='kubectl'
alias edcf='kubectl edit configmap'
alias af='kubectl apply -f'
alias edpd='kubectl edit pods'
alias lgpd='kubectl logs -f'
alias bspd='kubectl exec -it'
alias edsv='kubectl edit svc'
alias dssv='kubectl describe svc'
alias lpd='kubectl get pods --all-namespaces'
alias rmcfn='kubectl delete configmap --all -n'
alias ldp='kubectl get deployments --all-namespaces'
alias lsc='kubectl get secrets --all-namespaces'
alias rmscn='kubectl delete secrets --all -n'
alias lsv='kubectl get svc --all-namespaces'
alias rmsvn='kubectl delete svc --all -n'
alias lcf='kubectl get configmap --all-namespaces'
alias lac='kubectl get serviceaccount --all-namespaces'
alias rmacn='kubectl delete serviceaccount --all -n'
alias rmrl='kubectl delete clusterroles'
alias lrl='kubectl get clusterroles'
alias rmpvn='kubectl delete pv --all -n'
alias rmpdn='kubectl delete pods --all -n'
alias rmdpn='kubectl delete deployments --all -n'
alias cfvw='kubectl config view'
alias pf='kubectl port-forward'
alias lst='kubectl get statefulset --all-namespaces'
alias rmst='kubectl delete statefulset --all -n'
afc() { af http://gitlab.krei.co.kr:90/nextep/k8s/raw/master/$1;}
rmfc() { rmf http://gitlab.krei.co.kr:90/nextep/k8s/raw/master/$1;}
alias lpdn='kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaces'
alias pfpd='kubectl port-forward --address 192.168.0.111'
alias pfsv='kubectl port-forward --address 192.168.0.111'
alias dsnd='kubectl describe node'
alias lnd='kubectl get nodes'

if [[ $- == *i* ]]; then # Running in an interactive shell
  # Disable XON/XOFF flow control with C-S/C-Q
  stty -ixon
  stty stop undef
fi

# swift
export PATH=$PATH:/Users/xiote/github.com/apple/sourcekit-lsp/.build/debug/

# python
alias python='python3'
alias pip='/usr/local/Cellar/python@3.9/3.9.1_6/Frameworks/Python.framework/Versions/3.9/bin/pip3'
