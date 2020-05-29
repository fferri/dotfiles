#!/bin/sh

cd $HOME

if [ ! -d .dotfiles ]; then
    echo error: $HOMNE/.dotfiles does not exist 1>&2
    exit 1
fi

sudo apt install zsh git vim vim-gtk3 terminator wget curl

git config --global user.email "federico.ferri.it@gmail.com"
git config --global user.name "Federico Ferri"

if [ ! -d .oh-my-zsh ]; then
    RUNZSH=no sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d .oh-my-zsh/custom/themes/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k
fi

if [ ! -d .zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions .zsh-autosuggestions
fi

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

mkdir -p .vimswap
mkdir -p .vimbackup

if [ ! -f .vim/autoload/plug.vim ]; then
    curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

backup_file .vimrc
ln -s .dotfiles/.vimrc

backup_file .gvimrc
ln -s .dotfiles/.gvimrc

vim +PlugInstall +qall

mkdir -p .fonts
cd .fonts
for i in 'Regular' 'Bold' 'Italic' 'Bold Italic'; do
    if [ ! -f "MesloLGS NF $i.ttf" ]; then
        wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF ${i}.ttf"
    fi
done
fc-cache -f -v
cd -
