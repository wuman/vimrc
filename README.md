wuman's vimrc
=============

Author: David Wu <david@wu-man.com> <http://blog.wu-man.com>


REFERENCE
---------

My vimrc settings are based extensively on the following:

+ [vgod's vimrc](https://github.com/vgod/vimrc)
+ [Amir Salihefendic's vimrc](http://amix.dk/vim/vimrc.html)
+ spf13's ultimate vim distribution [spf13-vim](https://github.com/spf13/spf13-vim/blob/master/.vimrc)


SCREENSHOTS
-----------

![screenshot1](http://4.bp.blogspot.com/-DjPEWTxfjvc/UDTFh7wzoZI/AAAAAAAAaik/clKhXIgT7JA/s1600/Screen+Shot+2012-08-22+at+7.40.52+PM.png)


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

#### Pathogen ####

Starting in Ubuntu 10.04 there is a [bug](https://bugs.launchpad.net/ubuntu/+source/vim/+bug/572627)
which prevents filetypes from being detected correctly.  In order to workaround
the problem, simply comment out the `syntax on` line in `/etc/vim/vimrc`.


#### jsruntime.vim ####

A Javascript interpreter must be installed.

For Ubuntu 32-bit, just use the built-in PyV8:

    sudo ln -s ~/.vim/bundle/jsruntime/plugin/jsruntime/PyV8/libboost_python.so.1.50.0 /usr/lib

For Ubuntu 64-bit, install node.js:

    sudo apt-get install nodejs


#### Command-T ####

* Ensure that the installed vim is compiled with +ruby.

  On Ubuntu you can do that by simply installing vim-nox:

        sudo apt-get install vim-nox

  On Mac OS X, you may want to build and install your own version of vim:

        # download the latest source code
        hg clone https://code.google.com/p/vim/
        # build and install vim
        cd vim
        ./configure --prefix=/usr/local --enable-rubyinterp --enable-gui=no
        make
        sudo make install
        # delete the source files
        cd ..
        rm -rf ./vim
        # then add /usr/local/bin to your $PATH

* You will need to build the C extension for the Command-T plugin:

        sudo apt-get install ruby-dev       # only needed for Ubuntu
        cd ~/.vim/bundle/command-t/ruby/command-t
        ruby extconf.rb
        make # or rake make for Mac


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
* vim-json
* sourcebeautify
* vim-javascript
* pythoncomplete
* AutoClose by Thiao Alves
* vim-surround
* SuperTab-continued.
* javacomplete
* OmniCppComplete
* SnipMate
* vim-snippets (formerly SnipMate-snippets)
* bootstrap-snippets
* vim-powerline
* NERDTree
* NERDCommenter
* Command-T
* EasyMotion
* Indent-Motion
* xmledit
* vim-golang


PLUGIN INSTALLATION
-------------------

To add a new plugin:

    cd ~/.vim
    git submodule add [GIT_REPOSITORY_URL] bundle/[PLUGIN_NAME]



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/wuman/vimrc/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

