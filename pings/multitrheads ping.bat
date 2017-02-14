title ping multiple threads
del live.txt
if [%1]==[] (Goto :Start) else (Goto :Ping) 

:Start
        echo.É¨ÃèÊ±¼ä:%date% %time%>live.txt
        for /f "tokens=1,2" %%a in (ip.txt) do start %~s0 %%b %%a   
        Goto :eof

:Ping 
        ping %1 -n 1 -w 10 >nul&&echo %1 %2 - OK!>>live.txt||echo %1 %2 - ERROR!>>live.txt
        exit


rem Author Ralph Yang
rem reference http://www.cn-dos.net/forum/viewthread.php?tid=26056

