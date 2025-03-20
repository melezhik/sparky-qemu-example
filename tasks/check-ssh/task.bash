host=$(config host)
user=$(config user)
port=$(config port)

if ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no -p $port -u $user $host uptime; then
    echo '{ "state" : "alive" }' > $cache_root_dir/state.json
else
    echo '{ "state" : "" }' > $cache_root_dir/state.json
fi