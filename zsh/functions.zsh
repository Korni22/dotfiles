# Create a new directory and enter it
function mkd() {
    mkdir -p "$1" && cd "$1"
}

# Grep in history
function greph () { history 0 | grep -i $1 }

# 'work on', via https://coderwall.com/p/feoi0a
function wo() {
  CODE_DIR=~/Code
  cd $(find $CODE_DIR -type d -maxdepth 3 | grep -i $* | grep -Ev Pods --max-count=1)
}

# From http://dotfiles.org/~_why/.zshrc
# Sets the window title nicely no matter where you are
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2\a" # plain xterm title ($3 for pwd)
    ;;
  esac
}

# https://gist.github.com/bahlo/9660970
function apm() {
  REAL_APM="/usr/local/bin/apm"

  if [[ $# -eq 0 ]]; then
    $REAL_APM $1
    echo "<command> can also be bundle."
    echo
  elif [[ $1 == "bundle" ]]; then
    if [[ -f "Atomfile" ]]; then
      while read line; do
        $REAL_APM $line
      done < Atomfile
    else
      echo "Cannot find Atomfile in current directory"
    fi
  else
    $REAL_APM $1
  fi
}