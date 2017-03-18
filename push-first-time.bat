@ echo off
rem 本文件撰写者：雪山凌狐
rem 版本号：V1.0
rem 时间：20170318
rem 功能：自动把本地项目文件夹上传到云端GitHub，仅适用于第一次提交（只用一次，提交到云端空文件夹）
rem 文件编码：Utf-8无BOM格式编码
rem 本文件适用于已经在云端创建好云端repo，在本地建立好公钥私钥，在云端添加好公钥的朋友们
rem 使用方法：把文件里面的上传地址  git@github.com:xueshanlinghu/learn-git-and-github.git 改成你的即可

echo -------------------create remote origin----------------------
git remote rm origin
rem 这句代码的git@github.com:xueshanlinghu/learn-git-and-github.git改成你自己的远端地址哦~
git remote add origin git@github.com:xueshanlinghu/learn-git-and-github.git
echo.
echo --------------now we push the data to GitHub-----------------
git push -u origin master
git remote rm origin
echo.
echo ----------------------push done------------------------------