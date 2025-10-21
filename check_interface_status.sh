#!/bin/bash
# ==============================================
# AUTO CHECK NETWORK INTERFACE STATUS
# Made by: dame
# ==============================================

echo "🔍 Mengecek status interface jaringan..."
echo "------------------------------------------"

for IFACE in /sys/class/net/*; do
    NAME=$(basename $IFACE)
    STATE=$(cat $IFACE/operstate)
    if [ "$STATE" = "up" ]; then
        echo "✅ $NAME : UP (aktif)"
    elif [ "$STATE" = "down" ]; then
        echo "❌ $NAME : DOWN (nonaktif)"
    else
        echo "⚙️  $NAME : $STATE"
    fi
done

echo "------------------------------------------"
echo "📡 Pengecekan selesai!"
