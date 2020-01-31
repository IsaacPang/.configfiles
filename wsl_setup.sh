# Update apt and upgrade
sudo apt update && sudo apt upgrade -y

# Install updated vim, neovim, node and yarn then cleanup
sudo apt install vim-gtk neovim nodejs yarn -y
sudo apt autoremove -y

# Check for drive D: in Windows filesystem then create symlink in WSL home (~)
if [ -f /mnt/d ]
then
  mkdir /mnt/d/WSL\ Projects
  cd ~ && ln -s /mnt/d/WSL\ Projects
else
  mkdir /mnt/c/WSL\ Projects
  cd ~ && ln -s /mnt/c/WSL\ Projects
fi

# Install vim-plug for vim and neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# Get latest dotfiles
curl -fLo ~/.bashrc \
    https://raw.githubusercontent.com/IsaacPang/.configfiles/master/.bashrc
curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/IsaacPang/.configfiles/master/.vimrc
curl -fLo ~/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/IsaacPang/.configfiles/master/.config/nvim/init.vim

# Install required libraries for spyder
sudo apt-get install qtbase5-dev -y
