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