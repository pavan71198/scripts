# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

ZSH_DISABLE_COMPFIX=true

export ZSH="/Users/pavan/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting zsh-completions)

if [[ -z $DESKTOP_SESSION ]]; 
then
read -r -p "Font of Terminal set to a Nerd Font? [Y/n]" fontcheck
fi
fontcheck=${fontcheck,,}
if [[ "$response" =~ ^(no|n)$ ]];
then

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

else

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE=nerdfont-complete

source $ZSH/oh-my-zsh.sh

DEFAULT_USER=pavan

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history anaconda virtualenv)
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"

if [[ ! -z $TMUX ]];then
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator)
fi

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol="#"
fi

POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
