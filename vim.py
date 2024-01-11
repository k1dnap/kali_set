
import os

# 安装vim插件
os.system("sudo apt-get install vim")

# 安装vim插件管理器
os.system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")

# 创建vim配置文件
vim_config = """
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" 添加Python语法高亮
syntax on
syntax region pythonStart      " 定义Python代码的开始和结束位置
syntax region python        " 定义Python代码的语法规则
syntax region pythonEnd       " 定义Python代码的结束位置

" 设置Python代码的默认主题
set background=dark
set number
set foldmethod=marker
set foldcolumn=0
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 设置Python代码的语法高亮
set syntax=python
set ft=python

" 应用配置
filetype plugin indent on
"""


with open('~/.vimrc', 'w') as f:
    f.write(vim_config)

# 安装YouCompleteMe插件
os.system("vim +PluginInstall +qall")
os.system("cd ~/.vim/bundle/YouCompleteMe && python3 install.py --clang-completer")

print("Vim setup complete!")
