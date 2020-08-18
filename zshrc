# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/fsuke1985/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="blinks"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:~/bin/:/usr/local/bin/:/usr/local/sbin/:/Developer/usr/bin/:~/perl5/bin/:~/.vim/bin:~/project/bin/:~/.bin/:./bin:~/.composer/vendor/bin/

export LESS='-R'
export LESSOPEN="|/usr/local/Cellar/lesspipe/1.82/bin/lesspipe.sh %s"
export EDITOR=vim

#prompt
#PROMPT="%{${fg[magenta]}%}[%n@%m]%{${reset_color}%} %~
#$ "

# 色を使用出来るようにする
autoload -Uz colors
colors

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

export PAGER=less
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

umask 022
ulimit -c 0

#one command
function l() { command ls -altrFGh "$@"; }
function c() { command cat -n "$@"; }
function cl() { command clear; }
#function less() { command less -X -i "$@"; }
function ml() { command multitail "$@"; }
function pstree() { command ps axjf; } #no osx
function lessc () { /usr/share/vim/vim73/macros/less.sh "$@"; }

#alias
alias py='python'
alias ll='ls -altr'
alias tmp='cd $TMPDIR'
alias cpula='/usr/bin/g++'

#util
function seqf() {
    local num_start=$1
    local num_end=$2

    seq -f %02g ${num_start} ${num_end}
}
export MDATE=`date +"%Y%m%d"`

function ..() { cd ..; }

# direnv
eval "$(direnv hook zsh)"

#git
##autocomplete
fpath=(~/.zsh $fpath)
source ~/.git-prompt.sh
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
complete -C '/usr/local/aws-cli/aws_completer' aws
