@echo off
:start
set /a b=%random%
set /a c=%random%
echo %b%+%c%=?
set /a d=%b%+%c%
set /p jieguo=������𰸣�
if  /i %jieguo%==%d% echo �ش���ȷ
if  /i not %jieguo%==%d% echo ��ȷ����%d%
goto start