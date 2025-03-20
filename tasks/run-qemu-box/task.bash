set -e
set -x

iso=$(config iso)

seed=$(config seed)

test -f $iso && echo "qcow2 image exists will run qemu box"

if test $os = "darwin"; then
    qemu-system-x86_64 \
    -net nic \
    -net user,hostfwd=tcp::10022-:22 \
    -m 6024M \
    -cpu max \
    -smp 8 \
    -vnc none \
    -drive "file=$iso,index=0,format=qcow2,media=disk" \
    -drive file=$seed,index=1,media=cdrom \
    -nographic
else
    qemu-system-x86_64 \
    -net nic \
    -net user,hostfwd=tcp::10022-:22 \
    -m 6024M \
    -smp 8 \
    -vnc none \
    -drive "file=$iso,index=0,format=qcow2,media=disk" \
    -drive file=$seed,index=1,media=cdrom \
    -nographic 
fi