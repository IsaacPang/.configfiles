# .configfiles
The bare repository for config files.
This bare repository was created for the cross saving of linux and unix configuration dot files.

## How to start from scratch
First make sure github SSH is set up.
Then setup a bare repository.

[How to store dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

If you're running bash, the following is how to start:

    git init --bare $HOME/.cfg
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config config --local status.showUntrackedFiles no
    echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

Then ensure that a remote is setup

    $ config remote add origin https://github.com/user/repo.git
    # Set a new remote

    $ config remote -v
    # Verify new remote
    > origin  https://github.com/user/repo.git (fetch)
    > origin  https://github.com/user/repo.git (push)

Then start pushing to the remote
    
    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .bashrc
    config commit -m "Add bashrc"
    config push

## Install stored files to new system
Ensure that the `config` is aliased

    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    
Ensure source repository ignores the folder to prevent recursion issues

    echo ".cfg" >> .gitignore
    
The remote repository needs to be cloned into a "dot"

    git clone --bare <git-repo-url> $HOME/.cfg

Alias the `config` command in the current shell
    
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    
    config checkout
    
This might happen after the git checkout.
    
    error: The following untracked working tree files would be overwritten by checkout:
        .bashrc
        .gitignore
    Please move or remove them before you can switch branches.
    Aborting
    
The backup is required prior to checking out and overwriting existing profiles.
    
    mkdir -p .config-backup && \
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .config-backup/{}

The untracked files should be shown to prevent the `$HOME` folder files from showing up during `config status`

    config config --local status.showUntrackedFiles no

Dotfiles can be then updated as follows

    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .bashrc
    config commit -m "Add bashrc"
    config push
