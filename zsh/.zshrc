# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/suphialtintasli/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/suphialtintasli/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/suphialtintasli/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/suphialtintasli/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fwfetest() {
  local opt=$1
  local file=$2
  local example="fwfetest -d example.component.spec"
  local help="
  -dr debugger w/ report
  -d  debugger w/o report
  -hr headless w/ report
  -h  headless w/o report (default)
  "
  local dr_fn() {
    sed -i "s/autoWatch:\ false/autoWatch:\ true/" karma.conf.js
    sed -i "s/browsers:\ \['ChromeHeadless'\]/browsers:\ ['Chrome']/" karma.conf.js
    sed -i "s/singleRun:\ true/singleRun:\ false/" karma.conf.js
  }
  local d_fn() {
    sed -i '' -e "s/autoWatch:\ false/autoWatch:\ true/" karma.conf.js
    sed -i '' -e "s/browsers:\ \['ChromeHeadless'\]/browsers:\ ['Chrome']/" karma.conf.js
    sed -i '' -e "s/reporters:\ \['mocha', 'coverage-istanbul'\]/reporters:\ ['mocha']/" karma.conf.js
    sed -i '' -e "s/singleRun:\ true/singleRun:\ false/" karma.conf.js
  }
  local hr_fn() {
    sed -i "s/autoWatch:\ false/autoWatch:\ true/" karma.conf.js
    sed -i "s/singleRun:\ true/singleRun:\ false/" karma.conf.js
  }
  local h_fn() {
    sed -i '' -e "s/autoWatch:\ false/autoWatch:\ true/" karma.conf.js
    sed -i '' -e "s/reporters:\ \['mocha', 'coverage-istanbul'\]/reporters:\ ['mocha']/" karma.conf.js
    sed -i '' -e "s/singleRun:\ true/singleRun:\ false/" karma.conf.js
  }
  # isfwfedir || return
  git checkout -- karma.conf.js
  git checkout -- app/test/context.js
  if [ "$file" != '' ]; then
    if [ "$opt" = "-dr" ]; then
      dr_fn
    elif [ "$opt" = "-d" ]; then
      d_fn
    elif [ "$opt" = "-hr" ]; then
      hr_fn
    elif [ "$opt" = "-h" ]; then
      h_fn
    else
      echo "Invalid command, example: $example"
      echo $help
      return 1
    fi
  elif [ "$opt" != '' ]; then
    # file as first argument (defaults to -h opt)
    file=$opt
    h_fn
  else
    echo "Invalid command, example: $example"
    echo $help
    return 1
  fi
  str=${file//\./\\.}
  sed -i '' -e "s/\\\.spec/$str/" app/test/context.js
  npm run test
}

fwfetestreport() {
  # isfwfedir || return
  projectDir=$(pwd)
  filePath=$(find . -name "${1}*")
  chrome-browser "file://${projectDir}/coverage/src${filePath[10,-9]}.ts.html"
}
_fwfetest_complete() {
  local opts=(
    $(find app/src -name "*.spec.ts" | awk -F \/ '{print $NF}' | sed 's/\.[^.]*$//')
  )
  local completions=$(echo "${opts[@]} -h -hr -d -dr")
  reply=( $(compgen -W ${completions[@]} -- $1) )
}
compctl -K _fwfetest_complete fwfetest fwfetestreport
fwfetestclean() {
  # isfwfedir || return
  git checkout -- karma.conf.js
  git checkout -- app/test/context.js
}
