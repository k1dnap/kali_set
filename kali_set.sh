#!/bin/bash

# 初始配置脚本 for Kali Linux

# 更换更新源为清华源
echo "更换更新源为清华源..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup   # 备份原有源列表
echo "deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list    # 添加清华源

# 更新系统
echo "更新系统..."
sudo apt update && sudo apt upgrade -y

# 安装常用工具
echo "安装常用工具..."
sudo apt install -y vim git wget curl net-tools nmap

# 将锁屏时间设置为“从不”
echo "将锁屏时间设置为从不..."
gsettings set org.gnome.desktop.session idle-delay 0

# 配置SSH服务
echo "配置SSH服务..."
sudo systemctl enable ssh    # 开机自启动SSH服务
sudo systemctl start ssh     # 启动SSH服务

# 更新 pip 源为清华源
echo "更新 pip 源为清华源..."
mkdir -p ~/.pip
echo -e "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > ~/.pip/pip.conf

# 更新 Python 并安装网络安全测试库
echo "更新 Python 并安装网络安全测试库..."
sudo apt install -y python3 python3-pip
pip3 install -U pip
pip3 install -U setuptools
pip3 install -U wheel
pip3 install -U scapy python-nmap paramiko requests bs4 lxml pwntools

# Vim 配置
echo "配置 Vim..."
echo 'set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936' >> ~/.vimrc
echo 'set termencoding=utf-8' >> ~/.vimrc
echo 'set encoding=utf-8' >> ~/.vimrc
echo 'set nocompatible' >> ~/.vimrc
echo 'set number' >> ~/.vimrc
echo 'set guioptions-=r' >> ~/.vimrc
echo 'set guioptions-=L' >> ~/.vimrc
echo 'set guioptions-=b' >> ~/.vimrc
echo 'set showtabline=0' >> ~/.vimrc
echo 'set guifont=Monaco:h13' >> ~/.vimrc
echo 'syntax on' >> ~/.vimrc
echo 'let g:solarized_termcolors=256' >> ~/.vimrc
echo 'set background=dark' >> ~/.vimrc
echo 'set nowrap' >> ~/.vimrc
echo 'set fileformat=unix' >> ~/.vimrc
echo 'set cindent' >> ~/.vimrc
echo 'set tabstop=4' >> ~/.vimrc
echo 'set shiftwidth=4' >> ~/.vimrc
echo 'set showmatch' >> ~/.vimrc
echo 'set scrolloff=5' >> ~/.vimrc
echo 'set laststatus=2' >> ~/.vimrc
echo 'set fenc=utf-8' >> ~/.vimrc
echo 'set backspace=2' >> ~/.vimrc
echo 'set mouse=a' >> ~/.vimrc
echo 'set selection=exclusive' >> ~/.vimrc
echo 'set selectmode=mouse,key' >> ~/.vimrc
echo 'set matchtime=5' >> ~/.vimrc
echo 'set ignorecase' >> ~/.vimrc
echo 'set incsearch' >> ~/.vimrc
echo 'set hlsearch' >> ~/.vimrc
echo 'set noexpandtab' >> ~/.vimrc
echo 'set whichwrap+=<,>,h,l' >> ~/.vimrc
echo 'set autoread' >> ~/.vimrc
echo 'set cursorline' >> ~/.vimrc
echo 'set cursorcolumn' >> ~/.vimrc
echo 'filetype off' >> ~/.vimrc
echo 'set rtp+=~/.vim/bundle/Vundle.vim' >> ~/.vimrc
echo 'call vundle#begin()' >> ~/.vimrc
echo 'Plugin "VundleVim/Vundle.vim"' >> ~/.vimrc
echo 'Plugin "Lokaltog/vim-powerline"' >> ~/.vimrc
echo 'Plugin "scrooloose/nerdtree"' >> ~/.vimrc
echo 'Plugin "Yggdroot/indentLine"' >> ~/.vimrc
echo 'Plugin "jiangmiao/auto-pairs"' >> ~/.vimrc
echo 'Plugin "tell-k/vim-autopep8"' >> ~/.vimrc
echo 'Plugin "scrooloose/nerdcommenter"' >> ~/.vimrc
echo 'call vundle#end()' >> ~/.vimrc
echo 'filetype plugin indent on' >> ~/.vimrc
echo 'map <F2> :NERDTreeToggle<CR>' >> ~/.vimrc
echo 'let NERDTreeChDirMode=1' >> ~/.vimrc
echo 'let NERDTreeShowBookmarks=1' >> ~/.vimrc
echo 'let NERDTreeIgnore=["~$", "\\.pyc$", "\\.swp$"]' >> ~/.vimrc
echo 'let NERDTreeWinSize=25' >> ~/.vimrc
echo 'let g:indentLine_char="┆"' >> ~/.vimrc
echo 'let g:indentLine_enabled = 1' >> ~/.vimrc
echo 'let g:autopep8_disable_show_diff=1' >> ~/.vimrc
echo 'let mapleader=","' >> ~/.vimrc
echo 'map <F4> <leader>ci <CR>' >> ~/.vimrc

# 完成
echo "初始配置完成！"
