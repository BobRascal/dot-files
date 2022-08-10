# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

#PS1='[\u@\h \W]\$ '
#PS1='\033[0;1;31m\u\033[0m@\033[1;31m\h\033[1;31m \W\033[0m\$ '
PROMPT='%B%F{1}%n%f%b@%B%F{1}%m %1~%f%b%# '
RPROMPT='[%B%F{1}%?%f%b]'

path+=('/home/nicholas/bin')

export PATH

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto --time-style=+%m-%d-%y\ %H%M'
	alias grep='grep --color=auto'
	alias pacman='pacman --color=auto'
fi

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

bindkey -v

typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
key[Delete]="${terminfo[kdch1]}"

[[ -n "${key[Home]}"			]] && bindkey -- "${key[Home]}"				beginning-of-line
[[ -n "${key[End]}"				]] && bindkey -- "${key[End]}"				end-of-line
[[ -n "${key[Control-Left]}"	]] && bindkey -- "${key[Control-Left]}"		backward-word
[[ -n "${key[Control-Right]}"	]] && bindkey -- "${key[Control-Right]}"	forward-word
[[ -n "${key[Delete]}"			]] && bindkey -- "${key[Delete]}"			delete-char

#if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
#		autoload -Uz add-zle-hook-widget
#		function zle_application_mode_start { echoti smkx }
#		function zle_application_mode_stop {echoti rmkx }
#		add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
#		add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
#fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# The following lines were added by compinstall
zstyle :compinstall filename '/home/nicholas/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
