@echo off
@echo off
mode con cols=46 lines=26
set /a n=0
:qie1
cls
echo.&echo.&echo.
echo　                 ◢██◣  
echo　            　　 █⊙⊙█  
echo            　  　◤ -- ◥  
echo            　  ◢▂▂▂▂◣  
echo              　◤  　　　◥  
echo              　　╲▁▁╱  
echo              　　╯╜╙╰
set /a n+=1
if %n%==10 goto end
ping/n 1 127.1>nul
goto qie2
:qie2
cls
echo.&echo.&echo.
echo                  ◢██◣  
echo            　　　█⊙⊙█  
echo            　　　◤ \/ ◥  
echo            　◢◤▂▂▂▂◥◣  
echo              　 {　　    } 
echo　            　 　╲▁▁╱  
echo　            　 　╯╜╙╰
ping/n 1 127.1>nul
goto qie1
:end
echo.&echo.&echo.
echo Happy Birthday To You&echo.
mshta vbscript:CreateObject("SAPI.SpVoice").Speak("Happy birthday to you!")(Window.close)
echo Mr GAO&echo.
mshta vbscript:CreateObject("SAPI.SpVoice").Speak("MR kao")(Window.close)
echo Year Year Young&echo.
mshta vbscript:CreateObject("SAPI.SpVoice").Speak("year year young!")(Window.close) 
echo Day Day Up&echo.
mshta vbscript:CreateObject("SAPI.SpVoice").Speak("day day up")(Window.close)   
cls
for /l %%a in (1,1,250)do (
cls
for /l %%b in (1,6,7)do (  
color %%bf  
)) 
echo.&echo.&echo. 
echo           。▍ ★∴ 
echo ．．．．▍▍.．   █▍ ☆ ★∵   ..../  
echo ◥ 祝你  █ 永远 ██ 快乐     ██◤  
echo   ◥███████████████◤ 
echo     ◥█████████████◤
ping 127.1 -n 2 >nul
echo.&echo.
setlocal enabledelayedexpansion
set aa=祝你如这艘船一样
set bb=越开越远
set cc=越开越宽广
set dd=越开越无阻碍
set ee=越开越心情舒畅
set ff=越开越接近胜利岛
echo/&echo\
for %%i in (aa bb cc dd ee ff) do (
        set/p=      <nul
        for /l %%a in (0,1,100) do (
                if not "!%%i:~%%a,1!"=="" (
                        if %%a==24 echo.&echo;
                        set/p= !%%i:~%%a,1!<nul
                        ping 127.1 -n 1 >nul
                )
        )
echo.&echo.
)
pause