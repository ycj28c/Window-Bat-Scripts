@echo off
title 改IP配置文件版   ----made by Ralph Yang
rem 初始化
if exist config.txt goto start
echo ________________________________
echo.
echo 配置文件不存在,初始化config.txt
echo ________________________________&ping -n 3 127.1>nul
echo !请按照规定格式书写,用逗号隔开,格式为ip,netmasks,gateway,dns1,dns2>>config.txt
echo !比如191.4.8.4,255.255.255.0,191.4.8.254,219.239.8.9,219.239.8.7>>config.txt
echo !本地连接>>config.txt
goto start

:start
for /f "delims=!: tokens=1,2" %%a in ('findstr /n . config.txt') do if "%%a"=="3" set eth=%%b
cls
echo 默认的网络连接名称是"%eth%",如不一样请改config.txt第3行
echo ..........................................................
echo.
echo 目前所配置的IP有:
echo ________________________________
setlocal enabledelayedexpansion
set n=1&set wjl=0
for /f "eol=! delims=, tokens=1" %%i in (config.txt) do echo !n!.%%i&set /a n=!n!+1
if !n!==1 echo 目前还没有记录
endlocal
echo ________________________________
echo.
echo 请选择要切换的IP编号,要增加IP请输入+,要删除IP请输入-
echo 启动DHCP自动获取请输入auto,退出请输入quit
echo ..........................................................

set xuanze=
set /p xuanze=请输入:
if "%xuanze%"=="" goto start
if %xuanze%==+ goto insert
if %xuanze%==- goto delete
if %xuanze%==auto goto auto
if %xuanze%==quit goto end

set /a xuanze=%xuanze%+3
for /f "eol=! delims=: tokens=1,2" %%i in ('findstr /n . config.txt') do if "%%i"=="%xuanze%" set te=%%j
echo 切换的IP为:%te%
for /f "delims=, tokens=1,2,3,4,5" %%a in ("%te%") do set ip=%%a&set netmasks=%%b&set gw=%%c&set dns=%%d&set dns2=%%e
goto change

:insert
set aaa=
set bbb=
set ccc=
set ddd=
set eee=
set /p aaa=请输入要增加的ip:
if "%aaa%"=="" echo ________________________________&echo.&echo IP不能为空!!!&echo ________________________________&ping -n 2 127.1>nul&goto start
set /p bbb=请输入要增加的netmask:
if "%bbb%"=="" echo ________________________________&echo.&echo 子网掩码不能为空!!!&echo ________________________________&ping -n 2 127.1>nul&goto start
set /p ccc=请输入要增加的gateway:
set /p ddd=请输入要增加的dns:
set /p eee=请输入要增加的dns2:
@echo %aaa%,%bbb%,%ccc%,%ddd%,%eee%>>config.txt
goto start

:delete
set /p rr=要删除第几个IP设置:
if "%rr%"=="" echo ________________________________&echo.&echo 不能为空!!!&echo ________________________________&&ping -n 2 127.1>nul&goto start
set /a rr=%rr%+3
for /f "eol=! delims=: tokens=1,2" %%i in ('findstr /n . config.txt') do if "%%i"=="%rr%" set te=%%j
set /p jueding=要删除的行内容是:%te%,确定要删除吗(Y/N):
if /i not "%jueding%"=="y" goto start
for /f %%i in (config.txt) do (if not "%%i"=="%te%" echo %%i>>tem88.txt)
del config.txt
copy tem88.txt config.txt>nul
del tem88.txt
goto start

:change
echo ________________________________
echo.
echo 更改%eth%的ip中...
echo ________________________________
echo.
if %gw%==none netsh interface ip set address %eth% static %ip% %netmasks% %gw% > nul
if not %gw%==none netsh interface ip set address %eth% static %ip% %netmasks% %gw% 1 > nul
netsh interface ip set dns %eth% static %dns%
netsh interface ip add dns %eth% %dns2% index=2
echo 更改成功
goto end

:auto
echo ________________________________
echo.
echo 切换%eth%的ip为自动获取中...
echo ________________________________
echo.
netsh interface ip set address %eth% dhcp
netsh interface ip set dns %eth% dhcp
goto end

:end
cls