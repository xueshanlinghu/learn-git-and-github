@ echo off
REM 本文件撰写者：雪山凌狐
REM 版本号：V1.0
REM 时间：20170318
REM 功能：自动把项目文件夹文件加入暂存并提交
REM 文件编码：Utf-8无BOM格式编码

echo ----------------------git status before----------------------
git status
Echo.
echo ----------------------git add file---------------------------
git add .
Echo.
echo ----------------------git status now-------------------------
git status
Echo.
echo --set commit message(you can type quit to stop the bat)------
set /p commit_message=Please leave the message to commit:
if %commit_message% == "quit" goto end
if %commit_message% == "" set commit_message="no message update"
set msg1=your commit message is:
set msg2=-------
Echo.
echo %msg2%%msg1%%commit_message%%msg2%
git commit -m %commit_message%
Echo.
echo ----------------------commit done----------------------------


REM end
Echo.
echo --------------------We stop the bat now----------------------