if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
