@echo off 
taskkill.exe /F /IM java.exe 
cd c:\OktoPOS 
 
if  exist backup deldir backup /s /q 
ROBOCOPY "OktoDesk\lib" "backup\lib" /MIR 
goto :COPY 
 
if exist C:\OktoPOS\update\OktoDesk\lib XCOPY "C:\OktoPOS\update\OktoDesk\lib" "C:\OktoPOS\OktoDesk\lib" /S /Y 
goto :1 
 
:1 
apply -p1 OktoDesk\config\design.ini < update\config\patch_design.txt 
goto :2 
 
:2 
apply -p1 OktoDesk\config\devices.ini < update\config\patch_devices.txt 
goto :3 
 
:3 
apply -p1 OktoDesk\config\network.ini < update\config\patch_network.txt 
goto :4 
 
:4 
apply -p1 OktoDesk\config\payment.ini < update\config\patch_payment.txt 
goto :5 
  
:5 
apply -p1 OktoDesk\config\workflow.ini < update\config\patch_workflow.txt 
