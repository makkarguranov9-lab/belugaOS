@echo off
:: Включаем поддержку UTF-8 для корректного отображения русского языка
chcp 65001 >nul
setlocal enabledelayedexpansion
title Beluga OS v1.3.1 - Multilingual Edition

:lang_select
cls
echo Select Language / Выберите язык:
echo 1. English
echo 2. Русский
set /p "ln=>> "
if "%ln%"=="1" (set "lang=en") else (if "%ln%"=="2" (set "lang=ru") else (goto lang_select))

:: --- Данные системы ---
set "USER_ID=beluga"
set "PASS_KEY=admin"
set "KING=Beluga Edits"
set "ADMIN=pirozhok_75"

:login
cls
if "%lang%"=="ru" (echo Введите ключ доступа для %USER_ID%:) else (echo Access Key for %USER_ID%:)
set /p "input_pass="
if not "!input_pass!"=="%PASS_KEY%" (
    color 0C
    if "%lang%"=="ru" (echo ОШИБКА: ДОСТУП ЗАПРЕЩЕН) else (echo ERR: ACCESS DENIED)
    pause
    color 0B
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
if "%lang%"=="ru" (
    echo  ^> v.1.3.1-STABLE ^| ОПЕРАТОР: %USER_ID% ^| СЕТЬ: ONLINE
    echo  ^> КОРОЛЬ: %KING% ^| АДМИН: %ADMIN%
) else (
    echo  ^> v.1.3.1-STABLE ^| OP: %USER_ID% ^| NET: ONLINE
    echo  ^> KING: %KING% ^| ADMIN: %ADMIN%
)
echo  --------------------------------------

:shell
set "cmd="
set /p "cmd=%USER_ID%@beluga:~$ "

if "!cmd!"=="help" (
    echo.
    if "%lang%"=="ru" (
        echo МОДУЛИ:
        echo  weather - Погода
        echo  web     - Браузер
        echo  lang    - Сменить язык
        echo  clear   - Очистить
        echo  exit    - Выход
    ) else (
        echo MODULES:
        echo  weather - Weather
        echo  web     - Browser
        echo  lang    - Change Language
        echo  clear   - Clear screen
        echo  exit    - Exit
    )
    goto shell
)

if "!cmd!"=="lang" goto lang_select

if "!cmd!"=="weather" (
    curl wttr.in?0
    goto shell
)

if "!cmd!"=="web" (
    if "%lang%"=="ru" (set /p "url=Введите URL: ") else (set /p "url=Enter URL: ")
    start https://!url!
    goto shell
)

if "!cmd!"=="clear" goto main_menu
if "!cmd!"=="exit" exit

!cmd!
goto shell
