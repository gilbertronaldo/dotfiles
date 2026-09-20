# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

# Added by jcode installer
export PATH="/home/gilbert/.local/bin:$PATH"


# Added by Toolbox App
export PATH="$PATH:/home/gilbert/.local/share/JetBrains/Toolbox/scripts"


. "$HOME/.atuin/bin/env"
