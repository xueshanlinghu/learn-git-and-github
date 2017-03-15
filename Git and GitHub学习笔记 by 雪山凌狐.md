# 本文件为雪山凌狐个人学习Git与GitHub的学习笔记，可以自由分享学习

首先使用git内置的命令提示符或者使用系统自带的命令提示符工具进入你要操作的文件夹下，比如我现在使用系统自带的CMD已经进入了如下目录：C:\Users\Administrator\Desktop\mygitproject>

# 初始化项目
命令：
git init learn-git
在当前目录下创建一个叫做learn-git的文件夹并且进行初始化，生成.git文件夹。这个文件夹里面保存的是所有你未来版本控制的修改，请不要随意去改动里面的内容，使用其他方式进行版本控制即可。该文件夹是一个隐藏文件夹，到系统查看处显示所有隐藏文件和文件夹即可看到。这个文件夹里面的内容在本地和GitHub上面都可以进行控制修改。
如果是没有写learn-git，那么就会在当前文件夹下初始化.git了。

# 在GitHub上创建文件夹
登录GitHub，注册一个账号并登录，然后找到Repositories，点击New，输入你的文件夹名字（只需要跟你自己的其他项目文件夹不重名即可），输入描述信息（选填），选择是公开的（Public）还是私有的（Private）。然后选择是否需要帮你初始化一个README文件，这个文件可以让别人打开你的项目文件夹的时候能看到。还可以选择一种.gitignore文件来指定是否在本地和网络库推送的时候忽略某些文件或者文件夹，选择一个license可以声明下你的这个项目文件夹的授权证书，一般的，选择MIT证书，允许他人自由使用的证书即可。

# 设置你的名字和邮箱
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

# 其他全局设置
命令：
git config
可以查看其他设置命令
命令：
git config --global core.autocrlf true
另外还有一条命令：
git config --global core.autocrlf input
作用主要用于跨平台写作的时候换行符和回车符等问题。详细解释参见：http://blog.csdn.net/lysc_forever/article/details/42835203
命令：
git config --global color.ui auto
应该是自动设置颜色，让我们看起来爽一点，印象中默认就是自动颜色了

# Diff
你离开电脑一会儿（上个厕所什么的），回来的时候忘了刚才写了啥了，嗯，有这个可能的，你需要的东西就是Diff。
如果你只修改了几个字就提交（commit），那么通常来讲你能记住发生了什么，但是通常你需要校验一下内容发生了怎样的改变。
有三种主要方式来使用Diff。
命令：
git diff
就可以查看做出了哪些修改。
