@echo off
set timestart=%time%
set timestarthour=%time:~0,2%
set timestartminute=%time:~3,2%
set timestartsecend=%time:~6,2%
echo ��ʼʱ����%timestart%
set /a timestartbegin=%timestarthour%*3600+%timestartminute%*60+%timestartsecend%
echo timestartbegin%timestartbegin%
:start
set timeend=%time%
set timeendhour=%time:~0,2%
set timeendminute=%time:~3,2%
set timeendsecend=%time:~6,2%
echo ��ֹʱ����%timeend%
set /a timeendfin=%timeendhour%*3600+%timeendminute%*60+%timeendsecend%
echo timeendfin%timeendfin%
set /a timelast=%timeendfin%-%timestartbegin%
echo ����%timelast%��
pause
goto start