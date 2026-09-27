#!/bin/bash

echo "╔════════════════════════════════════════╗"
echo "║    Shaileshxlive FUD — Telegram Bot    ║"
echo "║    Starting...                         ║"
echo "╚════════════════════════════════════════╝"
echo ""

if ! command -v python3 &> /dev/null; then
    echo "[✗] Python3 not found!"
    exit 1
fi
if ! command -v java &> /dev/null; then
    echo "[✗] Java not found!"
    exit 1
fi

echo "[✓] Python3 OK"
echo "[✓] Java OK"
echo ""

pip3 install -q -r requirements.txt 2>/dev/null
mkdir -p telegram/data telegram/logs telegram/uploads/bot_temp telegram/outputs telegram/temp

echo "[✓] Environment ready"
echo ""

export TELEGRAM_BOT_TOKEN="8643119831:AAErlSUMWHjvQqLqT7N0VPa4GPI3DCwDJLI"
export TELEGRAM_MASTER_USERS="8739519477"
export DEVELOPER_USERNAME="@Shaileshxlive"
export BUILD_LOG_CHANNEL="-1004457898119"

echo "╔════════════════════════════════════════╗"
echo "║   Bot: Shaileshxlive FUD               ║"
echo "║   Admin: 8739519477                    ║"
echo "╚════════════════════════════════════════╝"
echo ""

cd telegram
python3 bot.py