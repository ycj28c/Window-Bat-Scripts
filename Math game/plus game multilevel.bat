@echo off
set /a n=0
set /a n1=0
set /a n2=0
:level1
cls
echo ������level1��Ϸ ��ȷ%n1%����%n2%
echo ..........................................
echo �ش���ȷ10���Ϳ��Խ�����һ��
rem setlocal enabledelayedexpansion
set /a b=%random%%%10
set /a c=%random%%%10
echo %b%+%c%=?
echo ..........................................
set /a d=%b%+%c%
set /p jieguo=������𰸣�
if  /i %jieguo%==%d% set /a n1=n1+1
if  /i not %jieguo%==%d% set /a n2=n2+1
if  /i %n1%==10 goto level2a
set /a n=n+1
echo %n%
rem endlocal
goto level1

:level2a
cls
echo _________________________________________
echo.
echo ��ϲ����level2
echo _________________________________________
ping -n 2 127.1>nul
set /a n=0
set /a n1=0
set /a n2=0
:level2
cls
echo ������level2��Ϸ ��ȷ%n1%����%n2%
echo ..........................................
echo �ش���ȷ10���Ϳ��Խ�����һ��
rem setlocal enabledelayedexpansion
set /a b=%random%%%100
set /a c=%random%%%100
echo %b%+%c%=?
echo ..........................................
set /a d=%b%+%c%
set /p jieguo=������𰸣�
if  /i %jieguo%==%d% set /a n1=n1+1
if  /i not %jieguo%==%d% set /a n2=n2+1
if  /i %n1%==10 goto level3a
set /a n=n+1
echo %n%
rem endlocal
goto level2

:level3a
cls
echo _________________________________________
echo.
echo ��ϲ����level3
echo _________________________________________
ping -n 2 127.1>nul
set /a n=0
set /a n1=0
set /a n2=0
:level3
cls
echo ������level3��Ϸ ��ȷ%n1%����%n2%
echo ..........................................
echo �ش���ȷ10���Ϳ��Խ�����һ��
rem setlocal enabledelayedexpansion
set /a b=%random%%%1000
set /a c=%random%%%1000
echo %b%+%c%=?
echo ..........................................
set /a d=%b%+%c%
set /p jieguo=������𰸣�
if  /i %jieguo%==%d% set /a n1=n1+1
if  /i not %jieguo%==%d% set /a n2=n2+1
if  /i %n1%==10 goto level4a
set /a n=n+1
echo %n%
rem endlocal
goto level3

:level4a
cls
echo _________________________________________
echo.
echo ��ϲ����level4
echo _________________________________________
ping -n 2 127.1>nul
set /a n=0
set /a n1=0
set /a n2=0
:level4
cls
echo ������level4��Ϸ ��ȷ%n1%����%n2%
echo ..........................................
echo �ش���ȷ10���Ϳ��Թ���
rem setlocal enabledelayedexpansion
set /a b=%random%%%10000
set /a c=%random%%%10000
echo %b%+%c%=?
echo ..........................................
set /a d=%b%+%c%
set /p jieguo=������𰸣�
if  /i %jieguo%==%d% set /a n1=n1+1
if  /i not %jieguo%==%d% set /a n2=n2+1
if  /i %n1%==10 goto end
set /a n=n+1
echo %n%
rem endlocal
goto level4

:end
cls
echo _________________________________________
echo.
echo ��ϲ��ͨ���ˣ���
echo _________________________________________
ping -n 2 127.1>nul
cls
@echo off 
setlocal ENABLEDELAYEDEXPANSION 
color 02
for /l %%i in (1,1,80) do ( 
set Down%%i=0 
) 
:loop 
for /l %%j in (1,1,80) do ( 
set /a Down%%j-=1 
if !down%%j! LSS 0 ( 
set /a Arrow%%j=!random!%%4 
set /a Down%%j=!random!%%15+10 
) 
if "!Arrow%%j!" == "1" ( 
set /a chr=!random!%%2 
set /p=!chr!<nul 
) else ( 
set /p= <nul 
) 
) 
goto loop