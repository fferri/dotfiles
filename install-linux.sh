#!/bin/sh

cd $HOME

if [ ! -d .dotfiles ]; then
    echo error: $HOMNE/.dotfiles does not exist 1>&2
    exit 1
fi

echo "Installing essential apt packages..."
sudo apt install zsh git vim vim-gtk terminator wget curl gimp inkscape cmake cmake-curses-gui build-essential libboost-dev qtbase5-dev qtquickcontrols2-5-dev libqt5svg5-dev qt3d5-dev libtinyxml2-dev libzmq3-dev libcgal-dev gnome-tweaks xsltproc libasio-dev luarocks lua5.3 liblua5.3-dev
echo "Installing python apt packages..."
sudo apt install bpython python3-zmq python3-cbor python3-lark python3-numpy python3-opencv python3-pykdl python3-pandas python3-matplotlib python3-pyqt5
sudo apt install python3-xmlschema
sudo apt install python3-pyside2.qtcore python3-pyside2.qtgui python3-pyside2.qtqml python3-pyside2.qtquick python3-pyside2.qtquickcontrols2 python3-pyside2.qtquickwidgets python3-pyside2.qtwidgets python3-pyside2.qtxml python3-pyside2.qtsvg

sudo sh -c "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb && dpkg -i /tmp/google-chrome.deb && rm /tmp/google-chrome.deb"

snap install zoom-client vlc discord telegram-desktop skype obs-studio

echo "Configuring git user info..."
git config --global user.email "federico.ferri.it@gmail.com"
git config --global user.name "Federico Ferri"

# remember git credentials for 1 hour (without storing them on disk)
#git config --global credential.helper 'cache --timeout=3600'

sudo sh -c "wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.3.2/gcm-linux_amd64.2.3.2.deb -O /tmp/gcm.deb && dpkg -i /tmp/gcm.deb && rm /tmp/gcm.deb"
git config --global credential.credentialStore secretservice

echo "Installing oh-my-zsh..."
if [ ! -d .oh-my-zsh ]; then
    RUNZSH=no sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Installing theme powerlevel10k for oh-my-zsh..."
if [ ! -d .oh-my-zsh/custom/themes/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k
fi

echo "Installing zsh autosuggestions..."
if [ ! -d .zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions .zsh-autosuggestions
fi

echo "Installing zsh syntax highlighting..."
if [ ! -d .zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting .zsh-syntax-highlighting
fi

backup_file() {
    if [ -f $1 ]; then
        if [ -L $1 ]; then
            rm $1
        else
            mv $1 $1.bak.$(date +%s)
        fi
    fi
}

echo "Creating symlinks to dotfiles..."
backup_file .profile
ln -s .dotfiles/.profile

backup_file .aliases
ln -s .dotfiles/.aliases

backup_file .bashrc
ln -s .dotfiles/.bashrc

backup_file .zshrc
ln -s .dotfiles/.zshrc

backup_file .p10k.zsh
ln -s .dotfiles/.p10k.zsh

backup_file .terminator
ln -s .dotfiles/.terminator

echo "Configuring vim..."
mkdir -p .vimswap
mkdir -p .vimbackup

echo "Installing vim plugged..."
if [ ! -f .vim/autoload/plug.vim ]; then
    curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

backup_file .vimrc
ln -s .dotfiles/.vimrc

backup_file .gvimrc
ln -s .dotfiles/.gvimrc

echo "Installing vim plugged plugins..."
vim +PlugInstall +qall

echo "Installing MenloLGS NF fonts..."
mkdir -p .fonts
cd .fonts
for i in 'Regular' 'Bold' 'Italic' 'Bold Italic'; do
    if [ ! -f "MesloLGS NF $i.ttf" ]; then
        wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF ${i}.ttf"
    fi
done
fc-cache -f -v
cd -

echo "Setting /bin/zsh as the default shell for user $USER..."
chsh -s /bin/zsh $USER
