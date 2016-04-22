wuman's vimrc
=============

Author: David Wu <david@wu-man.com> <http://blog.wu-man.com>


SCREENSHOTS
-----------

![screenshot1](http://4.bp.blogspot.com/-DjPEWTxfjvc/UDTFh7wzoZI/AAAAAAAAaik/clKhXIgT7JA/s1600/Screen+Shot+2012-08-22+at+7.40.52+PM.png)


INSTALLATION
------------

Use curl (for Mac OS X):

    curl -o - https://raw.github.com/wuman/vimrc/master/auto-install.sh | sh

or wget (for most UNIX platforms):

    wget --quiet -O - https://raw.github.com/wuman/vimrc/master/auto-install.sh | sh

You should also create your own custom excludes list to ignore tags:

    git config --global core.excludesfile '~/.gitexcludes'
    echo tags > ~/.gitexcludes

### Mandatory Customized Plugin Installations ###

#### Pathogen ####

Starting in Ubuntu 10.04 there is a [bug](https://bugs.launchpad.net/ubuntu/+source/vim/+bug/572627)
which prevents filetypes from being detected correctly.  In order to workaround
the problem, simply comment out the `syntax on` line in `/etc/vim/vimrc`.

#### vim-autoformat ####

Install the following external formatting programs to enable vim-autoformat:

    npm install -g js-beautify
    brew install astyle
    brew install tidy-html5

#### syntastic ####

Install the following external checkers:

    # enable json validation
    npm install -g jsonlint
    # eslint for javascript + jsx + react
    npm install -g eslint eslint-plugin-react

Ensure that a `.eslintrc` file similar to the one below is present in either
the project directory or the home directory:

    {
        "extends": "eslint:recommended",
        "parserOptions": {
            "ecmaVersion": 6,
            "ecmaFeatures": {
                "jsx": true
            },
            "sourceType": "module"
        },
        "env": {
            "browser": true,
            "node": true
        },
        "plugins": [
            "react"
        ],
        "rules": {
            "no-console": 0,
            "strict": 0,
            "quotes": [2, "single"],
            "jsx-quotes": 1,
            "react/jsx-no-undef": 1,
            "react/jsx-uses-react": 1,
            "react/jsx-uses-vars": 1
        }
    }

#### vim-go ####

Install the tools used by vim-go in vim:

    :GoInstallBinaries

#### YouCompleteMe ####

YouCompleteMe is a powerful auto-completion plugin that augments OmniCompletion.
The installation for this plugin is quite involved, but definitely worth the effort.

More detailed instructions for platforms other than Mac OS X can be found at
https://github.com/Valloric/YouCompleteMe#installation.

    # ensure nodejs and npm are both installed for tern-completer
    # ensure go is installed for gocode-completer
    npm install -g typescript # optional
    brew install cmake # needed to build
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer --gocode-completer --tern-completer

Make sure that a global ``.tern-config`` file is added to the home directory,
which should conform to http://ternjs.net/doc/manual.html#configuration.  Mine
looks something like this:

    {
        "libs": ["browser", "jquery", "underscore"]
    }


UPDATES
-------

Occasionally I will update my vimrc settings. If you had previously installed my
vimrc settings and wish to pull new changes from my repo, or if you wish to pull
in new changes from plugin submodules, run the following script:

    ~/.vim/update-vimrc.sh


PRE-INSTALLED PLUGINS
---------------------

* [vim-colorschemes][]: a collection of colorschemes for vim
* [vim-go][]: a suite of tools for golang
* [vim-autoformat][]: code formatting
* [vim-javascript][]: syntax highlighting and indenting for javascript
* [vim-json][]: keyword highlighting and various customizations for json
* [vim-jsx][]: syntax highlighting and indenting for JSX
* [vim-node][]: tools and environment for developing with node.js in vim
* [vim-jade][]: syntax highlighting for jade templates
* [YouCompleteMe][]: powerful code-completion engine for vim that augments omni completion
* [vim-nodejs-complete][]: omni completion for node.js
* [pythoncomplete][]: omni completion for python
* [javacomplete][]: omni completion for java
* [OmniCppComplete][]: omni completion for c and c++
* [auto-pairs][]: automatically closes quotes, parenthesis, brackets, etc.
* [vim-surround][]: shortcut for adding/changing/removing surroundings in pairs
* [Tabular][]: text filtering and alignment
* [emmet-vim][]: html/xml abbreviation expansion
* [vim-snipmate][] fork: snippet insertion like TextMate
* [vim-snippets][] (formerly SnipMate-snippets): snipmate snippets for common programming languages
* [bootstrap-snippets][]: snipmate snippet for Twitter Bootstrap
* [snipmate-nodejs][]: snipmate snippet for node.js
* [vim-react-snippets][]: snipmate snippet for react
* [vim-airline][]: customized status/tabline for vim
* [vim-airline-themes][]: a collection of themes for vim-airline
* [tmuxline][]: tmux statusline generator
* [vim-tmux-navigator][]: navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
* [vim-signify][]: shows vcs diff in the gutter area
* [syntastic][]: syntax checking for most programming languages
* [ctrlp.vim][]: TextMate-like fuzzy files and buffers opener
* [indent-motion][]: quickly jump to beginning or end of current indent-delimited block
* [NERDTree][]: file tree explorer
* [NERDCommenter][]: easy commenting
* [xmledit][]: auto-close xml/html tags
* EasyMotion


PLUGIN INSTALLATION
-------------------

To add a new plugin:

    cd ~/.vim
    git submodule add [GIT_REPOSITORY_URL] bundle/[PLUGIN_NAME]


CREDITS
-------

My vimrc settings are based extensively on the following:

+ [vgod's vimrc](https://github.com/vgod/vimrc)
+ [Amir Salihefendic's vimrc](http://amix.dk/vim/vimrc.html)
+ spf13's ultimate vim distribution [spf13-vim](https://github.com/spf13/spf13-vim/blob/master/.vimrc)
+ [Paul Rouget's vimrc](http://paulrouget.com/e/myconf/)

[vim-colorschemes]: https://github.com/flazz/vim-colorschemes
[vim-json]: https://github.com/elzr/vim-json
[vim-jsx]: https://github.com/mxw/vim-jsx
[vim-node]: https://github.com/moll/vim-node
[vim-jade]: https://github.com/digitaltoad/vim-jade
[vim-go]: https://github.com/fatih/vim-go.git
[vim-autoformat]: https://github.com/Chiel92/vim-autoformat.git
[vim-javascript]: https://github.com/pangloss/vim-javascript
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[vim-nodejs-complete]: https://github.com/myhere/vim-nodejs-complete
[pythoncomplete]: https://github.com/vim-scripts/pythoncomplete
[javacomplete]: https://github.com/vim-scripts/javacomplete
[OmniCppComplete]: https://github.com/vim-scripts/OmniCppComplete
[auto-pairs]: https://github.com/jiangmiao/auto-pairs
[vim-surround]: https://github.com/tpope/vim-surround
[Tabular]: https://github.com/godlygeek/tabular
[emmet-vim]: https://github.com/mattn/emmet-vim
[vim-snipmate]: https://github.com/garbas/vim-snipmate
[vim-snippets]: https://github.com/honza/vim-snippets
[bootstrap-snippets]: https://github.com/bonsaiben/bootstrap-snippets
[snipmate-nodejs]: https://github.com/jamescarr/snipmate-nodejs
[vim-react-snippets]: https://github.com/justinj/vim-react-snippets
[vim-airline]: https://github.com/bling/vim-airline
[vim-airline-themes]: https://github.com/vim-airline/vim-airline-themes
[tmuxline]: https://github.com/edkolev/tmuxline.vim
[vim-tmux-navigator]: https://github.com/christoomey/vim-tmux-navigator
[vim-signify]: https://github.com/mhinz/vim-signify
[syntastic]: https://github.com/scrooloose/syntastic
[ctrlp.vim]: https://github.com/kien/ctrlp.vim
[indent-motion]: https://github.com/tmhedberg/indent-motion
[NERDTree]: https://github.com/scrooloose/nerdtree
[NERDCommenter]: https://github.com/scrooloose/nerdcommenter
[xmledit]: https://github.com/sukima/xmledit


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/wuman/vimrc/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

