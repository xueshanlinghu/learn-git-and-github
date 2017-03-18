REM 本文件撰写者：雪山凌狐
REM 版本号：V1.0
REM 时间：20170318
REM 功能：自动把项目文件夹文件加入暂存并提交
REM 文件编码：Utf-8无BOM格式编码

@ echo off
echo ----------------------git status before----------------------
git status
echo ----------------------git add file---------------------------
git add .
echo ----------------------git status now-------------------------
git status
echo --set commit message(you can type Ctrl+C to stop the bat-----
set /p commit_message=Please leave the message to commit:
set msg1=your commit message is:
set msg2=-------
echo %msg2%%msg1%%commit_message%%msg2%
git commit -m %commit_message%
echo ----------------------commit done----------------------------