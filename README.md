vim-git
=======

This is my customization of fugitive, a git integration system for VIM.

This is really quite simplistic.  It simply creates the common keyboard 
mappings that I use and expect. 

Although it may seem like a pain to use Vundle to install you will be happier
if you do.  See
  https://github.com/gmarik/vundle

Installing vundle is trivial on a reasonable system with access to git and curl.
The documentation for vundle is quite good and most people will be up and running 
with it in 5 minutes or less.  

The advantage of vundle is that it becomes trivial to manage vim plugins like
this one.  That includes getting updates and fixes.

Make sure that after you initialize Vundle in your .vimrc that you include
this line:

  Vundle 'mchughj/vim-git'

The final step is to call :BundleInstall!  This will fetch and update the
bundles under control of Vundle.  Restart vim and type 

:help git 

As a starting point for how to use this plugin.

Feel free to fork or provide changes to this plugin.  

