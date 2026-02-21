@echo off
:: Исправляем кодировку, чтобы текст отображался правильно
chcp 65001 >nul
setlocal enabledelayedexpansion
title Beluga OS v1.3.1 - Windows Edition
color 0B

:: --- Данные ---
set "USER_ID=beluga"
set "PASS_KEY=admin"
set "VERSION=1.3.1-STABLE"
set "KING=Beluga Edits"
set "ADMIN=pirozhok_75"

:login
cls
echo Access Key for %USER_ID%:
set /p "input_pass="
if not "!input_pass!"=="%PASS_KEY%" (
    color 0C
    echo ERR: ACCESS DENIED
    pause
    goto login
)

:main_menu
cls
color 0B
echo   ____  ______ _      _    _  _____  
echo  ^|  _ \^|  ____^| ^|    ^| ^|  ^| ^|/ ____^| 
echo  ^| ^|_) ^| ^|__  ^| ^|    ^| ^|  ^| ^| ^|  __  
echo  ^|  _ ^<^|  __^| ^| ^|    ^| ^|  ^| ^| ^| ^|_ ^| / /\\ \\ 
echo  ^| ^|_) ^| ^|____^| ^|____^| ^|__^| ^| ^|__^| ^|/ ____ \\ 
echo  ^|____/^|______^|______^|\____/ \\_____/_/    \\_\\ OS
echo.
echo  ^> v.%VERSION% ^| OP: %USER_ID% ^| NET: ONLINE
echo  ^> КОРОЛЬ: %KING% ^| АДМИН: %ADMIN%
echo  --------------------------------------
echo.

:shell
set "cmd="
set /p "cmd=%USER_ID%@beluga:~$ "

if "!cmd!"=="help" (
    echo.
    echo МОДУЛИ:
    echo  weather - Погода
    echo  web     - Браузер
    echo  info    - О создателях
    echo  hack    - Взлом
    echo  clear   - Очистить
    echo  exit    - Выход
    goto shell
)

if "!cmd!"=="weather" (
    curl wttr.in?0
    goto shell
)

if "!cmd!"=="web" (
    set /p "url=URL: "
    start https://!url!
    goto shell
)

if "!cmd!"=="info" (
    echo Created by %KING% and %ADMIN%
    goto shell
)

if "!cmd!"=="hack" (
    echo Bruteforcing...
    timeout /t 1 >nul
    echo Success!
    goto shell
)

if "!cmd!"=="clear" goto main_menu
if "!cmd!"=="exit" exit

:: Чтобы не вылетало при вводе любой другой команды
!cmd!
goto shell
