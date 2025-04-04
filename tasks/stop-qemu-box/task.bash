qemu_binary=$(config qemu_binary)

if test "$qemu_binary" = ""; then
    echo "qemu_binary is not set";
    exit 1 
fi

if which $qemu_binary; then
    :
else
    echo "$qemu_binary does not exist"
    exit 1
fi

echo "killing proccess named [$qemu_binary]"

#exit 0

ps aux | grep "$qemu_binary" | grep -v grep | grep -v sparrowdo | awk '{print "kill -9 " $2}' | sh

echo "done"
