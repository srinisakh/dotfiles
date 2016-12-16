if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Custom
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

export PS1="\h:\W \u\$(__git_ps1 \" (%s) \")\$ "

alias cdo="cd ~/src/github/openstack"
alias cdm="cd ~/src/github/metacloud"
alias git=hub
source ~/src/github/metacloud/engineering/scripts/proxmox_switcher.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
source ~/.git-completion.bash

export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"
