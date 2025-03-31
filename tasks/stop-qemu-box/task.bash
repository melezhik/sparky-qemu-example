qemu_binary=$(config qemu_binary)

ps aux | grep "${qemu_binary}" | grep -v grep | awk '{print "kill -9 " $2}' | sh
#ps aux | grep "${qemu_binary}" | grep -v grep | awk '{print "kill -9 " $2}'

echo "done"
