# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*|linux*)
#     PS1= "\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
#     ;;
#*)
#     ;;
#esac
#
#if [ "$color_prompt" = yes ]; then
#     PS1= '${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
#else
#     PS1= '${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|linux*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
	;;
*)
	;;
esac



export TERM="xterm-256color"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# Lines configured by zsh-newuser-install
setopt BANG_HIST                    # 在展开字符期间对"!"特殊处理
setopt EXTENDED_HISTORY             # 生成详细的历史记录
setopt INC_APPEND_HISTORY           # 立即写入历史文件，而不是退出时写入
setopt SHARE_HISTORY                # 在各个终端窗口中共享历史记录
setopt HIST_EXPIRE_DUPS_FIRST       # 修剪掉过量的历史记录时首先去重复
setopt HIST_IGNORE_DUPS             # 不记录刚刚记录的内容
setopt HIST_IGNORE_ALL_DUPS         # 如果新内容重复，则删除旧内容
setopt HIST_FIND_NO_DUPS            # 不显示先前查找到的历史记录内容
setopt HIST_IGNORE_SPACE            # 不记录以空格开头的内容
setopt HIST_SAVE_NO_DUPS            # 不要在历史文件中写入重复的条目
setopt HIST_REDUCE_BLANKS           # 在记录条目之前删除多余的空白
setopt HIST_VERIFY                  # 在显示历史扩展时不要立即执行
setopt HIST_BEEP                    # 访问不存在的历史记录时发出声音提示
#setopt autocd

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history

# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# Fix numeric keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + - * /
bindkey -s "^[Ol" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"


# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/src/z.lua/z.lua.plugin.zsh
