#/bin/bash

rsync -vrmz $HOME/.config/nvim config/
rsync -vrmz $HOME/.config/i3 config/

git add -Av
read -p "Commit Description: " desc
git commit -a -m "$desc"
git push
