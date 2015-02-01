#!/bin/sh
#
# Script that downloads the necessary Vim plugins that are
# used from the .vimrc file.
#

# Dependencies:
# * vim (CentOS: yum install vim)
# * git (CentOS: yum install git)
# * wget (CentOS: already installed)
# * python2.x or python3.x
# * pip2.x or pip3.x (CentOS: yum install python-pip)
# * ctags (CentOS: yum install ctags | FreeBSD: cd /usr/ports/devel/ctags; make config-recursive; make install clean)

set -e

# Vim
mkdir -p ~/.vim

# Copy the vimrc of the repository to ~/.vimrc
cp vimrc ~/.vimrc

# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
cd ~/.vim/autoload; wget https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Starting installation of Vim plugins
cd ~/.vim/bundle

# MiniBufExplorer (use the updated fork)
git clone git://github.com/fholgado/minibufexpl.vim.git

# NERD tree (File manager)
git clone git://github.com/scrooloose/nerdtree.git

# Pydiction (Python Code Completion)
git clone git://github.com/rkulla/pydiction.git

# Syntastic (Syntax checker)
git clone git://github.com/scrooloose/syntastic.git
pip install flake8  # Pyflakes (Python syntax checker - used by Syntastic)

# Tag List (Source code browser)
# Dependencies: Exuberant Ctags (ctags)
git clone git://github.com/vim-scripts/taglist.vim.git

# Solarized colorscheme
git clone git://github.com/altercation/vim-colors-solarized.git

# vim-json (A better JSON support for Vim)
git clone git://github.com/elzr/vim-json.git

# vim-bundle-mako (A better Mako support for Vim)
git clone git://github.com/sophacles/vim-bundle-mako.git

# vim-html5 (HTML5 omnicompletion, indentation and syntax highlighting for Vim)
git clone git://github.com/othree/html5.vim.git
