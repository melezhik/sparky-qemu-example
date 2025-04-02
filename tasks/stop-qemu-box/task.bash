qemu_binary=$(config qemu_binary)

if test "$qemu_binary" = ""; then
    echo "qemu_binary is not set";
    exit 1 
fi

which $qemu_binary || exit 1

echo "killing by $qemu_binary"

ps aux | grep "$qemu_binary" | grep -v grep | awk '{print "kill -9 " $2}' | sh
#ps aux | grep "${qemu_binary}" | grep -v grep | awk '{print "kill -9 " $2}'

echo "done"
