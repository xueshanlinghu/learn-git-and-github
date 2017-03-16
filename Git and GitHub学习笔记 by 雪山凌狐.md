本文件为雪山凌狐个人学习Git与GitHub的学习笔记，可以自由分享学习
======================================

欢迎关注我的个人主页：[雪山凌狐教程](http://www.xueshanlinghu.com)
-----------------------------------

![logo](/images/logo.png "雪山凌狐教程网站logo")

本文件使用markdown格式也就是md文件格式编写而成，如果你要在本地看到在GitHub的效果，请到[atom.io](http://atom.io)安装Atom，然后打开这个md文件后按快捷键Ctrl+Shift+M即可调出GitHub一样的效果预览。

本文件的知识点可能不是很按顺序，因为中途会插入一些小东西刚学到的进去，如果有必要，可以使用搜索功能。

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

命令：

    git diff --stat

可以只锁定文件间的变化

`这真是一个伟大的命令，用好diff你就可以很好的管理你的项目变化了`


### 让git显示中文
使用中文的同学们通常会遇到这种痛楚，查看不同（diff）或者提交查看缓存区域的文件的时候，通常都会看到中文的内容或者文件名呈现乱码的形态，这里如何让git支持中文呢？

输入命令：

    git config --global core.quotepath false

来告诉git不对0x80 以上的字符进行转义

官方说明：
The commands that output paths (e.g. ls-files, diff), when not given the -z option, will quote “unusual” characters in the pathname by enclosing the pathname in a double-quote pair and with backslashes the same way strings in C source code are quoted. If this variable is set to false, the bytes higher than 0x80 are not quoted but output as verbatim. Note that double quote, backslash and control characters are always quoted without -z regardless of the setting of this variable.

### 向GitHub上传本地的项目
不得不说在这一块的知识上，我走了好些个弯路，测试了挺久的才完成更新上传覆盖的功能。

感谢一些网友的大力支持，以及廖雪峰git教程的知识让我有所进步。

在这里把一些比较常用的命令弄出来好了，方便自己，方便他人。

首先你需要先把本地的项目文件夹commit到要上传的版本。

然后到C:\Users\Administrator\目录下看是否存在.ssh文件夹，如果存在则先删除。

输入命令：

    ssh-keygen -t rsa -C "xueshanlinghu@xueshanlinghu.com"

请注意这里把上面的邮箱改成你自己的。

然后一路回车即可，因为不是什么军事目的，没必要按着提示输入密码啥的。结束后会在刚才说的C:\Users\Administrator\目录下生成.ssh文件夹，打开会有id_rsa和id_rsa.pub两个文件，第一个是私钥，不能告诉别人的，第二个是公钥，可以告诉别人。用记事本把后面那个公钥打开，在GitHub后台设置选择SSH and GPG keys，然后添加公钥进去，title你随意。

这时候可以新建一个repo在云端，或者你已经有一个建好的也行。点击右边Clone or download按钮，点击Use SSH，复制地址下来，比如我的复制下来是这样子：

    git@github.com:xueshanlinghu/learn-git-and-github.git

这就是你的push地址。

接着添加命令：

    git remote add origin git@github.com:xueshanlinghu/learn-git-and-github.git

这里就是连接你的远程仓库，命名为origin（你可以自己换名字）

如果这一步出错，提示fatal: remote origin already exists.
那么先输入这一句代码：

    git remote rm origin

再运行刚才的连接。

第一次连接的时候会有这样的警告：

    The authenticity of host 'github.com (xx.xx.xx.xx)' can't be established.
    RSA key fingerprint is xx.xx.xx.xx.xx.
    Are you sure you want to continue connecting (yes/no)?

不用担心，输入yes回车就行，以后不会再出现了。

连接成功后，输入如下代码进行push：

    git push -u origin master

请注意这适用于第一次推送！！！也就是云端的repo文件夹还没有东西的时候，如果已经有东西，会报错，推送不成功。这个问题，找寻许久终于解决。如果云端已经有东西，你需要覆盖云端的内容的话，请使用如下命令：

    git push origin master

这是才推送成功，比如出现类似这样的输出信息表示推送成功：

    Counting objects: 4, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (4/4), 576 bytes | 0 bytes/s, done.
    Total 4 (delta 3), reused 0 (delta 0)
    remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
    To github.com:xueshanlinghu/learn-git-and-github.git
       e4afef1..334e8b4  master -> master

这时候你就可以登录云端的GitHub网页看看情况啦~

这是我总结的，希望能对大家有所帮助！

### 克隆一个云端项目到本地
先有鸡还是先有蛋，这是一个问题。有的时候咱们是先有了云端的文件，或者Fork了一个别人的东西到自己的云端仓库，但是要弄到本地来搞一搞的时候，克隆就很重要了。

如何克隆呢？

首先需要到云端获取一个地址，https的SSH的应该都可以，个人使用的话几乎没啥区别。

然后输入命令：

    git clone git@github.com:xueshanlinghu/learn-git-and-github.git

就会把这个项目克隆到本地了，git@github.com:xueshanlinghu/learn-git-and-github.git是我的项目地址，你可以换成你的，会自动生成一个叫做learn-git-and-github的文件夹来存放。如果你想要自己命名一个文件夹存放，在后面空格之后输入你的命名即可：

    git clone git@github.com:xueshanlinghu/learn-git-and-github.git test

这样就会克隆到本地一个叫做test的文件夹下。
