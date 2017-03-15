本文件为雪山凌狐个人学习Git与GitHub的学习笔记，可以自由分享学习
======================================

欢迎关注我的个人主页：[雪山凌狐教程](http：//www.xueshanlinghu.com)
-----------------------------------
[![logo]](http://www.xueshanlinghu.com)
[logo]: /images/logo.png "雪山凌狐教程网站logo"

本文件使用markdown格式也就是md文件格式编写而成，如果你要在本地看到在GitHub的效果，请到[atom.io](http://atom.io)安装Atom，然后打开这个md文件后按快捷键Ctrl+Shift+M即可调出GitHub一样的效果预览。

首先使用git内置的命令提示符或者使用系统自带的命令提示符工具进入你要操作的文件夹下，比如我现在使用系统自带的CMD已经进入了如下目录：C:\Users\Administrator\Desktop\mygitproject>

### 初始化项目
命令：

    git init learn-git

在当前目录下创建一个叫做learn-git的文件夹并且进行初始化，生成.git文件夹。这个文件夹里面保存的是所有你未来版本控制的修改，请不要随意去改动里面的内容，使用其他方式进行版本控制即可。该文件夹是一个隐藏文件夹，到系统查看处显示所有隐藏文件和文件夹即可看到。这个文件夹里面的内容在本地和GitHub上面都可以进行控制修改。
如果是没有写learn-git，那么就会在当前文件夹下初始化.git了。

### 在GitHub上创建文件夹
登录GitHub，注册一个账号并登录，然后找到Repositories，点击New，输入你的文件夹名字（只需要跟你自己的其他项目文件夹不重名即可），输入描述信息（选填），选择是公开的（Public）还是私有的（Private）。然后选择是否需要帮你初始化一个README文件，这个文件可以让别人打开你的项目文件夹的时候能看到。还可以选择一种.gitignore文件来指定是否在本地和网络库推送的时候忽略某些文件或者文件夹，选择一个license可以声明下你的这个项目文件夹的授权证书，一般的，选择MIT证书，允许他人自由使用的证书即可。

### 设置你的名字和邮箱
要保证你的项目的产权，你需要提前设置下你的账户的用户名和邮箱，这个通常只需要设置一次全局就好。
命令：

    git config --global user.name xueshanlinghu

这里的xueshanlinghu换成你自己的名字

    git config --global user.email xueshanlinghu@xueshanlinghu.com

这里的xueshanlinghu@xueshanlinghu.com换成你自己的邮箱
使用命令：

    git config --global user.name
    git config --global user.email

可以查看是否设置成功
如果上面的命令我们用--local替代--global，那么全局设置将会被本地设置所取代，local的层级更高。比global更低一个层级的命令是system。会被local和global的设置所取代。

### 其他全局设置
命令：

    git config

可以查看其他设置命令
命令：

    git config --global core.autocrlf true

签出时将换行符转换成CRLF，签入时转换回 LF。

    git config --global core.autocrlf input

签出时不转换换行符，签入时转换回 LF

    git config --global core.autocrlf false

签出签入均不转换
作用主要用于跨平台写作的时候换行符和回车符等问题。详细解释参见：[http://blog.csdn.net/wty__/article/details/53997786](http://blog.csdn.net/wty__/article/details/53997786)

命令：

    git config --global color.ui auto

应该是自动设置颜色，让我们看起来爽一点，印象中默认就是自动颜色了

### Diff
你离开电脑一会儿（上个厕所什么的），回来的时候忘了刚才写了啥了，嗯，有这个可能的，你需要的东西就是Diff。
如果你只修改了几个字就提交（commit），那么通常来讲你能记住发生了什么，但是通常你需要校验一下内容发生了怎样的改变。
有三种主要方式来使用Diff。
命令：

    git diff

就可以查看做出了哪些修改。
命令：

    git diff --staged

查看之前已经提交的跟暂存区域的内容有何不同。
命令：

    git diff HEAD

将工作树和头一次提交相比较
命令：

    git diff --color-words 或者 git diff --word-diff

只显示单词的变化，这样对于长长的一整行的修改有

### 让git显示中文
使用中文的同学们通常会遇到这种痛楚，查看不同（diff）或者提交查看缓存区域的文件的时候，通常都会看到中文的内容或者文件名呈现乱码的形态，这里如何让git支持中文呢？
输入命令：

    git config --global core.quotepath false

来告诉git不对0x80 以上的字符进行转义

官方说明：
The commands that output paths (e.g. ls-files, diff), when not given the -z option, will quote “unusual” characters in the pathname by enclosing the pathname in a double-quote pair and with backslashes the same way strings in C source code are quoted. If this variable is set to false, the bytes higher than 0x80 are not quoted but output as verbatim. Note that double quote, backslash and control characters are always quoted without -z regardless of the setting of this variable.
