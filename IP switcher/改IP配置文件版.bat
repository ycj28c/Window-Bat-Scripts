@echo off
title ��IP�����ļ���   ----made by Ralph Yang
rem ��ʼ��
if exist config.txt goto start
echo ________________________________
echo.
echo �����ļ�������,��ʼ��config.txt
echo ________________________________&ping -n 3 127.1>nul
echo !�밴�չ涨��ʽ��д,�ö��Ÿ���,��ʽΪip,netmasks,gateway,dns1,dns2>>config.txt
echo !����191.4.8.4,255.255.255.0,191.4.8.254,219.239.8.9,219.239.8.7>>config.txt
echo !��������>>config.txt
goto start

:start
for /f "delims=!: tokens=1,2" %%a in ('findstr /n . config.txt') do if "%%a"=="3" set eth=%%b
cls
echo Ĭ�ϵ���������������"%eth%",�粻һ�����config.txt��3��
echo ..........................................................
echo.
echo Ŀǰ�����õ�IP��:
echo ________________________________
setlocal enabledelayedexpansion
set n=1&set wjl=0
for /f "eol=! delims=, tokens=1" %%i in (config.txt) do echo !n!.%%i&set /a n=!n!+1
if !n!==1 echo Ŀǰ��û�м�¼
endlocal
echo ________________________________
echo.
echo ��ѡ��Ҫ�л���IP���,Ҫ����IP������+,Ҫɾ��IP������-
echo ����DHCP�Զ���ȡ������auto,�˳�������quit
echo ..........................................................

set xuanze=
set /p xuanze=������:
if "%xuanze%"=="" goto start
if %xuanze%==+ goto insert
if %xuanze%==- goto delete
if %xuanze%==auto goto auto
if %xuanze%==quit goto end

set /a xuanze=%xuanze%+3
for /f "eol=! delims=: tokens=1,2" %%i in ('findstr /n . config.txt') do if "%%i"=="%xuanze%" set te=%%j
echo �л���IPΪ:%te%
for /f "delims=, tokens=1,2,3,4,5" %%a in ("%te%") do set ip=%%a&set netmasks=%%b&set gw=%%c&set dns=%%d&set dns2=%%e
goto change

:insert
set aaa=
set bbb=
set ccc=
set ddd=
set eee=
set /p aaa=������Ҫ���ӵ�ip:
if "%aaa%"=="" echo ________________________________&echo.&echo IP����Ϊ��!!!&echo ________________________________&ping -n 2 127.1>nul&goto start
set /p bbb=������Ҫ���ӵ�netmask:
if "%bbb%"=="" echo ________________________________&echo.&echo �������벻��Ϊ��!!!&echo ________________________________&ping -n 2 127.1>nul&goto start
set /p ccc=������Ҫ���ӵ�gateway:
set /p ddd=������Ҫ���ӵ�dns:
set /p eee=������Ҫ���ӵ�dns2:
@echo %aaa%,%bbb%,%ccc%,%ddd%,%eee%>>config.txt
goto start

:delete
set /p rr=Ҫɾ���ڼ���IP����:
if "%rr%"=="" echo ________________________________&echo.&echo ����Ϊ��!!!&echo ________________________________&&ping -n 2 127.1>nul&goto start
set /a rr=%rr%+3
for /f "eol=! delims=: tokens=1,2" %%i in ('findstr /n . config.txt') do if "%%i"=="%rr%" set te=%%j
set /p jueding=Ҫɾ������������:%te%,ȷ��Ҫɾ����(Y/N):
if /i not "%jueding%"=="y" goto start
for /f %%i in (config.txt) do (if not "%%i"=="%te%" echo %%i>>tem88.txt)
del config.txt
copy tem88.txt config.txt>nul
del tem88.txt
goto start

:change
echo ________________________________
echo.
echo ����%eth%��ip��...
echo ________________________________
echo.
if %gw%==none netsh interface ip set address %eth% static %ip% %netmasks% %gw% > nul
if not %gw%==none netsh interface ip set address %eth% static %ip% %netmasks% %gw% 1 > nul
netsh interface ip set dns %eth% static %dns%
netsh interface ip add dns %eth% %dns2% index=2
echo ���ĳɹ�
goto end

:auto
echo ________________________________
echo.
echo �л�%eth%��ipΪ�Զ���ȡ��...
echo ________________________________
echo.
netsh interface ip set address %eth% dhcp
netsh interface ip set dns %eth% dhcp
goto end

:end
cls