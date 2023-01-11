# .vimrc backup

## How to use?
1. Install vim-plug
```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. Install powerline font
```shell
sudo apt install fonts-powerline
```

3. Install ctags
```shell
sudo apt install ctags
```

4. Update .vimrc
```shell
cp .vimrc ~/.vimrc
```

5. Install plugin
```shell
vim ~/.vimrc

:PlugInstall
```

## Plugin
1. NerdTree
- 点击F3打开目录树

2. taglist.vim
- ctrl + ] 跳转
- ctrl + t 返回

3. vim-gutentags
- 当前目录有文件变化时，自动生成tags(ctags)。
- PS：第一次使用，可自行vim一个新文件，然后删除。

4. vim-signify
- 侧边栏动态显示修改点。
- :SignifyDiff 对比当前文件的git修改。

5. nerdcommenter
- visual选中要注释的行
- ,cc 注释
- ,cs 多行注释
- ,cu 解除注释
- ,c<space> 自动注释或反注释

6. vim-airline
- 状态栏美化。
- 打开多个文件时，ctrl+n 切换下一个文件，ctrl+p 切换上一个文件。（上方有tabs显示）

7. LeaderF
- ,f 子目录下搜索文件名
- ,b buffer中搜索文件名
- :LeaderfFunction 搜索当前文件的函数名
- :LeaderfLine 搜索当前文件的单词