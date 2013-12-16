
alias b='bundle exec'
alias e='subl'
alias s='subl'
alias r='rails'
alias ll='ls -l'
alias m='/Applications/Mou.app/Contents/MacOS/Mou'

source ~/.profile 
#export PS1="\w$"
find_git_branch () {
  local dir=. head
  until [ "$dir" -ef / ]; do
      if [ -f "$dir/.git/HEAD" ]; then
          head=$(< "$dir/.git/HEAD")
          if [[ $head = ref:\ refs/heads/* ]]; then
              git_branch="(${head#*/*/})"
          elif [[ $head != '' ]]; then
              git_branch=" | (detached)"
          else
              git_branch=" | (unknow)"
          fi
          return
      fi
      dir="../$dir"
  done
  git_branch=''
}
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
#PS1="\u@\h:\w\$git_branch\$ "
PS1="\[\e[36;1m\]\w\$git_branch ✗ \[\e[0m\]"

export CLICOLOR=1
export GREP_OPTIONS="--color=auto"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export export MAGICK_HOME="/Users/lin/Projects/iMgick/ImageMagick-6.8.7"
export PATH="$MAGICK_HOME/bin:$PATH"
#export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"
export PKG_CONFIG_PATH="$MAGICK_HOME/lib/pkgconfig/"


#[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
