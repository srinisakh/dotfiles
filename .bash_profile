if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

export PS1="\h:\W \u\$(__git_ps1 \" (%s) \")\$ "

alias cdo="cd ~/src/github/openstack"
alias cdm="cd ~/src/github/metacloud"
alias git=hub
source ~/src/github/metacloud/engineering/scripts/proxmox_switcher.sh
