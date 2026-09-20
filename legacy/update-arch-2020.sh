#/bin/bash

rsync -vrmz $HOME/.config/nvim config/
rsync -vrmz $HOME/.config/i3 config/
rsync -vmrz $HOME/.config/polybar config/
rsync -vmrc $HOME/.config/termite config/
rsync -vmrc $HOME/.config/compton.conf config/

git add -Av
read -p "Commit Description: " desc
git commit -a -m "$desc"
git push
