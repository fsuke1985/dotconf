export PATH=$PATH:~/bin/:/usr/local/bin/:/usr/local/sbin/:/Developer/usr/bin/:~/perl5/bin/:~/.vim/bin:~/project/bin/:~/.bin/:./bin

export LESS='-R'
export LESSOPEN="|/usr/local/Cellar/lesspipe/1.82/bin/lesspipe.sh %s"
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

#prompt
#export PS1="[\W]$ " goto it > autocomplete
export PAGER=less
export HISTSIZE=50000
export HISTFILESIZE=50000
shopt -s histappend
shopt -s histverify
shopt -s checkhash
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
alias ll='l'
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

#perl onliner
##pmmodule include search path
function pmodule() {
    perl -le 'my $mod = $ARGV[0] . ".pm"; eval {require "$mod"}; if($@) { print "missing pm.." } else { print $INC{$mod}; }' $1
}
alias perldoc="/usr/bin/perldoc5.16"
##plenv
export PATH=$PATH:~/.plenv/bin/
eval "$(plenv init -)"

#git
##autocomplete
source ~/.gitd/dotconf/git-completion.bash
source ~/.gitd/dotconf/git-prompt.bash
export PS1='[\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]] \$ '

#rbenv
export PATH=$PATH:~/.rbenv/bin/
eval "$(rbenv init -)"

#ssh agent
eval `ssh-agent`
