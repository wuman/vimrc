wuman's vimrc
=============

Author: David Wu <david@wu-man.com>


REFERENCE
---------

My vimrc settings are based extensively on the following:

+ [vgod's vimrc](https://github.com/vgod/vimrc)
+ [Amir Salihefendic's vimrc](http://amix.dk/vim/vimrc.html)
+ spf13's ultimate vim distribution [spf13-vim](https://github.com/spf13/spf13-vim/blob/master/.vimrc)


INSTALLATION
------------

Use curl (for Mac OS X):

    curl -o - https://raw.github.com/wuman/vimrc/master/auto-install.sh | sh

or wget (for most UNIX platforms):

    wget -O - https://raw.github.com/wuman/vimrc/master/auto-install.sh | sh

You should also create your own custom excludes list to ignore tags:

    git config --global core.excludesfile '~/.gitexcludes'
    echo tags > ~/.gitexcludes

### Mandatory Customized Plugin Installations ###

#### jsruntime.vim ####

A Javascript interpreter must be installed.

For Ubuntu 32-bit, just use the built-in PyV8:

    sudo ln -s ~/.vim/bundle/jsruntime/plugin/jsruntime/PyV8/libboost_python.so.1.50.0 /usr/lib

For Ubuntu 64-bit, install node.js:

    sudo apt-get install nodejs


#### Command-T ####

* Ensure that the installed vim is compiled with +ruby.

* You will need to build the C extension for the Command-T plugin:

        sudo apt-get install ruby-dev       # only needed for Ubuntu
        cd ~/.vim/bundle/command-t/ruby/command-t
        ruby extconf.rb
        make


UPDATES
-------

Occasionally I will update my vimrc settings. If you had previously installed my
vimrc settings and wish to pull new changes from my repo, or if you wish to pull
in new changes from plugin submodules, run the following script:

    ~/.vim/update-vimrc.sh


PRE-INSTALLED PLUGINS
---------------------

* jsruntime.vim
* jsoncodecs
* vim-json-bundle
* sourcebeautify
* vim-javascript
* pythoncomplete
* AutoClose by Thiao Alves
* vim-surround
* SuperTab-continued.
* javacomplete
* OmniCppComplete
* SnipMate
* vim-powerline
* NERDTree
* NERDCommenter
* Command-T
* EasyMotion
* Indent-Motion
* ZenCoding


PLUGIN INSTALLATION
-------------------

To add a new plugin:

    cd ~/.vim
    git submodule add [GIT_REPOSITORY_URL] bundle/[PLUGIN_NAME]

