

@echo off


:: Safe mode speciall actions
if exist %programdata%\safe-edge.lbool goto EDGE-SM-ACTIVE
if exist %programdata%\safe-defender.lbool goto DEF-SM-ACTIVE

::window size
mode con cols=80 lines=25
:: or just mode 80, 30

::Using UTF-8 Encoding special characters
chcp 65001 >nul

::Colors for batch
set gr=[0;32m
set rd=[0;31m
set wh=[0m
set b=[96m
set b=[96m
set grey=[38;5;238m


::Set values
set local=1.0

setlocal enabledelayedexpansion

:: Check for admin permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
echo.			   %b%__             __    __       
echo.			  / /  __ __  ___/ /__ / /____ __
echo.			 / _ \/ // / / _  / -_)  '_/ // /%wh%
echo.			/_.__/\_, /  \_,_/\__/_/\_\\_,_/ 
echo.			     /___/                                                   			
echo %rd%                  ╔═════════════════════════════════════════╗
echo %rd%                  ║ [%wh%-%rd%] %wh%Version: %rd%%local%                        %rd%║
echo %rd%                  ║ [%wh%-%rd%] %wh%Build: %rd%Develop                      %rd%║
echo %rd%                  ║ [%wh%-%rd%] %wh%Created by: %rd%Deku                    %rd%║
echo %rd%                  ║ [%wh%-%rd%] %wh%Last update: %rd%15.03.2023             %rd%║
echo %rd%                  ╚═════════════════════════════════════════╝%wh%


goto :update



:update

set localtwo=%local%
if exist "%temp%\dUPDATER.bat" DEL /S /Q /F "%temp%\dUPDATER.bat" >nul 2>&1
curl -g -L -# -o "%temp%\dUPDATER.bat" "https://raw.githubusercontent.com/DekuCS/optimizer/main/resources/version" >nul 2>&1
call "%temp%\dUPDATER.bat"
if "%local%" gtr "%localtwo%" (
echo.
echo. 		   	   %gr%A NEW UPDATE IS AVAILABLE!
echo.
echo.	%grey%[%rd%1%grey%] %wh%Update to latest version		%grey%[%rd%2%grey%] %wh%Dont update
echo.



)
pause

