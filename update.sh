#/bin/bash

rsync -vrmz $HOME/.config/nvim nvim

git add .
read -p "Commit Description: " desc
git commit -a -m "$desc"
git pull 
