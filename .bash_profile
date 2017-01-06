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

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

ssh-add $HOME/ansible-systems/myid
