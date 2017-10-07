#/bin/bash

rsync -vrmz $HOME/.config/nvim .

git add -Av
read -p "Commit Description: " desc
git commit -a -m "$desc"
git push
