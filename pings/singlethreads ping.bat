title ping single thread
del live1.txt
for /f "tokens=1,2" %%a in (ip.txt) do (ping %%b -n 1 -w 10>nul&&echo %%a %%b - OK!>>live1.txt||echo %%a %%b - ERROR!>>live1.txt) 
exit


rem Author Ralph Yang
