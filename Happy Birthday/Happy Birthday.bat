@echo off
@echo off
mode con cols=46 lines=26
set /a n=0
:qie1
cls
echo.&echo.&echo.
echo��                 ��������  
echo��            ���� ���ѡѨ�  
echo            ��  ���� -- ��  
echo            ��  ���y�y�y�y��  
echo              ����  ��������  
echo              �����v�x�x�u  
echo              �����s�`�]�t
set /a n+=1
if %n%==10 goto end
ping/n 1 127.1>nul
goto qie2
:qie2
cls
echo.&echo.&echo.
echo                  ��������  
echo            ���������ѡѨ�  
echo            �������� \/ ��  
echo            �������y�y�y�y����  
echo              �� {����    } 
echo��            �� ���v�x�x�u  
echo��            �� ���s�`�]�t
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
echo           ���� ��� 
echo ������������.��   ���� �� ���   ..../  
echo �� ף��  �� ��Զ ���� ����     ������  
echo   ���������������������������������� 
echo     ������������������������������
ping 127.1 -n 2 >nul
echo.&echo.
setlocal enabledelayedexpansion
set aa=ף�������Ҵ�һ��
set bb=Խ��ԽԶ
set cc=Խ��Խ���
set dd=Խ��Խ���谭
set ee=Խ��Խ�����泩
set ff=Խ��Խ�ӽ�ʤ����
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