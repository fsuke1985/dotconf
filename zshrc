export PATH=~/bin/:$PERL_LOCAL_LIB_ROOT:$PATH:/usr/local/bin/:/usr/local/sbin/:/Developer/usr/bin/:~/perl5/bin/
eval $(perl -I/Users/afsuke/perl5/extlib/lib/perl5 -Mlocal::lib)

autoload -U compinit
compinit

bindkey -v # vi mode
PROMPT="[%/%%] "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

# ls Color
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.tar=01;31'
export LS_COLORS
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
LISTMAX=0

autoload history-search-end
autoload -Uz compinit; compinit

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey -a "q" push-line

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt hist_ignore_all_dups
setopt auto_cd
setopt auto_pushd
#setopt correct
setopt list_packed
setopt nolistbeep
setopt extended_history
setopt inc_append_history
setopt pushd_ignore_dups
setopt interactive_comments
setopt notify
setopt print_exit_value
setopt glob_complete

#one command
function l() { command ls -altrFGh "$@"; }
function c() { command cat -n "$@"; }
function cl() { command clear; }
function less() { command less -X -i "$@"; }
function ml() { command multitail "$@"; }
function pstree() { command ps axjf; } #no osx
#zsh only
alias -g G3"| grep"
alias -g L="| less -X"
alias -g V="| vi -"
alias tm=tmux

#util
function seqf() {
    local num_start=$1
    local num_end=$2

    seq -f %02g ${num_start} ${num_end}
}
export MDATE=`date +"%Y%m%d"`

#perl onliner
##pmmodule include search path
function pmodule() {
    perl -le 'my $mod = $ARGV[0] . ".pm"; eval {require "$mod"}; if($@) { print "missing pm.." } else { print $INC{$mod}; }' $1
}

