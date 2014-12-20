export PATH=$PATH:~/bin/:/usr/local/bin/:/usr/local/sbin/:/Developer/usr/bin/:~/perl5/bin/:~/.vim/bin

#prompt
export PS1="[\W]$ "
export PAGER=less
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN 
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
function less() { command less -X -i "$@"; }
function ml() { command multitail "$@"; }
function pstree() { command ps axjf; } #no osx
function lessc () { /usr/share/vim/vim73/macros/less.sh "$@"; }

#alias
alias py='python'
alias ll='l'
alias tmp='cd $TMPDIR'

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
