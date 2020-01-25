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
