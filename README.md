vim-git
=======

This is my customization of fugitive, a git integration system for VIM.

(Note that in windows you have to change ~/.vim to be ~\vimfiles.)

This requires:

1/  Pathogen:  https://github.com/tpope/vim-pathogen

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

Modify your ~/.vimrc to contain:

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

2/  Fugitive: https://github.com/tpope/vim-fugitive

cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git


3/  Vundle - https://github.com/gmarik/vundle

$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Add the following to your ~/.vimrc

call vundle#rc()
Bundle 'mchughj/vim-git'

The final step is to call :BundleInstall!  This will fetch and update the
bundles under control of Vundle.

--

Restart vim and type 

:help git 

As a starting point for how to use this plugin.

Feel free to fork or provide changes to this plugin.  

