# ===== ===== ===== ===== ===== ===== ===== ===== ===== =====
#PATH
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/opt/homebrew/bin/node@16:$PATH"
export PYENV_ROOT=" $HOME/.pyenv"
export PATH=" $PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH=$HOME/commands:$PATH
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/src/go
# ===== ===== ===== ===== ===== ===== ===== ===== ===== =====
export GNUTERM="qt font \"Arial,12\""
# export GNUTERM="qt font \"Helvetica\""
# ===== ===== ===== ===== ===== ===== ===== ===== ===== =====
#gcc
export CXXFLAGS="-std=c++20"
export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/Users/$USER/AtCoder/include/
# ===== ===== ===== ===== ===== ===== ===== ===== ===== =====
#multipass
alias mp='multipass'
# ===== ===== ===== ===== ===== ===== ===== ===== ===== =====
# zsh補完
# https://github.com/zsh-users/zsh-autosuggestions
# zsh補完設定
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=#005f5f,bold,underline"
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_STRATEGY=(completion)
bindkey '^p' autosuggest-accept
plugins=( 
    # other plugins...
    zsh-autosuggestions
)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# ===== ===== ===== ===== ===== ===== ===== ===== ===== =====


#追記部分
autoload -U compinit
compinit
setopt HIST_VERIFY
setopt NO_BEEP
setopt printeightbit

# host=`hostname | sed -e 's/\..*//'`
host=$HOST:fr
tty=$TTY:t
HISTFILE=$HOME/.history.$tty
HISTSIZE=200
SAVEHIST=$HISTSIZE

limit datasize unlimited
limit stacksize 60M


export dirfile="$HOME/.who.$host.$tty"
export dirhfile="$HOME/.who.$host"
if [[ ! -f $dirfile ]]; then
    if [[ ! -f $dirhfile ]]; then
	dir=$HOME
    else
	dir=`cat $dirhfile`
    fi
else
    dir=`cat $dirfile`
    if [[ -d $dir ]]; then
	cd $dir
    else
	dir=$HOME
    fi
fi

if [[ $TERM == "xterm" ]]; then
    export TERM=xterm-color
fi

echo $dir > $dirfile
# we need a lock
if [[ ! -f $dirhfile ]]; then
    echo $dir > $dirhfile
fi

DIRSTACKSIZE=6
setopt AUTO_PUSHD

function pushd {
    builtin pushd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}

function popd {
    builtin popd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}

function cd {
    builtin cd "$@"
    echo $PWD > $dirfile
    echo $PWD > $dirhfile
}

function phd {
    cat $dirhfile
}

function hd {
    cd `cat $dirhfile`
}

export MANPATH=$MANPATH:/usr/share/man:/usr/local/share/man:/usr/local/man:/usr/local/news/man

if [[ -f ~/bin/jless ]]; then
    alias   more=jless
else
    alias   more=less
fi


alias   h="fc -l -d -20"
alias   history="fc -l -d -$HISTSIZE" 
alias   j=jobs
alias   javac="javac -J-Dfile.encoding=UTF8"
alias sslogin='eval `ssh-agent`; ssh-add ~/.ssh/id_dsa'
alias sslogon='ssh-add ~/.ssh/id_dsa ~/.ssh/id_rsa ~/.ssh/identity'
alias nslookup="nslookup -sil"
# alias irulan="ssh $irulan"
alias rless="unset LESSOPEN; less"
# alias trn="export LANG=C; trn"
# prompt='%S+%s%m%S+%s%n ' 
mailpath=/var/mail
stty susp '^z'
setopt PUSHD_IGNORE_DUPS
alias pu=pushd
alias po=popd

function mytitle {
    # echo -n ']2;'${host}': '${PWD}'' # original
    # echo -n ']2;tokky : '${PWD}''
}

if [[ $TERM = [xk]term* ]]; then
function precmd {
    mytitle
}
fi

function whois {
    ldapsearch -LLL "(uid=$@)"
}

function sshow {
    printenv | grep SSH | sed -e 's/^/export /' 
}

if [[ -f /usr/local/bin/gnuls ]]; then
    alias   ls="gnuls --show-control-chars --color=auto -F"
elif [[ $OSTYPE = linux* ]]; then
    alias   ls="ls --show-control-chars --color=auto -F"
else
    alias   ls="ls -F -w"
fi

alias   re='rm #* *~ #.* .*~ *.dvi *.log *.blg *.bak *.swp;'

autoload -U compinit 
compinit

colorlist() {
 for color in {000..015}; do
  print -nP "%F{$color}$color %f"
 done
 printf "\n"
 for color in {016..255}; do
  print -nP "%F{$color}$color %f"
  if [ $(($((color-16))%6)) -eq 5 ]; then
   printf "\n"
  fi
 done
}

# 変数の読み込み
source ~/.zsh-variable.sh
function gitmain() {
  git config --global user.name $GIT_USER_NAME_PRIVATE
  git config --global user.email $GIT_USER_EMAIL_PRIVATE
  source ~/.zshrc
}

function gitsub() {
  git config --global user.name $GIT_USER_NAME_WORK
  git config --global user.email $GIT_USER_EMAIL_WORK
  source ~/.zshrc
}

# PROMPT設定
# PROMPT="%F{023}tokky[git:`git config user.name`]%f %# "
PROMPT="%F{023}aisu[git:`git config user.name`]%f %# "
RPROMPT='[%~]'
setopt transient_rprompt 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# __conda_setup="$('/Users/$USER/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/$USER/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/$USER/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/$USER/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# <<< conda initialize <<<
source /Users/$USER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:~/.latexmkrc
export PATH=$PATH:/usr/local/texlive/2022/bin/universal-darwin
