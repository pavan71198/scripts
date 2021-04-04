PROMPT_EOL_MARK=$'\0'
if [[ $TERM_PROGRAM == "vscode" || $TERM_PROGRAM == "iTerm.app" ]]; 
then

fontcheck=y

else

echo "No GUI detected."
read -q "?Are you sure a Nerd Font is enabled? [y/N] " fontcheck

fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:/usr/local/opt/node@14/bin:/usr/local/opt/sqlite/bin:/usr/local/sbin:$PATH"
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

ZSH_DISABLE_COMPFIX=true

export ZSH="/Users/pavan/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting zsh-completions)


if [[ "$fontcheck" = n ]];
then

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

else

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fi

#eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

