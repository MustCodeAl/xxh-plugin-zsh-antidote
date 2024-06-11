# This script will be executed ON THE HOST when you connect to the host.
# Put here your functions, environment variables, aliases and whatever you need.
CURR_DIR="$(cd "$(dirname "$0")" && pwd)"


export ZSH="$CURR_DIR/.antidote"


# Set the name of the static .zsh plugins file antidote will generate.
zsh_plugins=$CURR_DIR/.zsh_plugins

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote.
fpath+=($CURR_DIR/.antidote/functions $fpath)
autoload -Uz antidote


# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh



