alias json="python -mjson.tool"

alias hs='history | grep --color=auto'

alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'

getAliasSh()
{
    if ([ $# -eq 0 ])
    then
            echo "Usage: getAliasSh AliasUserID"
    else
            wget -q -O - "$@" https://alias.sh/user/"$1"/alias >> ~/.bash_aliases
    fi
}

alias netlisteners='lsof -i -P | grep LISTEN'

s(){
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

alias poogle='ping google.com'

alias rm='rm -I'

servedir(){
    sudo python -m SimpleHTTPServer 80
}

alias k9='kill -9'

function authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
    < ~/.ssh/id_dsa.pub
}

alias ifconfig-ext='curl ifconfig.me'

alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


function mcd() {
  mkdir -p "$1" && cd "$1";
}

alias open='xdg-open'

sssh (){ ssh -t "$1" 'tmux attach || tmux new || screen -DR'; }

alias tm='ps -ef | grep'

alias c='clear'

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''