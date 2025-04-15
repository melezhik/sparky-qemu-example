echo "about to reboot this machine ..."

0<&-

nohup bash -c 'sleep 10 && sudo reboot now'  1>/dev/null 2>/dev/null &

echo "reboot will happen in 10 secs, bye!!!"