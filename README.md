neovim除了init.lua配置文件外，还需要的后端配置包括：
1. nodejs+npm
2. npm+ci，在coc.nvim文件夹
3. rust
4. cargo texlab
5. cargo treesitter-cli(貌似？)
6. python+debugpy


emacs的配置基本依靠init.el就足够了，除了lean4的package需要单独下载

总体来说
emacs配置比较简单，一个配置文档足以通过elisp编制的插件完成编辑器设置;虽然用了evil，但操作上还是比较需要依赖ctrl键，按键比较蛋疼。
neovim配置的后端依赖比较多，配置起来比较麻烦，但胜在键盘映射更方便，手指操作比较舒服;配置完成后coc的补全很智能，treesitter的高亮配置的很好，彩虹括号也很清晰
