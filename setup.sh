find $PWD -maxdepth 1 -mindepth 0 -exec ln -s '{}' $HOME/.config/ \;
mv $HOME/.config/.zshrc ../.zshrc
unlink $HOME/.config/.git 
unlink $HOME/.config/.gitignore
unlink $HOME/.config/README.md
unlink $HOME/.config/eww_desktop
unlink $HOME/.config/hypr_desktop
unlink $HOME/.config/eww_laptop
unlink $HOME/.config/hypr_laptop
unlink $HOME/.config/setup.sh
unlink $HOME/.config/dotFiles
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

