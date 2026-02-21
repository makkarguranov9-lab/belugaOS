@echo off
:: Фикс кодировки (чтобы не было кракозябр)
chcp 65001 >nul
setlocal enabledelayedexpansion
title Beluga OS v1.3.1 - Stable

set "USER_ID=beluga"
set "PASS_KEY=admin"

:login
cls
echo ========================================
echo   ДОСТУП ЗАБЛОКИРОВАН. ВВЕДИТЕ КЛЮЧ.
echo ========================================
set /p "input_pass=Key: "
if not "!input_pass!"=="%PASS_KEY%" (
    echo [!] ОШИБКА: НЕВЕРНЫЙ КЛЮЧ.
    timeout /t 2 >nul
    goto login
)

:main_menu
cls
echo   ____  ______ _      _    _  _____  
echo  ^|  _ \^|  ____^| ^|    ^| ^|  ^| ^|/ ____^| 
echo  ^| ^|_) ^| ^|__  ^| ^|    ^| ^|  ^| ^| ^|  __  
echo  ^|  _ ^<^|  __^| ^| ^|    ^| ^|  ^| ^| ^| ^|_ ^| / /\\ \\ 
echo  ^| ^|_) ^| ^|____^| ^|____^| ^|__^| ^| ^|__^| ^|/ ____ \\ 
echo  ^|____/^|______^|______^|\____/ \\_____/_/    \\_\\ OS
echo.
echo  ^> v.1.3.1 ^| OP: %USER_ID% ^| NET: ONLINE
echo  ------------------------------------------

:shell
:: Метка shell и goto в конце не дадут программе вылететь
set "user_cmd="
set /p "user_cmd=%USER_ID%@beluga:~$ "

if "!user_cmd!"=="exit" exit
if "!user_cmd!"=="clear" goto main_menu
if "!user_cmd!"=="" goto shell

:: Выполнение команды
!user_cmd!

echo.
:: Возвращаемся к вводу, чтобы окно не закрылось
goto shell
