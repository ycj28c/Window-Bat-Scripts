@echo off
:start
set /a b=%random%
set /a c=%random%
echo %b%+%c%=?
set /a d=%b%+%c%
set /p jieguo=请输入答案：
if  /i %jieguo%==%d% echo 回答正确
if  /i not %jieguo%==%d% echo 正确答案是%d%
goto start