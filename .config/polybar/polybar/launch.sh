polybar_is_running() {
    pgrep -u $UID -x polybar >/dev/null
}

if polybar_is_running; then
    killall -q polybar
    sleep 1
    echo "Polybar encerrado..."
else
    polybar -c ~/.config/polybar/config.ini main &
    polybar -c ~/.config/polybar/config.ini second & 
    echo "Polybar iniciado..."
fi

