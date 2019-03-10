#!/bin/bash
cd ~
#
# SSH
#

git clone https://henryqrm@bitbucket.org/henryqrm/.ssh.git

# ssh-keygen -t rsa -b 4096 -C "henryqrm@gmail.com"
eval "$(ssh-agent -s)"
chmod 400 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

#
#
#
git clone --recurse-submodules -j8 git@github.com:henryqrm/my-dotfiles.git /tmp/my-dotfiles
rsync -azh /tmp/my-dotfiles/ ~/
rm -fR /tmp/my-dotfiles/

sudo usermod -s /usr/bin/zsh $USER

yay --noconfirm -S boostnote newaita-icons-git android-sdk-platform-tools gitflow-avh nvm
sudo npm i -g npm n http-serve concurrently jest nock mocha ts-node live-server


echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system
sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
sudo pacman -Syyu --noconfirm
yay -Syu --noconfirm
reboot