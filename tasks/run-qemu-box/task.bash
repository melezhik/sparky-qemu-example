set -e

iso=$(config iso)

seed=$(config seed)

qemu_binary=$(config qemu_binary)

echo "qemu_binary: $qemu_binary"

test -f $iso && echo "qcow2 image exists"
test -f $seed && echo "seed image exists"

if test $os = "darwin"; then
    $qemu_binary \
    -net nic \
    -net user,hostfwd=tcp::10022-:22 \
    -m 3024M \
    -cpu max \
    -smp 8 \
    -vnc none \
    -drive "file=$iso,index=0,format=qcow2,media=disk" \
    -drive file=$seed,index=1,media=cdrom \
    -nographic
else
    $qemu_binary \
    -net nic \
    -net user,hostfwd=tcp::10022-:22 \
    -m 6024M \
    -cpu max \
    -smp 8 \
    -vnc none \
    -drive "file=$iso,index=0,format=qcow2,media=disk" \
    -drive file=$seed,index=1,media=cdrom \
    -nographic
fi
